package com.agileboot.domain.cos.media.db.service.impl;

import com.agileboot.common.exception.ApiException;
import com.agileboot.common.exception.error.ErrorCode;
import com.agileboot.domain.cos.media.db.entity.CosMediaEntity;
import com.agileboot.domain.cos.media.db.mapper.MediaMapper;
import com.agileboot.domain.cos.media.db.service.MediaService;
import com.agileboot.infrastructure.config.minio.bean.MinIoResponse;
import com.agileboot.infrastructure.config.minio.conf.MinioConf;
import com.agileboot.infrastructure.config.minio.util.MinioUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 10:35
 */
@Service
public class MediaServiceImpl implements MediaService {

    @Resource
    private MediaMapper mediaMapper;

    @Resource
    private MinioUtils minioUtils;

    @Resource
    private MinioConf minioConf;

    @Override
    public IPage<CosMediaEntity> list(Long groupId, Integer pageNum, Integer pageSize) {
        IPage<CosMediaEntity> page = new Page<>(pageNum, pageSize);
        QueryWrapper<CosMediaEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("group_id", groupId);
        IPage<CosMediaEntity> pageResult = mediaMapper.selectPage(page, queryWrapper);
        for (CosMediaEntity item : pageResult.getRecords()) {
            String url = item.getImgUrl();
            String objectName = minioUtils.extObjectName(url);
            String bucketName = minioUtils.extBucketName(url);
            String viewUrl = minioUtils.getDownloadUrl(bucketName, objectName);
            item.setImgUrl(viewUrl);
        }

        return pageResult;
    }

    @Override
    public Integer saveBatch(List<CosMediaEntity> list) {
        return mediaMapper.saveBatch(list);

    }

    @Override
    public List<CosMediaEntity> upload(MultipartFile[] files, Long groupId) {
        List<CosMediaEntity> mediaList = new ArrayList<>();
        try {
            for (MultipartFile file : files) {
                String savePath = groupId + "/" + System.currentTimeMillis() + file.getOriginalFilename();
                MinIoResponse minIoResponse = minioUtils.uploadFile(file, minioConf.getCosImg(), savePath, 1);
                mediaList.add(CosMediaEntity.builder()
                        .imgUrl(minIoResponse.getObjectUrl())
                        .groupId(groupId)
                        .build());
            }
            return mediaList;
        } catch (Exception e) {
            throw new ApiException(ErrorCode.Business.UPLOAD_FILE_FAILED);
        }
    }

    @Override
    public Integer delete(Long id) {
        CosMediaEntity entity = mediaMapper.selectById(id);
        if (ObjectUtils.isEmpty(entity)) {
            throw new ApiException(ErrorCode.Business.COMMON_OBJECT_NOT_FOUND, id);
        }
        String url = entity.getImgUrl();
        // 删除 url
        String objectName = minioUtils.extObjectName(url);
        String bucketName = minioUtils.extBucketName(url);
        minioUtils.deleteObject(bucketName, objectName);
        // 删除 sql
        return mediaMapper.deleteById(id);
    }
}
