package kr.co.fcsoft.core.bean;

import kr.co.fcsoft.core.bean.datatables.DataTableCustomCompare;
import kr.co.fcsoft.core.bean.datatables.QueryModel;
import org.springframework.data.domain.Page;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Created by leesangyoub on 16. 5. 12.
 */
public class DataTableObject {
	public DataTableObject() {
	}

	public DataTableObject(Page<?> result) {
		this.recordsTotal = result.getTotalElements();
		data = result.getContent();
	}

	public void add(Page<?> result) {
		this.data = result.getContent();
		this.recordsTotal = result.getTotalElements();
		setRecordsFiltered(result.hasContent()?data.size():0);
	}

	/**
	 * TODO to change the property.
	 * @param result
	 * @param query
	 */
	public void add(Map result, QueryModel query) {
		if(null != result && !result.isEmpty()) {
			this.data = (List)((Map) result.get("movieListResult")).get("movieList");
			this.recordsFiltered = this.recordsTotal = Float.valueOf(((Map) result.get("movieListResult")).get("totCnt").toString()).intValue();
			Collections.sort(this.data, new DataTableCustomCompare(
					query.getColumns().get(query.getOrder().get(0).getColumn()).getData()
					, "asc".equalsIgnoreCase(query.getOrder().get(0).getDir())
			));
			if(this.data.size() > query.getLength()) {
				this.data = this.data.subList(query.getStart(), query.getLength());
			}
		}
	}

	private int draw;

	private long recordsTotal;

	private long recordsFiltered;

	private List<?> data;

	private String error;

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public long getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(long recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public long getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(long recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
}
