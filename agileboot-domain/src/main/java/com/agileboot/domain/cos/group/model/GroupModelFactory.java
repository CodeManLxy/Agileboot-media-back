package com.agileboot.domain.cos.group.model;

import com.agileboot.domain.cos.group.db.service.GroupService;
import com.agileboot.domain.cos.media.db.service.MediaService;
import com.agileboot.domain.cos.media.model.MediaModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author luXinYu
 * @create 2024/3/12 14:50
 */
@Component
@RequiredArgsConstructor
public class GroupModelFactory {

    @Resource
    private GroupService groupService;



    public GroupModel create() {
        return new GroupModel(groupService);
    }
}
