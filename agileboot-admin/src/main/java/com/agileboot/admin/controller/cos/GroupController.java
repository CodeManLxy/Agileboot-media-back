package com.agileboot.admin.controller.cos;

import com.agileboot.common.core.base.BaseController;
import com.agileboot.common.core.dto.ResponseDTO;
import com.agileboot.domain.cos.group.GroupApplicationService;
import com.agileboot.domain.cos.group.command.AddGroupCommand;
import com.agileboot.domain.cos.group.db.entity.CosGroup;
import com.agileboot.domain.cos.group.query.GroupQuery;
import com.agileboot.domain.cos.media.MediaApplicationService;
import com.agileboot.domain.system.notice.query.NoticeQuery;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author luXinYu
 * @create 2024/2/21 15:30
 */
@RestController
@RequestMapping("/cos_system")
public class GroupController extends BaseController {


    @Autowired
    private GroupApplicationService groupService;

    /**
     * 组列表查询
     *
     * @param query
     * @return
     */
    @Operation(summary = "组列表查询")
    @PreAuthorize("@permission.has('system:cosgroup:list')")
    @RequestMapping(value = "/group/list", method = RequestMethod.GET)
    public ResponseDTO list(GroupQuery query
    ) {
        return ResponseDTO.ok(groupService.list(query));
    }


    /**
     * 新增组
     *
     * @param addGroupCommand
     * @return
     */
    @Operation(summary = "新增组")
    @PreAuthorize("@permission.has('system:cosgroup:init')")
    @RequestMapping(value = "/group/init", method = RequestMethod.POST)
    public ResponseDTO init(@RequestBody AddGroupCommand addGroupCommand) {
        return ResponseDTO.ok(groupService.init(addGroupCommand));
    }

    /**
     * 上传背景图
     *
     * @param file
     * @return
     */
    @Operation(summary = "上传背景图")
    @PreAuthorize("@permission.has('system:cosgroup:uploadBgImg')")
    @RequestMapping(value = "/group/upload_bg_img", method = RequestMethod.POST)
    public ResponseDTO uploadBgImg(@RequestParam(name = "file") MultipartFile file,
                                   Long id) {
        return ResponseDTO.ok(groupService.uploadBgImg(file, id));
    }


    /**
     * 组标签设置
     *
     * @param tagId
     * @param groupId
     * @return
     */
    @RequestMapping(value = "/group/set_tags", method = RequestMethod.GET)
    public ResponseDTO setTags(@RequestParam(name = "tag_id") Long tagId, @RequestParam("group_id") Long groupId) {
        return ResponseDTO.ok(groupService.setTags(tagId, groupId));
    }

    /**
     * 组标签删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/group/delete_tags", method = RequestMethod.GET)
    public ResponseDTO deleteTags(@RequestParam(name = "id") Long id) {
        return ResponseDTO.ok(groupService.deleteTags(id));
    }

}
