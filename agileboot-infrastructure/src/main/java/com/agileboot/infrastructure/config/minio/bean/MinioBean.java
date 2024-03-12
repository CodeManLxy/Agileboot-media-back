package com.agileboot.infrastructure.config.minio.bean;



import com.agileboot.infrastructure.config.minio.conf.MinioConf;
import io.minio.MinioClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author luXinYu
 * @create 2023/9/7 16:04
 */
@Configuration
public class MinioBean {

    @Autowired
    private MinioConf conf;

    /**
     * 获取 MinioClient
     *
     * @return
     */
    @Bean
    public MinioClient minioClient() {
        return MinioClient.builder().endpoint(conf.getUrl()).credentials(conf.getAccess(), conf.getSecretKey()).build();
    }




}
