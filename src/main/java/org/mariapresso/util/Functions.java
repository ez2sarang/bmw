package org.mariapresso.util;

import java.util.Arrays;
import java.util.Collection;

import kr.co.fcsoft.core.bean.EntityObject;
//import kr.co.fcsoft.dho.common.model.CommonCode;
//import kr.co.fcsoft.dho.exception.EntityConfigException;
//import kr.co.fcsoft.dho.util.MessageSourceAccessor;

import org.apache.commons.beanutils.PropertyUtils;
import org.hibernate.mapping.Column;
import org.hibernate.mapping.PersistentClass;
import org.hibernate.mapping.Property;
import org.springframework.context.NoSuchMessageException;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

public class Functions {
	/**
	 * 입력받은 두개의 문자를 합친다.
	 * @param arg1
	 * @param arg2
	 * @return
	 */
	public static String concat(String arg1, String arg2) {
		return String.format("%s%s", String.valueOf(arg1), String.valueOf(arg2));
	}

	/**
	 * 컬렉션에세 입력받은 키값의 value값을 리턴한다.
	 * @param box collection타입의 객체
	 * @param key
	 * @return
	 */
	/*public static String get(Collection box, Object key) {
		for (Object compare : box) {
			if (compare.equals(key)) {
				if (compare instanceof CommonCode) {
					return ((CommonCode) compare).getCodeName();
				}*//* else if (compare instanceof SystemInfo) {
					return String.format("%s:%s",((SystemInfo) compare).getHost(),((SystemInfo) compare).getPort());
				}*//*
				return compare.toString();
			}
		}
		return key==null?"":key.toString();
	}*/

	/**
	 * 입력받은 문자를 체크하여,
	 * null, [null]형태 문자를 ""값으로 trim하여 리턴하고,
	 * 인자값으로 널문자일경우 치환하는 문자를 입력했을 경우 해당 문자로 치환하여 리턴한다.  
	 * @param str
	 * @param ifNullTemp 문자가 널일경우 치환할 문자
	 * @return
	 */
	public static String nullToEmptyString(Object str, String...ifNullTemp) {
		if (str == null || "null".equals(str.toString().toLowerCase().trim())) {
			return ifNullTemp!=null&&ifNullTemp.length>0?ifNullTemp[0]:"";
		}
		return str.toString().trim();
	}
	
