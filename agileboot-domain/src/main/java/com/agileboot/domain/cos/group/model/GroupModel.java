package com.agileboot.domain.cos.group.model;

import com.agileboot.domain.cos.group.command.AddGroupCommand;
import com.agileboot.domain.cos.group.command.AddNewTagCommand;
import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.cos.group.db.entity.GroupTag;
import com.agileboot.domain.cos.group.db.service.GroupService;
import com.agileboot.domain.cos.group.db.struct.GroupCovertMapper;
import com.agileboot.domain.cos.group.db.struct.GroupTagCovertMapper;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author luXinYu
 * @create 2024/3/12 14:50
 */
public class GroupModel extends CosGroup {

    private final GroupService groupService;

    public GroupModel(GroupService groupService) {
        this.groupService = groupService;
    }


    public CosGroup loadAddCommand(AddGroupCommand info) {
        return GroupCovertMapper.INSTANCE.covert(info);
    }

    public Integer initGroup(CosGroup cosGroup) {
        return groupService.initGroup(cosGroup);
    }

    public void deleteBgImg(CosGroup cosGroup) {
       groupService.deleteBgImg(cosGroup);
    }


    public CosGroup queryGroup(Long id) {
        return groupService.queryGroup(id);
    }

    public Integer addNewBgImg(MultipartFile file, Long id) {
        String objectUrl = groupService.uploadImg(file, id);
        return groupService.updateGroup(id, objectUrl);
    }

    public AddNewTagCommand loadAddTagCommand(Long tagId, Long groupId) {
        return AddNewTagCommand.builder().groupId(groupId).tagId(tagId).build();
    }

    public Integer addNewTag(AddNewTagCommand addNewTagCommand) {
        GroupTag groupTag = GroupTagCovertMapper.INSTANCE.covert(addNewTagCommand);
        return groupService.addNewTag(groupTag);
    }

    public Integer deleteTag(Long id) {
        return groupService.deleteTag(id);
    }
}
