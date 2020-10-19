package org.mariapresso.util;

import kr.co.fcsoft.core.helper.NullAwareBeanUtilsBean;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.mariapresso.impd.bean.communicate.Coupon;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * Created by ez2sarang on 16. 3. 4..
 */
public class Test {
    public static void main(String[] args) {
//        java.util.Date defaultValue = null;
//        Converter converter = new DateConverter(defaultValue);
        DateTimeConverter converter = new DateConverter();
        converter.setPattern("yyyy-MM-dd");

        BeanUtilsBean beanUtilsBean = BeanUtilsBean.getInstance();
        beanUtilsBean.getConvertUtils().register(converter, java.util.Date.class);

        try {
            Coupon bean = new Coupon();
            bean.setStartDate("2016-03-01");
            bean.setEndDate("2016-03-02");
            org.mariapresso.impd.bean.entity.Coupon coupon = new org.mariapresso.impd.bean.entity.Coupon();
            beanUtilsBean.copyProperties(coupon, bean);
            System.out.println(coupon);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        try {
            org.mariapresso.impd.bean.entity.Coupon coupon = new org.mariapresso.impd.bean.entity.Coupon();
            java.util.Date defaultValue = null;
            DateConverter converter2 = new DateConverter();
            converter2.setPattern("dd/mm/yyyy");
            ConvertUtils.register(converter2, Date.class);

            BeanUtilsBean beanUtilsBean2 = new NullAwareBeanUtilsBean();
            beanUtilsBean2.getConvertUtils().register(converter, Date.class);
            beanUtilsBean2.setProperty(coupon, "endDate", "07/04/2014");

//            BeanUtils.setProperty(coupon, "endDate", "07/04/2014");
            System.out.println(coupon);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
