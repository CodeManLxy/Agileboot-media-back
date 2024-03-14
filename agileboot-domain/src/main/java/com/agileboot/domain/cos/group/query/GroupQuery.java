package com.agileboot.domain.cos.group.query;

import com.agileboot.common.core.page.AbstractPageQuery;
import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.system.notice.db.SysNoticeEntity;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;

/**
 * @author luXinYu
 * @create 2024/3/13 16:12
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
public class GroupQuery extends AbstractPageQuery<CosGroup> {

    @JsonProperty("group_name")
    private String groupName;

    @Override
    public QueryWrapper<CosGroup> addQueryCondition() {
        QueryWrapper<CosGroup> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotEmpty(groupName), "group_name", groupName);
        return queryWrapper;
    }
}
