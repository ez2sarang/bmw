package org.mariapresso.impd.controller;

import kr.co.fcsoft.core.bean.EntityObject;
import kr.co.fcsoft.core.bean.SearchListResult;
import lombok.extern.slf4j.Slf4j;
import np.com.mshrestha.dropzonetest.model.UploadedFile;
import np.com.mshrestha.dropzonetest.service.FileUploadService;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.mariapresso.config.RootConfig;
import org.mariapresso.impd.bean.communicate.*;
import org.mariapresso.impd.bean.entity.ContentGroup;
import org.mariapresso.impd.bean.entity.FileItem;
import org.mariapresso.impd.bean.entity.UserGroup;
import org.mariapresso.impd.constant.Pages;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.service.AuthenticationService;
import org.mariapresso.impd.service.UnityService;
import org.mariapresso.impd.util.BindingHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ez2sarang on 2015. 7. 9..
 */
@Slf4j
@Controller
public class ServiceController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    private UnityService unityService;

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private FileUploadService fileUploadService;

    @RequestMapping(value = "/index")
    public String sample(HttpServletRequest request) {
        return Pages.main.viewPage("index");
    }

    @RequestMapping(value = "/{groupId}/mobile")
    public String mobilesample(@PathVariable String groupId, Model model) {
        UserGroup userGroup = null;
        try {
            userGroup = unityService.getJoinGroupByType(groupId);
            model.addAttribute("group", userGroup);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("groupId", null == userGroup ? "":userGroup.getType());
        model.addAttribute("groupName", null == userGroup ? "":userGroup.getName());
        return Pages.main.viewPage("mobile");
    }

    /**
     * 콘텐츠 목록보기 (URL로 접근해서 페이지가 나와야 됨)
     *
     * * 그룹아이디 필수
     *
     * @param groupId 그룹아이디
     * @param model
     * @return
     */
    @RequestMapping(value = "/{groupId}/contents")
    public String viewContents(@PathVariable String groupId, Model model) {
        UserGroup userGroup = null;
        try {
            userGroup = new UserGroup();
            userGroup.setType(groupId);
            //TODO 목록조회
//            userGroup = unityService.getJoinGroupByType(groupId);
//            model.addAttribute("group", userGroup);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        model.addAttribute("group", userGroup);
        model.addAttribute("groupId", null == userGroup ? "":userGroup.getType());
        model.addAttribute("groupName", null == userGroup ? "":userGroup.getName());
        return Pages.info.viewPage("contents");
//        return Pages.html.viewPage("test/arrow");
    }

    /**
     * 콘텐츠 내용보기 (URL로 접근해서 페이지가 나와야 됨)
     *
     * 콘텐츠 아이디로 역으로 그룹아이디 찾아서 콘텐츠 목록도 보여줌.
     * @param contentId
     * @param model
     * @return
     */
    @RequestMapping(value = "/{contentId}/viewContent")
    public String viewContent(@PathVariable String contentId, Model model) {
        UserGroup userGroup = null;
        try {
            //TODO 목록조회
//            userGroup = unityService.getJoinGroupByType(groupId);
//            model.addAttribute("group", userGroup);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("groupId", null == userGroup ? "":userGroup.getType());
//        model.addAttribute("contentId", "1212");
        if(contentId == null) {
            return Pages.info.viewPage("contents");
        } else {
            return Pages.info.viewPage("test");
        }
    }



    /*@RequestMapping(value = "/index")
    public
    @ResponseBody
    ApiResponse index(@Valid Home bean, BindingResult result) throws Exception {
        if(BindingHelper.hasErrors(bean, result)) {
            return bean;
        }
        try {
//            unityService.registUser(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return bean;
    }

    @RequestMapping(value = "/test")
    public
    @ResponseBody
    ApiResponse test(@Valid Home bean, BindingResult result) throws Exception {
        if(BindingHelper.hasErrors(bean, result)) {
            return bean;
        }
        try {
//            unityService.registUser(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return bean;
    }*/



    @RequestMapping(value = "/style")
    public
    @ResponseBody
    ApiResponse regStyle(@Valid Style bean, BindingResult result, HttpServletRequest request) throws Exception {
        String fileToken = bean.getTransactionToken();
        if(BindingHelper.hasErrors(bean, result) || authenticationService.validSession(bean) != ResultType.OK.code) {
            return bean;
        }
        String userToken = bean.getTransactionToken();
        try {
            //find upload file...
            bean.setTransactionToken(fileToken);
            unityService.registStyle(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        bean.setTransactionToken(userToken);
        return bean;
    }

    @RequestMapping(value = "{shopId}/style/{styleId}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public
    @ResponseBody
    ApiResponse getStyle(@PathVariable String shopId, @PathVariable Long styleId) throws Exception {
        try {
            unityService.registStyle(null);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
//            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return null;
    }

    @RequestMapping(value = "/{shopId}/getStyleList")
    public
    @ResponseBody
    Page<?> getStyleList(@PathVariable String shopId) throws Exception {
        Page<?> result = null;
        try {
            UserGroup group = (UserGroup)unityService.findObject(new UserGroup(shopId));

            ContentGroup entity = new ContentGroup();
            entity.setGroupId(group.getId());
            entity.setContentType(ContentGroup.STYLE_TYPE);
//            entity.setPage(1, Integer.MAX_VALUE);

            result = unityService.findAllSorted(entity);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
//            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return result;
    }

    @RequestMapping(value = "/coupon")
    public
    @ResponseBody
    ApiResponse coupon(@Valid Coupon bean, BindingResult result) throws Exception {
        if(BindingHelper.hasErrors(bean, result) || authenticationService.validSession(bean) != ResultType.OK.code) {
            return bean;
        }
        try {
            unityService.registCoupon(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return bean;
    }

    @RequestMapping(value = "/group")
     public
     @ResponseBody
     ApiResponse group(@Valid Group bean, BindingResult result) throws Exception {
        if(BindingHelper.hasErrors(bean, result) || authenticationService.validSession(bean) != ResultType.OK.code) {
            return bean;
        }
        try {
            unityService.registGroup(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return bean;
    }

    @RequestMapping(value = "/groupList")
    public
    @ResponseBody
    Object groupList(Group bean) throws Exception {
        /*if(BindingHelper.hasErrors(bean, result) || authenticationService.validSession(bean) != ResultType.OK.code) {
            return bean;
        }*/
        try {
            return unityService.list(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return null;
    }

    @RequestMapping(value = "/getFileItem/{idx}", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getFileItem(@PathVariable final Long idx) throws Exception {
        InputStream is = null;
        final HttpHeaders headers = new HttpHeaders();
        try {

            FileItem result = (FileItem)unityService.findObject(new FileItem(idx));

            if(null != result) {
                is = new FileInputStream(result.getPath());

                String fileExt = FilenameUtils.getExtension(result.getName());
                if (StringUtils.equalsIgnoreCase(fileExt, "jpg")) {
                    headers.setContentType(MediaType.IMAGE_JPEG);
                } else {
                    headers.setContentType(MediaType.parseMediaType("image/" + fileExt.toLowerCase()));
                }
            } else {
                is = servletContext.getResourceAsStream("/assets/img/no_image.png");
                headers.setContentType(MediaType.IMAGE_PNG);
            }
            return new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.CREATED);
        } catch (Exception e) {
            log.error(String.format("Exeption[%s]", e.getMessage()), e);
            is = servletContext.getResourceAsStream("/assets/img/image_not_found.svg");
            headers.setContentType(MediaType.parseMediaType("image/svg+xml"));
//            is = servletContext.getResourceAsStream("/assets/img/no_image.png");
//            headers.setContentType(MediaType.IMAGE_PNG);
            return new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.CREATED);
//            throw new Exception(e.getMessage());
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (Exception e) {
                }
            }
        }
    }
}
