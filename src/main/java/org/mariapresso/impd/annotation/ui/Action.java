package org.mariapresso.impd.annotation.ui;

import org.mariapresso.impd.annotation.ActionType;

/**
 * Created by ez2sarang on 2015. 7. 7..
 */
public @interface Action {
    String value();
    String title() default "";
    ActionType type() default ActionType.register;
    int displayOrder() default 1;
}
