package com.agileboot.domain.cos.tag.model;

import com.agileboot.domain.cos.group.db.service.GroupService;
import com.agileboot.domain.cos.group.model.GroupModel;
import com.agileboot.domain.cos.tag.db.service.TagService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author luXinYu
 * @create 2024/3/12 16:00
 */
@Component
@RequiredArgsConstructor
public class TagModelFactory {

    @Resource
    private TagService tagService;



    public TagModel create() {
        return new TagModel(tagService);
    }
}
