package kr.co.fcsoft.core.bean.datatables;

/**
 * Created by ez2sarang on 2014. 11. 11..
 */
public class Search {
    private String value;
    private boolean regex;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isRegex() {
        return regex;
    }

    public void setRegex(boolean regex) {
        this.regex = regex;
    }

    @Override
    public String toString() {
        return "Search{" +
                "value='" + value + '\'' +
                ", regex=" + regex +
                '}';
    }
}
