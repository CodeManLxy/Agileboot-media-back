package com.agileboot.domain.cos.tag;

import com.agileboot.domain.cos.group.db.service.GroupService;
import com.agileboot.domain.cos.group.model.GroupModelFactory;
import com.agileboot.domain.cos.tag.db.entity.CosTag;
import com.agileboot.domain.cos.tag.db.service.TagService;
import com.agileboot.domain.cos.tag.model.TagModel;
import com.agileboot.domain.cos.tag.model.TagModelFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 15:58
 */
@Service
@RequiredArgsConstructor
public class TagApplicationService {
    @Resource
    private TagService tagService;

    @Resource
    private TagModelFactory tagModelFactory;

    public List<CosTag> list(String tagName) {
        return tagService.list(tagName);
    }

    public Integer insert(String tagName) {
        TagModel model = tagModelFactory.create();
        CosTag cosTag = model.loadInsertCommand(tagName);
        return model.insertNewTag(cosTag);
    }

    public Integer delete(String id) {
        TagModel model = tagModelFactory.create();
        CosTag cosTag = model.loadDeleteCommand(id);
        return model.delete(cosTag);
    }
}
