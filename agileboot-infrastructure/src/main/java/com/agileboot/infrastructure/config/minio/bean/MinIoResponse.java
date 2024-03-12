package com.agileboot.infrastructure.config.minio.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author luXinYu
 * @create 2023/9/7 16:34
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MinIoResponse {

    /**
     * 路径
     */
    private String objectUrl;


    /**
     * 分片id
     */
    private String uploadId;

    private String fileFormat;


}
