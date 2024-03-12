package com.agileboot.domain.cos.media.db.service;

import com.agileboot.domain.cos.media.db.entity.CosMediaEntity;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 10:35
 */
public interface MediaService {
    /**
     * 查询
     * @param groupId
     * @param pageNum
     * @param pageSize
     * @return
     */
    IPage<CosMediaEntity> list(Long groupId, Integer pageNum, Integer pageSize);

    /**
     * 批量存储
     *
     * @param list
     * @return
     */
    Integer saveBatch(List<CosMediaEntity> list);

    List<CosMediaEntity> upload(MultipartFile[] files, Long groupId);

    /**
     * 图片删除
     * @param id
     * @return
     */
    Integer delete(Long id);
}
