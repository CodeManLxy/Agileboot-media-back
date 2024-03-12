package com.agileboot.domain.cos.tag.db.service;

import com.agileboot.domain.cos.tag.db.entity.CosTag;

import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 15:59
 */
public interface TagService {
    /**
     * 查询标签列表
     * @param tagName
     * @return
     */
    List<CosTag> list(String tagName);

    /**
     * 新增标签
     * @param cosTag
     * @return
     */
    Integer insertNewTag(CosTag cosTag);

    /**
     * 查询
     * @param id
     * @return
     */
    CosTag queryCosTag(String id);

    /**
     * 删除标签
     * @param cosTag
     * @return
     */
    Integer delete(CosTag cosTag);
}
