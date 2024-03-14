package com.agileboot.domain.cos.group.db.service.impl;

import com.agileboot.common.core.page.PageDTO;
import com.agileboot.common.exception.ApiException;
import com.agileboot.common.exception.error.ErrorCode;
import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.cos.group.db.entity.GroupTag;
import com.agileboot.domain.cos.group.db.mapper.GroupMapper;
import com.agileboot.domain.cos.group.db.mapper.GroupTagMapper;
import com.agileboot.domain.cos.group.db.service.GroupService;
import com.agileboot.domain.cos.group.query.GroupQuery;
import com.agileboot.domain.cos.tag.db.entity.CosTag;
import com.agileboot.infrastructure.config.minio.bean.MinIoResponse;
import com.agileboot.infrastructure.config.minio.conf.MinioConf;
import com.agileboot.infrastructure.config.minio.util.MinioUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 14:51
 */
@Service
public class GroupServiceImpl implements GroupService {


    @Resource
    private GroupMapper groupMapper;

    @Resource
    private GroupTagMapper groupTagMapper;

    @Autowired
    private MinioUtils minioUtils;

    @Autowired
    private MinioConf minioConf;


    @Override
    public PageDTO<CosGroup> list(GroupQuery query) {
        IPage<CosGroup> list = groupMapper.selectPage(query.toPage(), query.addQueryCondition());
        List<CosGroup> records = list.getRecords();
        for (CosGroup record : records) {
            List<CosTag> tagList = groupTagMapper.selectAllTagById(record.getId());
            record.setTagList(tagList);
            //判断是否需要会员 ||  用户是否付费
        }

        return new PageDTO<>(list.getRecords(), list.getTotal());
    }

    @Override
    public Integer initGroup(CosGroup cosGroup) {
        cosGroup.setCreateTime(new Date());
        return groupMapper.insert(cosGroup);
    }

    @Override
    public void deleteBgImg(CosGroup cosGroup) {
        String imgUrl = cosGroup.getBackgroundImg();
        String bucketName = minioUtils.extBucketName(imgUrl);
        String objectName = minioUtils.extObjectName(imgUrl);
        minioUtils.deleteObject(bucketName, objectName);
        groupMapper.deleteById(cosGroup.getId());
    }

    @Override
    public CosGroup queryGroup(Long id) {
        return groupMapper.selectById(id);
    }

    @Override
    public String uploadImg(MultipartFile file, Long id) {
        try {
            // 上传
            MinIoResponse minIoResponse = minioUtils.uploadFile(file, minioConf.getBgImgBucket(), System.currentTimeMillis() / 1000 + "");
            return minIoResponse.getObjectUrl();
        } catch (Exception e) {
            throw new ApiException(ErrorCode.Business.UPLOAD_FILE_FAILED);
        }
    }

    @Override
    public Integer updateGroup(Long id, String objectUrl) {
        return groupMapper.updateById(CosGroup.builder()
                .backgroundImg(objectUrl)
                .id(id)
                .updateTime(new Date())
                .build());
    }

    @Override
    public Integer addNewTag(GroupTag groupTag) {
        return groupTagMapper.insert(groupTag);
    }

    @Override
    public Integer deleteTag(Long id) {
        return groupTagMapper.deleteById(id);
    }
}
