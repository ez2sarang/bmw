package org.mariapresso.impd.constant;

/**
 * Created by ez2sarang on 15. 12. 15..
 * Tiles 에서 page 네임룰 패턴과 함께 사용된다.
 */
public enum Pages {
    main, xml, json, excel, popup, info, html;
    public String viewPage(String path) {
        return String.format("%s_%s", path, this);
    }
    public String viewAdmin(String path) {
        return String.format("%s_%s", path, this);
    }
}
