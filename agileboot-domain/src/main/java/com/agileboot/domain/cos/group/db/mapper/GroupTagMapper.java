package com.agileboot.domain.cos.group.db.mapper;


import com.agileboot.domain.cos.group.db.entity.GroupTag;
import com.agileboot.domain.cos.tag.db.entity.CosTag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author luXinYu
 * @create 2024/2/21 16:26
 */
@Repository
public interface GroupTagMapper extends BaseMapper<GroupTag> {

    List<CosTag> selectAllTagById(@Param("group_id") Long id);
}
