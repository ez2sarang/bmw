package org.mariapresso.impd.annotation.bean;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

/**
 * 기본 equals notEquals...등등이 조건비교를 하며,
 * between은 향후 어떤 field 명을 참조하라는 인자값을 받는 형태로해서 개발해야될 듯..
 *
 * Created by ez2sarang on 2017. 4. 14..
 */
public enum Expression {
    eq, eqOrIsNull, ne, neOrIsNotNull
    , like, ilike, gt, lt, le
    , ge, in, isNull, isNotNull;

    public Criterion get(String propertyName, Object value) {
        switch (this) {
            case eq:
                return Restrictions.eq(propertyName, value);
            case eqOrIsNull:
                return Restrictions.eqOrIsNull(propertyName, value);
            case ne:
                return Restrictions.ne(propertyName, value);
            case neOrIsNotNull:
                return Restrictions.neOrIsNotNull(propertyName, value);
            case like:
                if(null != value && !"".equals(StringUtils.trimToEmpty(value.toString()))) {
                    if(value.toString().indexOf("%")>-1) {
                        return Restrictions.like(propertyName, value);
                    } else {
                        return Restrictions.like(propertyName, "%"+value+"%");
                    }
                }
                return Restrictions.like(propertyName, value);
            case ilike:
                return Restrictions.ilike(propertyName, value);
            case gt:
                return Restrictions.gt(propertyName, value);
            case lt:
                return Restrictions.lt(propertyName, value);
            case le:
                return Restrictions.le(propertyName, value);
            case ge:
                return Restrictions.ge(propertyName, value);
            case in:
                return Restrictions.in(propertyName, new Object[]{value});
            case isNull:
                return Restrictions.isNull(propertyName);
            case isNotNull:
                return Restrictions.isNotNull(propertyName);
            default:
                return null;
        }
    }
}
