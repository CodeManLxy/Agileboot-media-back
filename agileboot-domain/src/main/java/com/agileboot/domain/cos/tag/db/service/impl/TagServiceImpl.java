package com.agileboot.domain.cos.tag.db.service.impl;

import com.agileboot.domain.cos.tag.db.entity.CosTag;
import com.agileboot.domain.cos.tag.db.mapper.TagMapper;
import com.agileboot.domain.cos.tag.db.service.TagService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 15:59
 */
@Service
public class TagServiceImpl implements TagService {

    @Resource
    private TagMapper tagMapper;


    @Override
    public List<CosTag> list(String tagName) {
        QueryWrapper<CosTag> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(tagName), "tag_name", tagName);
        return tagMapper.selectList(queryWrapper);
    }

    @Override
    public Integer insertNewTag(CosTag cosTag) {

        return tagMapper.insert(cosTag);
    }

    @Override
    public CosTag queryCosTag(String id) {

        return tagMapper.selectById(id);
    }

    @Override
    public Integer delete(CosTag cosTag) {
        return tagMapper.deleteById(cosTag.getId());
    }
}
