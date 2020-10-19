package kr.co.fcsoft.core.helper;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtilsBean;

import java.lang.reflect.InvocationTargetException;

/**
 * Created by ez2sarang on 2017. 4. 29..
 */
@Slf4j
public class NullAwareBeanUtilsBean extends BeanUtilsBean {
    @Override
    public void copyProperty(Object dest, String name, Object value)
    throws IllegalAccessException, InvocationTargetException {
        if (value == null) return;
        super.copyProperty(dest, name, value);
    }
}
