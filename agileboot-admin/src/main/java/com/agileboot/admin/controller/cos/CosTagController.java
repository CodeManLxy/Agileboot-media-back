package com.agileboot.admin.controller.cos;

import com.agileboot.common.core.base.BaseController;
import com.agileboot.common.core.dto.ResponseDTO;
import com.agileboot.domain.cos.tag.TagApplicationService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author luXinYu
 * @create 2024/3/12 15:56
 */
@RestController
@RequestMapping("/cos_system")
public class CosTagController extends BaseController {

    @Resource
    private TagApplicationService tagApplicationService;

    /**
     * 查询所有标签
     *
     * @param tagName
     * @return
     */
    @Operation(summary = "组列表查询")
    @PreAuthorize("@permission.has('system:costag:list')")
    @RequestMapping(value = "/tag/list", method = RequestMethod.GET)
    public ResponseDTO list(@RequestParam(name = "tag_name", required = false) String tagName
    ) {
        return ResponseDTO.ok(tagApplicationService.list(tagName));
    }

    /**
     * 新增标签
     *
     * @param tagName
     * @return
     */
    @RequestMapping(value = "/tag/insert", method = RequestMethod.GET)
    public ResponseDTO insert(@RequestParam(name = "tag_name") String tagName
    ) {
        return ResponseDTO.ok(tagApplicationService.insert(tagName));
    }


    /**
     * 删除标签
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/tag/delete", method = RequestMethod.GET)
    public ResponseDTO delete(@RequestParam(name = "id") String id
    ) {
        return ResponseDTO.ok(tagApplicationService.delete(id));
    }
}
