package com.agileboot.domain.cos.group.db.service;

import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.cos.group.db.entity.GroupTag;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author luXinYu
 * @create 2024/3/12 14:51
 */
public interface GroupService {
    /**
     * 查询
     * @param groupName
     * @param pageNum
     * @param pageSize
     * @return
     */
    IPage<CosGroup> list(String groupName, Integer pageNum, Integer pageSize);

    /**
     * 新增组
     * @param cosGroup
     * @return
     */
    Integer initGroup(CosGroup cosGroup);

    /**
     * 删除背景图片
     * @param cosGroup
     */
    void deleteBgImg(CosGroup cosGroup);

    /**
     * 查询组
     * @param id
     * @return
     */
    CosGroup queryGroup(Long id);

    /**
     * 上传
     *
     * @param file
     * @param id
     * @return
     */
    String uploadImg(MultipartFile file, Long id);

    /**
     * 更新组
     * @param id
     * @param objectUrl
     * @return
     */
    Integer updateGroup(Long id, String objectUrl);

    /**
     * 新增标签
     * @param addNewTagCommand
     * @return
     */
    Integer addNewTag(GroupTag addNewTagCommand);

    /**
     * 删除标签
     * @param id
     * @return
     */
    Integer deleteTag(Long id);
}
