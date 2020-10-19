package org.mariapresso.impd.annotation.ui;

/**
 * Created by ez2sarang on 2016. 12. 5..
 */
public @interface Rule {
    String required() default "";
    String remote() default "";//url or json {url,type,data}
    String minlength() default "";
    String maxlength() default "";
    String[] rangelength() default {};
    String min() default "";
    String max() default "";
    String[] range() default {};
    String step() default "";
    boolean email() default false;
    boolean url() default false;
    boolean date() default false;
    boolean dateISO() default false;
    boolean number() default false;
    boolean digits() default false;
    String equalTo() default "";
    String additional() default "";
    String messages() default "";
}
