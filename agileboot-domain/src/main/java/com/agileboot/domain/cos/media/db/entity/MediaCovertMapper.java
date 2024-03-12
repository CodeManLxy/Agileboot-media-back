package com.agileboot.domain.cos.media.db.entity;

import com.agileboot.domain.cos.media.model.MediaModel;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author luXinYu
 * @create 2024/3/12 10:58
 */
@Mapper
public interface MediaCovertMapper {

    MediaCovertMapper INSTANCE = Mappers.getMapper(MediaCovertMapper.class);


    MediaModel covert(CosMediaEntity mediaEntity);
}
