package org.mariapresso.impd.constant;

import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

/**
 * Created by ez2sarang on 16. 3. 4..
 * <pre>
 *  Symbol   Meaning                 Presentation        Example
 *  ------   -------                 ------------        -------
 *  G        era designator          (Text)              AD
 *  y        year                    (Number)            1996
 *  M        month in year           (Text & Number)     July & 07
 *  d        day in month            (Number)            10
 *  h        hour in am/pm (1~12)    (Number)            12
 *  H        hour in day (0~23)      (Number)            0
 *  m        minute in hour          (Number)            30
 *  s        second in minute        (Number)            55
 *  S        millisecond             (Number)            978
 *  E        day in week             (Text)              Tuesday
 *  D        day in year             (Number)            189
 *  F        day of week in month    (Number)            2 (2nd Wed in July)
 *  w        week in year            (Number)            27
 *  W        week in month           (Number)            2
 *  a        am/pm marker            (Text)              PM
 *  k        hour in day (1~24)      (Number)            24
 *  K        hour in am/pm (0~11)    (Number)            0
 *  z        time zone               (Text)              Pacific Standard Time
 *  '        escape for text         (Delimiter)
 *  ''       single quote            (Literal)           '
 *
 *  [예시]
 *  Format Pattern                         Result
 *  --------------                         -------
 *  "yyyyMMdd"                        ->>  19960710
 *  "yyyy-MM-dd"                      ->>  1996-07-10
 *  "HHmmss"                          ->>  210856
 *  "HH:mm:ss"                        ->>  21:08:56
 *  "hh:mm:ss"                        ->>  09:08:56
 *  "yyyy.MM.dd HH:mm:ss"             ->>  1996.07.10 15:08:56
 *  "EEE, MMM d, ''yy"                ->>  Wed, July 10, '96
 *  "h:mm a"                          ->>  12:08 PM
 *  "hh 'o''clock' a, zzzz"           ->>  12 o'clock PM, Pacific Daylight Time
 *  "K:mm a, z"                       ->>  0:00 PM, PST
 *  "yyyyy.MMMMM.dd GGG hh:mm aaa"    ->>  1996.July.10 AD 12:08 PM
 *
 * </pre>
 */
public enum DateFormat {
    defualt("yyyy-MM-dd"), fullDateTime("yyyy-MM-dd HH:mm:ss")
    ;
    public final String code;
    DateFormat(String format) {this.code = format;}
    public DateTimeConverter getDateTimeConverter() {
        DateTimeConverter converter = new DateConverter();
        converter.setPattern(code);
        return converter;
    }
}
