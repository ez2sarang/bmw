package org.mariapresso.impd.annotation.bean;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Hibernate 쿼리시 EntityObject 해당필드에 Restriction이 선언되어 있으면 해당 Expression 조건으로 검색한다.
 *
 * Created by ez2sarang on 2017. 4. 14..
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD, ElementType.TYPE})
public @interface Restriction {
    Expression value() default Expression.eq;
}
