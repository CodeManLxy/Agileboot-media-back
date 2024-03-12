package com.agileboot.domain.cos.media.model;

import com.agileboot.domain.cos.media.db.entity.CosMediaEntity;
import com.agileboot.domain.cos.media.db.service.MediaService;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 10:49
 */
public class MediaModel extends CosMediaEntity {

    private final MediaService mediaService;

    public MediaModel(MediaService mediaService) {
        this.mediaService = mediaService;
    }


    public Integer upload(MultipartFile[] files, Long groupId) {
        List<CosMediaEntity> list = mediaService.upload(files, groupId);
        if (!CollectionUtils.isEmpty(list)) {
            return saveBatch(list);
        }
        return 0;
    }


    public Integer saveBatch(List<CosMediaEntity> list) {
        return mediaService.saveBatch(list);
    }

    public Integer delete(Long id) {
        return mediaService.delete(id);
    }
}
