package org.mariapresso.impd.annotation.bean;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.Role;
import org.mariapresso.impd.annotation.ui.Rule;

import java.util.*;

/**
 * Created by ez2sarang on 2015. 7. 7..
 */
public @Data class Component {
    private String name;
    private String label;
    private ModelType type;
    private String[] options;
    private String value;
    private String format;
    private String help;
    private String refer;
    private Role[] role;
    private List<String> rules;
    private Map<String, String> messages;
    private int displayOrder;
    public void setValidate(Rule[] validation) {
        if(null == validation || validation.length==0) {
            return;
        }
        rules = Lists.newArrayList();
        messages = Maps.newHashMap();
        for (Rule rule : validation) {
            if(!"".equals(StringUtils.trimToEmpty(rule.required()))) {
                rules.add("required:"+rule.required());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("required", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.remote()))) {
                rules.add("remote:'"+rule.remote()+"'");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("remote", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.minlength()))) {
                rules.add("minlength:"+rule.minlength());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("minlength", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.maxlength()))) {
                rules.add("maxlength:"+rule.maxlength());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("maxlength", rule.messages());
                }
            }
            if(null != rule.rangelength() && rule.rangelength().length>1) {
                rules.add("rangelength:"+Arrays.toString(rule.rangelength()));
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("rangelength", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.min()))) {
                rules.add("min:"+rule.min());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("min", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.max()))) {
                rules.add("max:"+rule.max());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("max", rule.messages());
                }
            }
            if(null != rule.range() && rule.range().length>1) {
                rules.add("range:"+Arrays.toString(rule.range()));
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("range", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.step()))) {
                rules.add("step:"+rule.step());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("step", rule.messages());
                }
            }
            if(rule.email()) {
                rules.add("email:true");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("email", rule.messages());
                }
            }
            if(rule.url()) {
                rules.add("url:true");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("url", rule.messages());
                }
            }
            if(rule.date()) {
                rules.add("date:true");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("date", rule.messages());
                }
            }
            if(rule.dateISO()) {
                rules.add("dateISO:true");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("dateISO", rule.messages());
                }
            }
            if(rule.number()) {
                rules.add("number:true");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("number", rule.messages());
                }
            }
            if(rule.digits()) {
                rules.add("digits:true");
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("digits", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.equalTo()))) {
                rules.add("equalTo:"+rule.equalTo());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put("equalTo", rule.messages());
                }
            }
            if(!"".equals(StringUtils.trimToEmpty(rule.additional()))) {
                rules.add(rule.additional());
                if(!"".equals(StringUtils.trimToEmpty(rule.messages()))) {
                    messages.put(rule.additional().split(":")[0], rule.messages());
                }
            }
        }
    }

    public static void main(String[] args) {
        String[] sArray = new String[]{"5","9"};
        System.out.println(Arrays.toString(sArray));
    }
}
