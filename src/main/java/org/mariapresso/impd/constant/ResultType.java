package org.mariapresso.impd.constant;

/**
 * Created by ez2sarang on 15. 4. 8..
 * 일단은 사용자 권한 관련한 결과코드가 주 목적이다.
 */
public enum ResultType {
    OK("100")/*정상 처리*/
    , UNKNOWN_ERROR("200")/*알 수 없는 에러*/
    , INVALID_PARAMETER("204")/*잘못된 파라미터, 필수 파라미터 누락*/
    , NOT_FOUND("205")/*원하는 결과를 찾을 수 없음*/
    , SESSION_OUT("210") /*세션이 올바르지 않습니다.*/
    , INVALID_TOKEN("211")/*올바르지 않은 경로를 통한 요청입니다.*/
    , INVALID_USER("301")/*계정 정보가 존재하지 않습니다.*/
    , INVALID_PASSWORD("302")/*비밀번호가 잘 못 되었습니다.*/
    , CLOSED("307")/*판매가 종료된 상품입니다.*/
    ;

    public final String code;

    ResultType(String code) {
        this.code = code;
    }

    public String toString() {
        return String.format("{'%s':%s}", name(), code);
    }
    public static String getReference() {
        return String.format(
                "[%s,%s,%s,%s,%s,%s,%s,%s,%s]"
                , OK.toString()
                , UNKNOWN_ERROR.toString()
                , INVALID_PARAMETER.toString()
                , NOT_FOUND.toString(),SESSION_OUT.toString()
                , INVALID_TOKEN.toString()
                , INVALID_USER.toString()
                , INVALID_PASSWORD.toString()
                , CLOSED.toString());
    }
}
