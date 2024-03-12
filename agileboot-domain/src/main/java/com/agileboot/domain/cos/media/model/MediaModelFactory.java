package com.agileboot.domain.cos.media.model;

import com.agileboot.domain.cos.media.db.service.MediaService;
import com.agileboot.domain.system.dept.model.DeptModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author luXinYu
 * @create 2024/3/12 10:49
 */
@Component
@RequiredArgsConstructor
public class MediaModelFactory {


    @Resource
    private MediaService mediaService;



    public MediaModel create() {
        return new MediaModel(mediaService);
    }
}
