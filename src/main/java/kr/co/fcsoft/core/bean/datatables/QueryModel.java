package kr.co.fcsoft.core.bean.datatables;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ez2sarang on 2014. 11. 10..
 */
@Slf4j
public class QueryModel {
    private int draw = 1;
    private int start;
    private int length;
    private List<Columns> columns;
    private List<Order> order;
    private Search search = new Search();

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public List<Columns> getColumns() {
        return columns;
    }

    public void setColumns(List<Columns> columns) {
        this.columns = columns;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public Search getSearch() {
        return search;
    }

    public void setSearch(Search search) {
        this.search = search;
    }

    public QueryModel() {
    }

    public QueryModel(Map<String, String[]> requestMap) {
    	this.columns = new ArrayList<>();
    	this.order = new ArrayList<>();
    	
    	String regex = "(\\[)([a-zA-Z]*)(\\])";
    	Pattern pattern = Pattern.compile(regex);

        String name, numberStr;
        String[] value;
        Matcher matcher;
        StringBuffer sb = new StringBuffer();
        for (Map.Entry<String, String[]> entry : requestMap.entrySet()) {
    		name = entry.getKey();
    		value = entry.getValue();
    		sb.append(name.replaceAll(regex, ""));
    		matcher = pattern.matcher(name);
    		while (matcher.find()) {
    			sb.append(".").append(matcher.group(2));
    		}
    		try {
    			if(sb.toString().indexOf("columns[")>=0) {
                    numberStr = sb.toString().replaceAll("[^0-9]","");
      				if(Integer.valueOf("".equals(StringUtils.trimToEmpty(numberStr))?"0":numberStr) + 1 > columns.size()) {
      					columns.add(new Columns());
                    }
      			} else if(sb.toString().indexOf("order[")>=0) {
                    numberStr = sb.toString().replaceAll("[^0-9]","");
    				if(Integer.valueOf("".equals(StringUtils.trimToEmpty(numberStr))?"0":numberStr) + 1 > order.size()) {
      					order.add(new Order());
      				}
      			}
    			BeanUtils.copyProperty(this, sb.toString(), Arrays.toString(value).replaceAll("\\[|\\]", ""));
    		} catch (Exception e) {
    			log.warn("Exception:%s\n%s=%s\n", e.getMessage(), sb.toString(), Arrays.toString(value).replaceAll("\\[|\\]", ""));
    		}
    		sb.setLength(0);
        }
    }

    public Sort getSortOrder() {
        List<Sort.Order> sortOrder = new ArrayList<Sort.Order>();
        for (Order order : getOrder()) {
            if (!"".equals(order.getColumn())) {
                if ("desc".equalsIgnoreCase(order.getDir())) {
                    sortOrder.add(new Sort.Order(Sort.Direction.DESC, getColumns().get(order.getColumn()).getData()));
                } else {
                    sortOrder.add(new Sort.Order(Sort.Direction.ASC, getColumns().get(order.getColumn()).getData()));
                }
            }
        }
        return sortOrder.size()==0 ? null : Sort.by(sortOrder);
    }

    public Pageable getPageable() {
        return PageRequest.of(((getStart() + 1) / getLength()), getLength(), getSortOrder());
    }
}


