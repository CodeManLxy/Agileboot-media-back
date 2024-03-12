package com.agileboot.infrastructure.config.minio.util;



import com.agileboot.common.exception.ApiException;
import com.agileboot.common.exception.error.ErrorCode;
import com.agileboot.infrastructure.config.minio.bean.MinIoResponse;
import com.agileboot.infrastructure.config.minio.conf.MinioConf;
import io.minio.*;
import io.minio.http.Method;
import io.minio.messages.Bucket;
import io.minio.messages.Item;
import io.minio.messages.Tags;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author luXinYu
 * @create 2023/9/7 16:10
 */
@Slf4j
@Component
public class MinioUtils {

    @Autowired
    private MinioClient client;
    @Autowired
    private MinioConf conf;

    /**
     * 创建bucket
     *
     * @param bucketName bucket名称
     */
    @SneakyThrows
    public void createBucket(String bucketName) {

        if (!bucketExists(bucketName)) {
            makeBucket(bucketName);
        }
    }

    /**
     * 创建存储桶
     *
     * @param bucketName 桶名
     */
    @SneakyThrows
    public void makeBucket(String bucketName) {
        if (!bucketExists(bucketName)) {
            client.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
        }
    }


    /**
     * 普通上传文件
     *
     * @param file       文件
     * @param bucketName 存储桶
     * @return
     */
    @Transactional
    public MinIoResponse uploadFile(MultipartFile file, String bucketName, String modelVersion) throws Exception {
        // 判断上传文件是否为空
        if (null == file || 0 == file.getSize()) {
            throw new ApiException(ErrorCode.Business.UPLOAD_FILE_IS_EMPTY);
        }
        try {
            // 判断存储桶是否存在
            if (StringUtils.isEmpty(bucketName)) {
                bucketName = conf.getCosImg();
            } else {
                // 判断存储桶是否存在
                createBucket(bucketName);
            }
            // 文件名 新的文件名  版本_文件名.后缀名
            String originalFilename = modelVersion + "_" + file.getOriginalFilename();
            //文件格式
            String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
            // 开始上传
            client.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(originalFilename)
                    .stream(file.getInputStream(), file.getSize(), -1)
                    .build());
            String url = getObjectInfo(bucketName, originalFilename);
            return MinIoResponse.builder()
                    .objectUrl(url)
                    .fileFormat(fileFormat)
                    .build();
        } catch (Exception e) {
            log.error("上传文件失败：{}", e.getMessage());
        }
        return null;
    }


    @Transactional
    public MinIoResponse uploadFile(MultipartFile file, String bucketName, String object, Integer type) throws Exception {
        // 判断上传文件是否为空
        if (null == file || 0 == file.getSize()) {
            throw new ApiException(ErrorCode.Business.UPLOAD_FILE_IS_EMPTY);
        }
        try {
            // 判断存储桶是否存在
            if (StringUtils.isEmpty(bucketName)) {
                bucketName = conf.getCosImg();
            } else {
                // 判断存储桶是否存在
                createBucket(bucketName);
            }
            //文件格式
            String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
            // 开始上传
            client.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(object)
                    .stream(file.getInputStream(), file.getSize(), -1)
                    .build());
            String url = getObjectInfo(bucketName, object);
            return MinIoResponse.builder()
                    .objectUrl(url)
                    .fileFormat(fileFormat)
                    .build();
        } catch (Exception e) {
            log.error("上传文件失败：{}", e.getMessage());
        }
        return null;
    }

    @Transactional
    public MinIoResponse uploadFile(InputStream inputStream, String originalFilename, Long size, String bucketName, String modelVersion) throws Exception {
        // 判断上传文件是否为空
        if (null == inputStream || 0 == size) {
            throw new ApiException(ErrorCode.Business.UPLOAD_FILE_IS_EMPTY);
        }
        try {
            // 判断存储桶是否存在
            if (StringUtils.isEmpty(bucketName)) {
                bucketName = conf.getCosImg();
            } else {
                // 判断存储桶是否存在
                createBucket(bucketName);
            }
            // 文件名 新的文件名  版本_文件名.后缀名
            originalFilename = modelVersion + "_" + originalFilename;
            //文件格式
            String fileFormat = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            // 开始上传
            client.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(originalFilename)
                    .stream(inputStream, size, -1)
                    .build());
            String url = getObjectInfo(bucketName, originalFilename);
            return MinIoResponse.builder()
                    .objectUrl(url)
                    .fileFormat(fileFormat)
                    .build();
        } catch (Exception e) {
            log.error("上传文件失败：{}", e.getMessage());
        } finally {
            inputStream.close();
        }
        return null;
    }

    /**
     * 查询所有存储桶
     *
     * @return Bucket 集合
     */
    @SneakyThrows
    public List<Bucket> listBuckets() {

        return client.listBuckets();
    }

    /**
     * 查询文件大小
     *
     * @return Bucket 集合
     */
    @SneakyThrows
    public Long getObjectSize(String bucketName, String objectName) {
        return client.statObject(StatObjectArgs.builder().bucket(bucketName).object(objectName).build()).size();
    }

    /**
     * 删除一个空桶 如果存储桶存在对象不为空时，删除会报错。
     *
     * @param bucketName 桶名
     */
    @SneakyThrows
    public void removeBucket(String bucketName) {
        removeBucket(bucketName, false);
        client.removeBucket(RemoveBucketArgs.builder().bucket(bucketName).build());
    }

    /**
     * 删除一个桶 根据桶是否存在数据进行不同的删除
     * 桶为空时直接删除
     * 桶不为空时先删除桶中的数据，然后再删除桶
     *
     * @param bucketName 桶名
     */
    @SneakyThrows
    public void removeBucket(String bucketName, boolean bucketNotNull) {
        if (bucketNotNull) {
            deleteBucketAllObject(bucketName);
        }
        client.removeBucket(RemoveBucketArgs.builder().bucket(bucketName).build());
    }


    /**
     * 删除桶中所有的对象
     *
     * @param bucketName 桶对象
     */
    @SneakyThrows
    public void deleteBucketAllObject(String bucketName) {
        List<String> list = listObjectNames(bucketName);
        if (!list.isEmpty()) {
            for (String objectName : list) {
                deleteObject(bucketName, objectName);
            }
        }
    }

    /**
     * 删除一个对象
     *
     * @param bucketName 桶名
     * @param objectName 对象名
     */
    @SneakyThrows
    public void deleteObject(String bucketName, String objectName) {
        client.removeObject(RemoveObjectArgs.builder()
                .bucket(bucketName)
                .object(objectName)
                .build());
    }

    /**
     * 查询桶中所有的对象名
     *
     * @param bucketName 桶名
     * @return objectNames
     */
    @SneakyThrows
    public List<String> listObjectNames(String bucketName) {
        List<String> objectNameList = new ArrayList<>();
        if (bucketExists(bucketName)) {
            Iterable<Result<Item>> results = listObjects(bucketName, true);
            for (Result<Item> result : results) {
                String objectName = result.get().objectName();
                objectNameList.add(objectName);
            }
        }
        return objectNameList;
    }

    /**
     * 查询桶的对象信息
     *
     * @param bucketName 桶名
     * @param recursive  是否递归查询
     * @return 桶的对象信息
     */
    @SneakyThrows
    public Iterable<Result<Item>> listObjects(String bucketName, boolean recursive) {
        return client.listObjects(
                ListObjectsArgs.builder()
                        .bucket(bucketName)
                        .recursive(recursive)
                        .build());
    }

    @SneakyThrows
    public Iterable<Result<Item>> listObjects(String bucketName, String prefix, boolean recursive) {
        return client.listObjects(
                ListObjectsArgs.builder()
                        .prefix(prefix)
                        .bucket(bucketName)
                        .recursive(recursive)
                        .build());
    }


    @SneakyThrows
    public Iterable<Result<Item>> listObjects(String bucketName, String prefix, boolean recursive, Integer pageSize, String pageMark) {

        return client.listObjects(
                ListObjectsArgs.builder()
                        .prefix(prefix)
                        .bucket(bucketName)
                        .recursive(recursive)
                        .maxKeys(pageSize)
                        .startAfter(pageMark)
                        .build());
    }


    @SneakyThrows
    public Tags getObjectTags(String bucketName, String object) {
        return client.getObjectTags(GetObjectTagsArgs.builder()
                .bucket(bucketName)
                .object(object)
                .build());

    }

    @SneakyThrows
    public void setObjectsTags(String bucketName, String object, Map<String, String> tags) {
        client.setObjectTags(SetObjectTagsArgs.builder()
                .bucket(bucketName)
                .tags(tags)
                .object(object)
                .build());
    }


    /**
     * 桶是否存在
     *
     * @param bucketName 桶名
     * @return 是否存在
     */
    @SneakyThrows
    public boolean bucketExists(String bucketName) {
        return client.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
    }

    /**
     * 返回存储信息
     *
     * @param bucketName       桶名
     * @param originalFilename Oss文件
     * @return 临时带签名、Get请求方式的访问URL
     */
    @SneakyThrows
    public String getObjectInfo(String bucketName, String originalFilename) {
        StatObjectResponse statObjectResponse = client.statObject(StatObjectArgs.builder()
                .bucket(bucketName)
                .object(originalFilename)
                .build());
        return statObjectResponse.toString();
    }

    /**
     * 获取文件下载链接
     *
     * @param bucketName
     * @param originalFilename
     * @return
     */
    @SneakyThrows
    public String getDownloadUrl(String bucketName, String originalFilename) {
        return client.getPresignedObjectUrl(
                GetPresignedObjectUrlArgs.builder()
                        .method(Method.GET)
                        .bucket(bucketName)
                        .object(originalFilename)
                        .build());

    }

    /**
     * 上传本地文件
     *
     * @param bucketName
     * @param object
     * @param fileInputStream
     * @return
     */
    @SneakyThrows
    public ObjectWriteResponse putObject(String bucketName, String object, FileInputStream fileInputStream) {
        return client.putObject(PutObjectArgs.builder()
                .bucket(bucketName)
                .object(object)
                .stream(fileInputStream, fileInputStream.available(), -1)
                .contentType("application/octet-stream")
                .build());
    }

    @SneakyThrows
    public void downloadObject(String fileName, String object, String bucketName) {
        client.downloadObject(DownloadObjectArgs.builder()
                .filename(fileName)
                .object(object)
                .bucket(bucketName)
                .build());
    }

    @SneakyThrows
    public void uploadObject(UploadObjectArgs uploadObjectArgs) {
        client.uploadObject(uploadObjectArgs);
    }


    @SneakyThrows
    public void uploadFolder(String bucket, String prefix, String folderPath) {
        // 遍历文件夹
        try {
            Files.walkFileTree(Paths.get(folderPath), new SimpleFileVisitor<Path>() {
                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    log.info("文件{} ", file.toAbsolutePath().toString().replace("\\", "/"));
                    System.out.println("文件: " + file.toAbsolutePath().toString().replace("\\", "/"));
                    String tmpPath = file.toAbsolutePath().toString().replace(folderPath, "").replace("\\", "/");
                    UploadObjectArgs uploadObjectArgs = UploadObjectArgs.builder()
                            .bucket(bucket)
                            .object(prefix + tmpPath)
                            .filename(file.toAbsolutePath().toString().replace("\\", "/"))
                            .build();
                    try {
                        log.info("bucket :", bucket);
                        log.info("object :{}{}", prefix, tmpPath);
                        System.out.println("bucket :" + bucket);
                        System.out.println("object :" + prefix + tmpPath);
                        client.uploadObject(uploadObjectArgs);
                        Files.delete(Paths.get(file.toAbsolutePath().toString()));
                    } catch (Exception e) {
                        e.printStackTrace();
                        log.error("uploadFolder exception{}", e.toString());
                    }
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                    //                System.out.println("文件夹: " + dir.toAbsolutePath());
                    return FileVisitResult.CONTINUE;
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            log.error("uploadFolder exception{}", e.toString());
        }
    }

    @SneakyThrows
    public InputStream getObject(String bucketName, String objectName) {
        return client.getObject(GetObjectArgs.builder()
                .bucket(bucketName)
                .object(objectName)
                .build());
    }

    public MinIoResponse uploadScriptFile(Resource file, String scriptBucketName, String preName, String fileName) {
        // 判断上传文件是否为空
        try {
            // 判断存储桶是否存在
            if (StringUtils.isEmpty(scriptBucketName)) {
                scriptBucketName = conf.getCosImg();
            } else {
                // 判断存储桶是否存在
                createBucket(scriptBucketName);
            }
            // 文件名 新的文件名  版本_文件名.后缀名
            String originalFilename = preName + "_" + fileName;
            //文件格式
            String fileFormat = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 开始上传
            client.putObject(PutObjectArgs.builder()
                    .bucket(scriptBucketName)
                    .object(originalFilename)
                    .stream(file.getInputStream(), file.contentLength(), -1)
                    .build());
            String url = getObjectInfo(scriptBucketName, originalFilename);
            return MinIoResponse.builder()
                    .objectUrl(url)
                    .fileFormat(fileFormat)
                    .build();
        } catch (Exception e) {
            log.error("上传文件失败：{}", e.getMessage());
            throw new ApiException(ErrorCode.Business.UPLOAD_FILE_FAILED);
        }
    }

    public String extObjectName(String objectUrl) {
        String bucket = objectUrl.replaceAll(".*bucket=(.*?),.*", "$1");
        return objectUrl.replaceAll(".*object=(.*?),.*", "$1");
    }

    public String extBucketName(String objectUrl) {
        return objectUrl.replaceAll(".*bucket=(.*?),.*", "$1");

    }
}
