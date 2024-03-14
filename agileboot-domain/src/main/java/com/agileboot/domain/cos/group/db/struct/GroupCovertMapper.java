package com.agileboot.domain.cos.group.db.struct;

import com.agileboot.domain.cos.group.command.AddGroupCommand;
import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.cos.media.db.entity.CosMediaEntity;
import com.agileboot.domain.cos.media.db.entity.MediaCovertMapper;
import com.agileboot.domain.cos.media.model.MediaModel;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

/**
 * @author luXinYu
 * @create 2024/3/12 15:20
 */
@Mapper
public interface GroupCovertMapper {

    GroupCovertMapper INSTANCE = Mappers.getMapper(GroupCovertMapper.class);


    @Mapping(target = "id", source = "id")
    @Mapping(target = "groupName", source = "groupName")
    @Mapping(target = "backgroundImg", source = "backgroundImg")
    @Mapping(target = "groupDescription", source = "groupDescription")
    @Mapping(target = "isFree", source = "isFree")
    @Mapping(target = "price", source = "price")
    CosGroup covert(AddGroupCommand addGroupCommand);
}
