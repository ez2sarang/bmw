package org.mariapresso.impd.tags;

import com.google.common.collect.Lists;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.mariapresso.impd.annotation.ActionType;
import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.bean.Component;
import org.mariapresso.impd.annotation.bean.Docker;
import org.mariapresso.impd.annotation.ui.Action;
import org.mariapresso.impd.annotation.ui.Linker;
import org.mariapresso.impd.annotation.ui.Model;
import org.mariapresso.impd.annotation.ui.Modeler;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by ez2sarang on 2017. 4. 18..
 */
@Slf4j
public class FrontEnd extends RequestContextAwareTag {
    private Object entity;
    private ActionType type;

    static final SimpleDateFormat defaultFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    static final Gson gson = new Gson();

    public Object getEntity() {
        return entity;
    }

    public void setEntity(Object entity) {
        this.entity = entity;
    }

    public String getType() {
        return type.toString();
    }

    public void setType(String type) {
        this.type = ActionType.valueOf(type);
    }

    @Override
    protected int doStartTagInternal() throws Exception {
        List<Docker> dockerList = Lists.newArrayList();
        StringBuffer sb = new StringBuffer();
        StringBuffer script = new StringBuffer();
        try {
            Linker link = entity.getClass().getAnnotation(Linker.class);
            for(Action action : link.value()) {
                dockerList.add(new Docker(action));
            }

            Modeler modeler = null;
            int index = 0;
            for (Field field : entity.getClass().getDeclaredFields()) {
                index++;
                modeler = field.getAnnotation(Modeler.class);
                if(null != modeler) {
                    Component component = null;
                    for (Model model : modeler.value()) {
                        component = new Component();
                        component.setName("".equals(model.name()) ? field.getName() : model.name());
                        component.setLabel("".equals(model.label()) ? component.getName() : model.label());
                        component.setType(model.type());
                        component.setOptions(model.options());
                        component.setValue(model.value());
                        component.setFormat(model.format());
                        component.setHelp(model.help());
                        component.setRole(model.role());
                        component.setRefer(model.refer());
                        component.setValidate(model.validate());
                        if (model.displayOrder() == 0) {
                            component.setDisplayOrder(index);
                        } else {
                            component.setDisplayOrder(model.displayOrder());
                        }
                        for(Docker docker : dockerList) {
                            docker.getComponents().add(component);
                        }
                    }
                }
            }

            SimpleDateFormat transFormat = null;
            for(Docker docker : dockerList) {
                if(type == docker.getType()) {
                    switch (docker.getType()) {
                        case info:
                            for(Component component : docker.getComponents()) {
                                if(!(component.getType() == ModelType.hidden || component.getType() == ModelType.password)) {
                                    sb.append("<div class='form-group'>\n");
                                    sb.append(String.format(
                                            "<label for='%s' class='col-md-3 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                    ));
                                    sb.append("<div class='col-md-9'>\n");
                                    if(component.getType() == ModelType.dateRange || component.getType() == ModelType.date) {
                                        transFormat = new SimpleDateFormat(component.getFormat().replaceAll("Y", "y").replaceAll("D", "d"));
                                        sb.append(String.format("<p class='form-control-static'>%s</p>", transFormat.format(defaultFormat.parse(PropertyUtils.getProperty(entity, component.getName()).toString()))));
                                    } else {
                                        sb.append(String.format("<p class='form-control-static'>%s</p>", PropertyUtils.getProperty(entity, component.getName())));
                                    }
                                    sb.append("</div>\n");
                                    sb.append("</div>\n");
                                }
                            }
                            break;
                        case modify:
                            for(Component component : docker.getComponents()) {
                                switch (component.getType()) {
                                    case input:
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");
                                        sb.append(String.format(
                                                "<input type='text' class='form-control' id='%s' name='%s' value='%s' placeholder='%s'>\n", component.getName(), component.getName(), PropertyUtils.getProperty(entity, component.getName()), component.getLabel()
                                        ));
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(String.format("$('#%s').on('change', function(){$(this).valid();});\n", component.getName()));
                                        break;
                                    case radio:
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");

                                        sb.append(String.format("<select class='form-control' id='%s' name='%s'>", component.getName(), component.getName()));
                                        for(String opt : component.getOptions()) {
                                            sb.append(String.format("<option value='%s'%s>%s</option>", opt.split(":")[0], opt.split(":")[0].equals(PropertyUtils.getProperty(entity, component.getName()))?" selected":"",opt.split(":")[1]));
                                        }
                                        sb.append("</select>");
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(String.format("$('#%s').on('change', function(){$(this).valid();});\n", component.getName()));
                                        break;
                                    case dateRange:
                                        transFormat = new SimpleDateFormat(component.getFormat().replaceAll("Y", "y").replaceAll("D", "d"));
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");
                                        sb.append(String.format(
                                                "<input type='text' class='form-control' id='%s' name='%s' value='%s' placeholder='%s' readonly>\n", component.getName(), component.getName(), transFormat.format(defaultFormat.parse(PropertyUtils.getProperty(entity, component.getName()).toString())), component.getLabel()
                                        ));
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(getDateRangePicker(component));
                                        break;
                                    default:
                                        break;
                                }
                            }
                            sb.append("<script type='text/javascript'>\n");
                            sb.append("$(document).ready(function () {\n");
                            sb.append(script.toString());
                            sb.append(String.format("var valid = makeValidateData(%s);\n", gson.toJson(docker.getComponents())));
                            sb.append("if(!isEmpty(valid, true)) {\n");
                            sb.append("$('#entity-form').pxValidate(valid);\n");
                            sb.append("}\n");
                            sb.append("});</script>\n");
                            break;
                        case register:
                            for(Component component : docker.getComponents()) {
                                switch (component.getType()) {
                                    case input:
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");
                                        sb.append(String.format(
                                                "<input type='text' class='form-control' id='%s' name='%s' value='' placeholder='%s'>\n", component.getName(), component.getName(), component.getLabel()
                                        ));
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(String.format("$('#%s').on('change', function(){$(this).valid();});\n", component.getName()));
                                        break;
                                    case hidden:
                                        sb.append("<div class='form-group' style='display:noneㅂ'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");
                                        sb.append(String.format(
                                                "<input type='hidden' class='form-control' id='%s' name='%s' value='' placeholder='%s'>\n", component.getName(), component.getName(), component.getLabel()
                                        ));
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(String.format("$('#%s').on('change', function(){$(this).valid();});\n", component.getName()));
                                        break;
                                    case radio:
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");

                                        sb.append(String.format("<select class='form-control' id='%s' name='%s'>", component.getName(), component.getName()));
                                        for(String opt : component.getOptions()) {
                                            sb.append(String.format("<option value='%s'>%s</option>", opt.split(":")[0], opt.split(":")[1]));
                                        }
                                        sb.append("</select>");
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(String.format("$('#%s').on('change', function(){$(this).valid();});\n", component.getName()));
                                        break;
                                    case dateRange:
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");
                                        sb.append(String.format(
                                                "<input type='text' class='form-control' id='%s' name='%s' value='' placeholder='%s' readonly>\n", component.getName(), component.getName(), component.getLabel()
                                        ));
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append(getDateRangePicker(component));
                                        break;
                                    case file:
                                        sb.append("<div class='form-group'>\n");
                                        sb.append(String.format(
                                                "<label for='%s' class='col-sm-2 control-label'>%s</label>\n", component.getName(), component.getLabel()
                                        ));
                                        sb.append("<div class='col-sm-10'>\n");
                                        sb.append("<div id='dropzonejs' class='dropzone-box'>\n");
                                        sb.append("<div class='dz-default dz-message' style='margin-left:0px;'>\n");
                                        sb.append("<div class='dz-upload-icon'></div> Drop files in here<br>\n");
                                        sb.append("<span class='dz-text-small'>or click to pick manually</span>\n");
                                        sb.append("</div>\n");
                                        sb.append("<div class='fallback'>\n");
                                        sb.append("<input name='file' type='file' multiple>\n");
                                        sb.append("</div>\n");
//                                        sb.append("<div id='dropzonejs' class='dropzone-box'>\n");
//                                        sb.append("파일찾기<br><span class='dz-text-small'>사진첩 및 카메라를 이용하세요.</span>\n");
                                        if(!"".equals(StringUtils.trimToEmpty(component.getHelp()))) {
                                            sb.append(String.format("<small class='text-muted form-help-text'>%s</small>\n", component.getHelp()));
                                        }
//                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        sb.append("</div>\n");
                                        script.append("displayDropzone();");
                                        break;
                                    default:
                                        break;
                                }
                            }
                            sb.append("<script type='text/javascript'>\n");
                            sb.append("$(document).ready(function () {\n");
                            sb.append(script.toString());
                            sb.append(String.format("var valid = makeValidateData(%s);\n", gson.toJson(docker.getComponents())));
                            sb.append("if(!isEmpty(valid, true)) {\n");
                            /** pxValidate 설정..*/
                            sb.append("$('#entity-form').pxValidate(valid);\n");
//                            sb.append("$('#entity-form').validate(valid);\n");
                            sb.append("}\n");
                            sb.append("});</script>\n");
                            break;
                        default:
                            break;
                    }
                }
            }
            pageContext.getOut().print(sb.toString());
        } catch(Exception e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }

    public String getNavigation() {
        return null;
    }

    public String getDateRangePicker(Component component) {
        StringBuffer sb = new StringBuffer();
        sb.append(String.format("$('#%s').on('change', function(){$(this).valid();}).daterangepicker({\n", component.getName()));
        sb.append("autoUpdateInput: false");
        sb.append(component.getFormat().indexOf("h")>-1?", timePicker: true":"");
        sb.append(", timePicker24Hour: true");
        sb.append(", timePickerIncrement: 1");
        if(component.getName().toLowerCase().indexOf("start")>-1) {
            sb.append(String.format(", startDate: $('#-%s').val()", component.getName()));
            sb.append(String.format(", endDate: $('#%s').val()", component.getRefer()));
        } else {
            sb.append(String.format(", startDate: $('#%s').val()", component.getRefer()));
            sb.append(String.format(", endDate: $('#%s').val()", component.getName()));
        }
        sb.append(String.format(", locale: {format: '%s'}", component.getFormat()));
        sb.append("}, function(start, end, label) {\n");
        if(component.getName().toLowerCase().indexOf("start")>-1) {
            sb.append(String.format("$('#%s').val(start.format('%s'));", component.getName(), component.getFormat()));
            sb.append(String.format("$('#%s').val(end.format('%s'));", component.getRefer(), component.getFormat()));
        } else {
            sb.append(String.format("$('#%s').val(start.format('%s'));", component.getRefer(), component.getFormat()));
            sb.append(String.format("$('#%s').val(end.format('%s'));", component.getName(), component.getFormat()));
        }
        sb.append("});");
        sb.append(String.format("$('#%s').on('click', function(){$('.daterangepicker').prependTo('.bootbox-lg');});\n", component.getName()));
//        sb.append("$('#"+component.getName()+"').data('daterangepicker').hide=function(){};\n");
//        sb.append("$('#"+component.getName()+"').daterangepicker('show');\n");
        return sb.toString();
    }
}
