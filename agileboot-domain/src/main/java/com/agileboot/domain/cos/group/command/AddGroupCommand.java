package com.agileboot.domain.cos.group.command;

import com.agileboot.domain.cos.tag.db.entity.CosTag;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author luXinYu
 * @create 2024/3/12 15:13
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AddGroupCommand {

    /**
     * 主键id
     */
    private Long id;

    /**
     * 组名称
     */
    private String groupName;


    private String backgroundImg;


    private String groupDescription;

    private Integer isFree;

    private String price;
}
