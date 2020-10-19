package org.mariapresso.impd.controller;

import com.google.common.collect.*;
import lombok.extern.slf4j.Slf4j;
import org.mariapresso.impd.annotation.bean.Component;
import org.mariapresso.impd.annotation.bean.Docker;
import org.mariapresso.impd.annotation.ui.*;
import org.mariapresso.impd.annotation.util.ReflectUtil;
import org.reflections.Reflections;
import org.reflections.scanners.FieldAnnotationsScanner;
import org.reflections.util.ClasspathHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by ez2sarang on 2015. 7. 6..
 */
@Slf4j
@Controller
public class ServiceResourceController {
    @RequestMapping("/resource")
    public @ResponseBody
    Object getResource() {
        Linker link = null;
        try {
            Set<Class<?>> types = new Reflections("org.mariapresso.impd.bean").getTypesAnnotatedWith(Linker.class);
            Set<Field> fields = new Reflections(ClasspathHelper.forPackage("org.mariapresso.impd.bean"), new FieldAnnotationsScanner()).getFieldsAnnotatedWith(Modeler.class);

            Map<String, Docker> linkMap = Maps.newHashMap();
            for(Class bean : types) {
                link = (Linker)bean.getAnnotation(Linker.class);
                for(Action action : link.value()) {
                    linkMap.put(action.value(), new Docker(action));
                }
            }

            for(Class bean : types) {
                link = (Linker) bean.getAnnotation(Linker.class);
                for(Action action : link.value()) {
                    ReflectUtil.addModel(linkMap.get(action.value()), bean, action.value());
                    break;
                }
            }

            Component component = null;
            int index = 0;
            for(Field field : fields) {
                index++;
                link = field.getDeclaringClass().getAnnotation(Linker.class);
//                if(null == link) {
                    for(Model model : field.getAnnotation(Modeler.class).value()) {
                        /**
                         * refer(참조하는 action)에 값이 있을때 작동한다?
                         */
                        if(linkMap.containsKey(model.refer())) {
                            component = new Component();
                            component.setName("".equals(model.name()) ? field.getName() : model.name());
                            component.setLabel("".equals(model.label()) ? component.getName() : model.label());
                            component.setType(model.type());
                            component.setOptions(model.options());
                            component.setValue(model.value());
                            component.setFormat(model.format());
                            component.setRole(model.role());
//                            System.out.println(model.refer()+" validate="+model.validate().length);
//                            model.getClass().getAnnotations();
//                            model.getClass().getAnnotation()
//                            component.setValidate(model.name(), (Rule[])model.validate().getClass().getAnnotations());
                            component.setValidate(model.validate());
                            if(model.displayOrder() == 0) {
                                component.setDisplayOrder(index);
                            } else {
                                component.setDisplayOrder(model.displayOrder());
                            }
                            linkMap.get(model.refer()).getComponents().add(component);
                        }
                    }
//                }
            }
            List<Docker> dockerList = Lists.newArrayList(linkMap.values().iterator());
            Collections.sort(dockerList, new Comparator<Docker>(){
                public int compare(Docker o1, Docker o2) {
                    return o1.getDisplayOrder() < o2.getDisplayOrder() ? -1 : o1.getDisplayOrder() > o2.getDisplayOrder() ? 1:0;
                }
            });
            return dockerList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
