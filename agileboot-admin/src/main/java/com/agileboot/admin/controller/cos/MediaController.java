package com.agileboot.admin.controller.cos;


import com.agileboot.common.core.base.BaseController;
import com.agileboot.common.core.dto.ResponseDTO;
import com.agileboot.domain.cos.media.MediaApplicationService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author luXinYu
 * @create 2024/2/21 15:03
 */
@RestController
@RequestMapping("/cos_system")
@Validated
@RequiredArgsConstructor
public class MediaController extends BaseController {

    @Autowired
    private MediaApplicationService mediaService;

    /**
     * 查询图片
     *
     * @param groupId
     * @return
     */
    @Operation(summary = "图片列表")
    @PreAuthorize("@permission.has('system:cos:list')")
    @RequestMapping(value = "/img/list", method = RequestMethod.GET)
    public ResponseDTO list(@RequestParam(name = "group_id") Long groupId,
                            @RequestParam(defaultValue = "1", required = false) Integer pageNum,
                            @RequestParam(defaultValue = "10", required = false) Integer pageSize
    ) {
        return ResponseDTO.ok(mediaService.list(groupId, pageNum, pageSize));
    }

    /**
     * 上传
     *
     * @param files
     * @param groupId
     * @return
     */
    @Operation(summary = "图片上传")
    @PreAuthorize("@permission.has('system:cos:upload')")
    @RequestMapping(value = "/img/upload", method = RequestMethod.POST)
    public ResponseDTO upload(@RequestParam(name = "files") MultipartFile[] files,
                              @RequestParam(name = "group_id") Long groupId) {
        return ResponseDTO.ok(mediaService.upload(files, groupId));
    }


    /**
     * 图片删除
     *
     * @param id
     * @return
     */
    @Operation(summary = "图片删除")
    @PreAuthorize("@permission.has('system:cos:delete')")
    @RequestMapping(value = "/img/delete", method = RequestMethod.POST)
    public ResponseDTO delete(@RequestParam(name = "id") Long id) {
        return ResponseDTO.ok(mediaService.delete(id));
    }


}
