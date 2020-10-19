package org.mariapresso.impd.constant;

/**
 * Created by ez2sarang on 15. 4. 8..
 * 삭제예정..
 */
public enum ContentSubsetType {
    Movie("11")
    , Preview("12")
    , Poster("21")
    , Thumbnail("22")
    ;

    public final String code;

    ContentSubsetType (String code) {
        this.code = code;
    }
}
