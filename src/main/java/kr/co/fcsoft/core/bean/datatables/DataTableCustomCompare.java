package kr.co.fcsoft.core.bean.datatables;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Comparator;

/**
 * Created by ez2sarang on 16. 6. 29..
 */
public class DataTableCustomCompare implements Comparator<Object> {
    private String targetColumn;
    private boolean ascending;

    public DataTableCustomCompare(String targetColumn, boolean ascending) {
        this.targetColumn = targetColumn;
        this.ascending = ascending;
    }

    @Override
    public int compare(Object o1, Object o2) {
        String s1, s2;
        try {
            s1 = BeanUtils.getProperty(o1, targetColumn);
            s2 = BeanUtils.getProperty(o2, targetColumn);
            if(ascending) {
                return s1.compareTo(s2);
            } else {
                return s2.compareTo(s1);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
