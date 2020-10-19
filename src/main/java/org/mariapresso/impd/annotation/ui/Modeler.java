package org.mariapresso.impd.annotation.ui;

import java.lang.annotation.*;

/**
 * Created by ez2sarang on 2015. 7. 8..
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD, ElementType.TYPE})
public @interface Modeler {
    Model[] value() default {};
}
