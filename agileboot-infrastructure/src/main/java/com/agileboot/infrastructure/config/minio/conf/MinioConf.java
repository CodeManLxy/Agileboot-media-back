package com.agileboot.infrastructure.config.minio.conf;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author luXinYu
 * @create 2023/9/7 16:04
 */
@Data
@Component
@ConfigurationProperties(prefix = "minio")
public class MinioConf {

    /**
     * 连接url
     */
    @Value("${minio.url}")
    private String url;
    /**
     * 用户名
     */
    @Value("${minio.access}")
    private String access;
    /**
     * 密码
     */
    @Value("${minio.secret-key}")
    private String secretKey;




    @Value("${minio.back-ground-bucket-name}")
    private String bgImgBucket;

    @Value("${minio.cos-img-bucket-name}")
    private String cosImg;

    /**
     * 分片大小
     */
    @Value("${minio.chunk_size}")
    private Long defaultChunkSize;

    /**
     * 过期时间
     */
    @Value("${minio.expire_time}")
    private Long expireTime;


    @Value("${minio.default-folder-zip}")
    private String defaultFolderZip;

    @Value("${minio.default-folder-info}")
    private String defaultFolderInfo;



}
