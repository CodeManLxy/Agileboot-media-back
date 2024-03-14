package com.agileboot.domain.cos.group;

import com.agileboot.common.core.page.PageDTO;
import com.agileboot.domain.cos.group.command.AddGroupCommand;
import com.agileboot.domain.cos.group.command.AddNewTagCommand;
import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.cos.group.db.service.GroupService;
import com.agileboot.domain.cos.group.model.GroupModel;
import com.agileboot.domain.cos.group.model.GroupModelFactory;
import com.agileboot.domain.cos.group.query.GroupQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * @author luXinYu
 * @create 2024/3/12 14:45
 */
@Service
@RequiredArgsConstructor
public class GroupApplicationService {

    @Resource
    private GroupService mediaService;

    @Resource
    private GroupModelFactory groupModelFactory;

    public PageDTO<CosGroup> list(GroupQuery query) {
        return mediaService.list(query);
    }

    public Integer init(AddGroupCommand info) {
        GroupModel groupModel = groupModelFactory.create();
        CosGroup cosGroup = groupModel.loadAddCommand(info);
        return groupModel.initGroup(cosGroup);
    }

    public Integer uploadBgImg(MultipartFile file, Long id) {
        GroupModel groupModel = groupModelFactory.create();
        CosGroup cosGroup = groupModel.queryGroup(id);
        groupModel.deleteBgImg(cosGroup);
        return groupModel.addNewBgImg(file, id);
    }

    public Integer setTags(Long tagId, Long groupId) {
        GroupModel groupModel = groupModelFactory.create();
        AddNewTagCommand addNewTagCommand = groupModel.loadAddTagCommand(tagId, groupId);
        return groupModel.addNewTag(addNewTagCommand);
    }

    public Integer deleteTags(Long id) {
        GroupModel groupModel = groupModelFactory.create();
        return groupModel.deleteTag(id);
    }
}
