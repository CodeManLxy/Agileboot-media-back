package com.agileboot.domain.cos.media.db.mapper;

import com.agileboot.domain.cos.media.db.entity.CosMediaEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 10:43
 */
@Mapper
public interface MediaMapper extends BaseMapper<CosMediaEntity> {

    Integer saveBatch(@Param("list") List<CosMediaEntity> list);
}
