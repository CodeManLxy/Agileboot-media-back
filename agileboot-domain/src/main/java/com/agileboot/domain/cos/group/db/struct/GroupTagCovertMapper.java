package com.agileboot.domain.cos.group.db.struct;

import com.agileboot.domain.cos.group.command.AddNewTagCommand;
import com.agileboot.domain.cos.group.db.entity.GroupTag;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

/**
 * @author luXinYu
 * @create 2024/3/12 15:46
 */
@Mapper
public interface GroupTagCovertMapper {

    GroupTagCovertMapper INSTANCE = Mappers.getMapper(GroupTagCovertMapper.class);

    @Mapping(target = "tagId", source = "tagId")
    @Mapping(target = "groupId", source = "groupId")
    GroupTag covert(AddNewTagCommand addNewTagCommand);
}
