package org.mariapresso.impd.constant;

/**
 * Created by ez2sarang on 15. 6. 8..
 * UI에서 사용할 목적으로 처음 구상하였다.
 */
public enum MenuType {
    MENU("01"), LIST("05"), SERIES("11");
    public final String code;
    MenuType(String code) {
        this.code = code;
    }
    public static MenuType get(String code) {
        switch (Integer.parseInt(code)) {
            case 1:
                return MENU;
            case 5:
                return LIST;
            case 11:
                return SERIES;
            default:
                return null;
        }
    }
}