	/**
	 * 널문자이면 해당  정수형으로 변환
	 * @param str 문자열
	 * @param ifNullTemp 변환정수형
	 * @return 변환정수형
	 */
	public static int nullToInteger(Object str, int...ifNullTemp){
		if("".equals(nullToEmptyString(str))) {
			return ifNullTemp!=null&&ifNullTemp.length>0?ifNullTemp[0]:0;
		}
		try {
			return Integer.parseInt(str.toString());
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	
	/**
	 * 유효한 값인지 체크한다.
	 * @param checkValue 검사할 대상
	 * @param doNotWant 원치않는 값.
	 * @return 사용가능하면true, 불가능하면 false
	 */
	public static boolean isUseful(Integer checkValue, int...doNotWant) {
		if(checkValue == null) {
			return false;
		} else if(doNotWant!=null && doNotWant.length>0) {
			for(int compareValue : doNotWant) {
				if(checkValue == compareValue) {
					return false;
				}
			}
		}
		return true;
	}
	
	public static String cutString(String str, int limitSize, String more) {
		return cutStringByteToCenter(str,limitSize,more);
	}

	/**
	 * 최대문자길이(byte)를 초과했을 경우 문자를 최대치까지 잘라서 리턴하던가,
	 * 입력받은 more문자로 리턴한다.
	 * @param str
	 * @param limitSize 문자최대길이(byte)
	 * @param more 치환할 문자
	 * @return
	 */
	public static String cutStringByte(String str, int limitSize, String... more) {
		if (str == null) {
			return "";
		}
		byte[] strBytes = str.getBytes();
		if (strBytes.length > limitSize) {
			if (more != null && more.length > 0) {
				return new String(Arrays.copyOf(strBytes, limitSize - more[0].getBytes().length)) + more[0];
			} else {
				return new String(Arrays.copyOf(strBytes, limitSize));
			}
		} else {
			return str;
		}
	}
	
	public static String cutStringByteToCenter(String str, int limitSize, String... more) {
		if (str == null) {
			return "";
		}
		byte[] strBytes = str.getBytes();
		if (strBytes.length > limitSize) {
			if (more != null && more.length > 0) {
				int totalSize = strBytes.length;
				int centerPoint = more[0].getBytes().length/2;
				return String.format(
						"%s%s%s",
						new String(Arrays.copyOf(strBytes, limitSize / 2
								- centerPoint)),
						more[0],
						new String(Arrays.copyOfRange(
								strBytes,
								(int)(totalSize - limitSize/2
										+ Math.ceil(((double) more[0]
												.getBytes().length) / 2d)),
								totalSize)));
			} else {
				return new String(Arrays.copyOf(strBytes, limitSize));
			}
		} else {
			return str;
		}
	}
	
	/*public static String cutStringByte(Property column, String str, String... more) {
		try {
			return cutStringByte(str, ((Column)column.getColumnIterator().next()).getLength(), more);
		} catch (Exception e) {
			throw new EntityConfigException();
		}
	}*/
	
	/*public static String cutStringByte(LocalSessionFactoryBean factoryBean, EntityObject entity, String propertyName, String... more) {
		try {
			return cutStringByte(
					PropertyUtils.getProperty(entity, propertyName).toString(),
					((Column) getEntityProperty(
							(LocalSessionFactoryBean)factoryBean,
							entity, propertyName).getColumnIterator().next())
							.getLength(), more);
		} catch (Exception e) {
			throw new EntityConfigException();
		}
	}*/

	public static Property getEntityProperty(LocalSessionFactoryBean factoryBean, Object entity, String propertyName) {
		/*PersistentClass persistentClass = factoryBean.getConfiguration().getClassMapping(entity.getClass().getName());
	    Property property = persistentClass.getProperty(propertyName);
	    return property;*/
		return null;
	}
	
	/*public static String message(MessageSourceAccessor wmSource, String key) {
		try {
			return wmSource.getMessage(key);
		} catch (Exception e) {
			e.printStackTrace();
			if(null == wmSource) {
				return "wm:null";
			} else if(null == key) {
				return "key:null";
			} else {
				return "no message";
			}
		}
	}*/
	
	public static String getOppositeFlag(String serviceFlag) {
		if(serviceFlag == null) {
			return "";
		}
		switch(serviceFlag.charAt(0)) {
			case '1':
				return "2";
			case '2':
				return "1";
			default:
				return "";
		}
	}
	
	public static String replaceAll(Object object, String exp, String replace) {
		return object==null?"":object.toString().replaceAll(exp, replace);
	}
	
    /**
     * 해당 Text에 대해 우측에 character문자를 추가하여 지정한 공간만큼 맞춤
     * @param text String
     * @param space int
     * @param character char
     * @return String
     */
    public static String rpad(String text, int space, char character)
    {
        if (text == null)
            return text;
        try
        {
            if (space - text.length() < 0)
            {
                return text.substring(0, space);
            }
            for (int i = 0, n = space - text.length(); i < n; i++)
            {
                text += character;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return text;
    }
    
    /**
     * 해당 Text에 대해 좌측에 character문자를 추가하여 지정한 공간만큼 맞춤
     * @param text String
     * @param space int
     * @param character char
     * @return String
     */
    public static String lpad(String text, int space, char character)
    {
        if (text == null)
            return text;
        String tmp = "";
        try
        {
            if (space - text.length() < 0)
            {
                return text.substring(0, space);
            }
            for (int i = 0, n = space - text.length(); i < n; i++)
            {
                tmp += character;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return tmp + text;
    }
    
    public static Object getProperty(Object entity, String name) {
    	try {
    		if(null == entity) {
    			return "";
    		}
    		return PropertyUtils.getProperty(entity, name);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}
