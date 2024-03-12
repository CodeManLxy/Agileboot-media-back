package com.agileboot.domain.cos.group.command;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author luXinYu
 * @create 2024/3/12 15:41
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AddNewTagCommand {
    private Long tagId;
    private Long groupId;
}
