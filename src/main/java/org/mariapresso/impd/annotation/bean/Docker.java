package org.mariapresso.impd.annotation.bean;

import com.google.common.collect.Lists;
import lombok.Data;
import org.mariapresso.impd.annotation.ActionType;
import org.mariapresso.impd.annotation.ui.Action;

import java.io.Serializable;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by ez2sarang on 2015. 7. 7..
 */
public @Data class Docker implements Serializable {
    private String link;
    private String title;
    private ActionType type;
    private int displayOrder;
    private List<Component> components = Lists.newArrayList();

    public Docker(Action action) {
        this.link = action.value();
        this.title = action.title();
        this.displayOrder = action.displayOrder();
        this.type = action.type();
    }

    public List<Component> getComponents() {
        Collections.sort(components, new Comparator<Component>() {
            @Override
            public int compare(Component o1, Component o2) {
                return o1.getDisplayOrder() < o2.getDisplayOrder() ? -1 : o1.getDisplayOrder() > o2.getDisplayOrder() ? 1:0;
            }
        });
        return components;
    }
}