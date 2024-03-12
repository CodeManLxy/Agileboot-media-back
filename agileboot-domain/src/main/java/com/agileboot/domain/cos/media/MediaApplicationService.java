package com.agileboot.domain.cos.media;

import com.agileboot.domain.cos.media.db.entity.CosMediaEntity;
import com.agileboot.domain.cos.media.db.service.MediaService;
import com.agileboot.domain.cos.media.model.MediaModel;
import com.agileboot.domain.cos.media.model.MediaModelFactory;
import com.agileboot.domain.system.dept.model.DeptModel;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * @author luXinYu
 * @create 2024/3/11 16:03
 */
@Service
@RequiredArgsConstructor
public class MediaApplicationService {

    @Resource
    private MediaService mediaService;

    @Resource
    private MediaModelFactory mediaModelFactory;


    public IPage<CosMediaEntity> list(Long groupId, Integer pageNum, Integer pageSize) {
        return mediaService.list(groupId, pageNum, pageSize);
    }

    public Integer upload(MultipartFile[] files, Long groupId) {
        MediaModel mediaModel = mediaModelFactory.create();
        return mediaModel.upload(files, groupId);

    }

    public Integer delete(Long id) {
        MediaModel mediaModel = mediaModelFactory.create();
        return mediaModel.delete(id);
    }
}
