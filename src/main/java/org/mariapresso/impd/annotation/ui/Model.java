package org.mariapresso.impd.annotation.ui;

import org.mariapresso.impd.annotation.ModelType;
import org.mariapresso.impd.annotation.Role;

/**
 * Created by ez2sarang on 2015. 7. 7..
 */

/**
 * 선언된 필드에 Model이 중복 됐을 경우 refer가 선언되지 않았으면, 해당 타입에 선언된 Action값 별로 Model이 각각 적용된다.
 * refer가 존재한다면, refer값에 선언된 Action값과 동일한 곳에 해당 Model이 적용된다.
 */
public @interface Model {
    String name() default "";
    String label() default "";
    /**
     * input, select, password, hidden, radio, checkbox, date, file ...
     * @return
     */
    ModelType type() default ModelType.input;
    /**
     * select 같은 배열형식으로 나열할때 들어가는 옵션값.
     * 언어선택 : ["ko:KO", "en:EN", "de:DE", "fr:FR", "es:ES", "cs:CZ"]
     * 페이징갯수 : ["-1:-1",":''","0:0","5:5","10:10","15:15"]
     * 정열방식 : ["ASC:ASC","DESC:DESC"]
     * 검색대상 : [":모두", "1:offset", "2:currentTime"]
     * @return
     */
    String[] options() default {};
    /**
     * 기본 세팅 값
     * Model 타입이 select나 radio 같은 배열형식이라면, index값
     * @return
     */
    String value() default "";
    /**
     * 값에 대한 포맷형식. 대표적으로 날짜타입의 형식
     * yyyymmdd
     * @return
     */
    String format() default "";
    /**
     * 설명
     * @return
     */
    String help() default "";
    /**
     * 참조할 Action 값
     * @return
     */
    String refer() default "";

    Role[] role() default Role.all;

    Rule[] validate() default {};

    int displayOrder() default 0;

}
