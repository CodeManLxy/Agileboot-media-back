package com.agileboot.domain.cos.tag.model;

import com.agileboot.common.exception.ApiException;
import com.agileboot.common.exception.error.ErrorCode;
import com.agileboot.domain.cos.tag.db.entity.CosTag;
import com.agileboot.domain.cos.tag.db.service.TagService;
import org.apache.commons.lang3.ObjectUtils;

/**
 * @author luXinYu
 * @create 2024/3/12 16:00
 */
public class TagModel {

    private final TagService tagService;
    public TagModel(TagService tagService) {
        this.tagService = tagService;
    }


    public CosTag loadInsertCommand(String tagName) {
        return CosTag.builder().tagName(tagName).build();
    }

    public Integer insertNewTag(CosTag cosTag) {
        return tagService.insertNewTag(cosTag);
    }

    public CosTag loadDeleteCommand(String id) {
        CosTag cosTag = tagService.queryCosTag(id);
        if (ObjectUtils.isEmpty(cosTag)) {
            throw new ApiException(ErrorCode.Business.COMMON_OBJECT_NOT_FOUND,id);
        }
        return cosTag;
    }

    public Integer delete(CosTag cosTag) {
        return tagService.delete(cosTag);
    }
}
