package org.mariapresso.impd.controller;

import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.bean.communicate.ApiResponse;
import org.mariapresso.impd.bean.communicate.Join;
import org.mariapresso.impd.constant.ResultType;
import org.mariapresso.impd.service.UnityService;
import org.mariapresso.impd.util.BindingHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * Created by ez2sarang on 16. 3. 24..
 *
 * join(choose shop) -> regist
 * confirm
 *
 */
@Slf4j
@Controller
public class JoinController {
    @Autowired
    private UnityService unityService;

    /**
     * 회원등록
     * @param bean
     * @param result
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/join")
    public
    @ResponseBody
    ApiResponse join(@Valid Join bean, BindingResult result) throws Exception {
        if(BindingHelper.hasErrors(bean, result)) {
            return bean;
        }
        try {
            unityService.registUser(bean);
        } catch (Exception e) {
            log.error("Exeption[{}]", e.getMessage(), e);
            bean.setResultCode(ResultType.UNKNOWN_ERROR);
        }
        return bean;
    }
}
