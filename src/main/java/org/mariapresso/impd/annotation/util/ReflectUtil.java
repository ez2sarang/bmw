package org.mariapresso.impd.annotation.util;

import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.Role;
import org.mariapresso.impd.annotation.bean.Docker;
import org.mariapresso.impd.annotation.bean.Component;
import org.mariapresso.impd.annotation.ui.Model;
import org.mariapresso.impd.annotation.ui.Modeler;

import java.lang.reflect.Field;

/**
 * Created by ez2sarang on 2015. 7. 7..
 */
public class ReflectUtil {
    public static Docker addModel(Docker docker, Class clazz, String key) throws Exception{
        Modeler modeler = null;
        Component component = null;
        Field[] fields = clazz.getDeclaredFields();
        if(null != fields) {
            int index = 0;
            for(Field field : fields) {
                index++;
                modeler = field.getAnnotation(Modeler.class);
                if(null != modeler) {
                    component = new Component();
                    if(modeler.value().length>0) {
                        for(Model model : modeler.value()) {
                            if("".equals(model.refer()) /*|| model.refer().equals(key)*/) {
                                component.setName("".equals(model.name()) ? field.getName() : model.name());
                                component.setLabel("".equals(model.label()) ? component.getName() : model.label());
                                component.setType(model.type());
                                component.setOptions(model.options());
                                component.setValue(model.value());
                                component.setFormat(model.format());
                                component.setRole(model.role());
                                component.setValidate(model.validate());
                                if(model.displayOrder() == 0) {
                                    component.setDisplayOrder(index);
                                } else {
                                    component.setDisplayOrder(model.displayOrder());
                                }
                                docker.getComponents().add(component);
                            }
                        }
                    } else {
                        component.setName(field.getName());
                        component.setLabel(field.getName());
                        component.setType(ModelType.input);
                        component.setOptions(new String[]{});
                        component.setValue("");
                        component.setFormat("");
                        component.setRole(new Role[]{Role.all});
                        component.setDisplayOrder(index);
                        docker.getComponents().add(component);
                    }
                }
            }
        }
        return docker;
    }
}
