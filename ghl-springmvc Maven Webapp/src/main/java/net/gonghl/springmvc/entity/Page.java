package net.gonghl.springmvc.entity;

import java.util.List;

/**
 * 这个分页信息工具类,只用来保存从HibernateDao中取得的分页信息
 *
 */
public class Page<T> {
	// 总记录数
	private long totalRecord = 0;
	// 每页记录数
	private long pageSize = 10;
	// 当前页
	private long pageNo  = 1;
	// 页面总数
	private long totalPage = 0;
	// 每一页的记录数
	private List<T> pageRows;
	
	public Page(){
		totalRecord = 0;
		pageSize = 10;
		pageNo  = 1;
		totalPage = 0;
		pageRows = null;
	}
	
	public long gettotalRecord() {
		return totalRecord;
	}
	public void settotalRecord(long totalRecord) {
		this.totalRecord = totalRecord;
	}
	public long getPageSize() {
		return pageSize;
	}
	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}
	public long getPageNo() {
		return pageNo;
	}
	public void setPageNo(long pageNo) {
		this.pageNo = pageNo;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public List<?> getPageRows() {
		return pageRows;
	}
	public void setPageRows(List<T> pageRows) {
		this.pageRows = pageRows;
	}
	public void countTotalPage(long totalRecord) {
		this.settotalRecord(totalRecord);
		if(totalRecord==0){
			this.totalPage = 0;
		}else if(totalRecord%pageSize==0){
			this.totalPage = totalRecord/pageSize;
		}else{
			this.totalPage = totalRecord/pageSize+1;
		}
	}
	
	public void setPageInfo(long pageNo, long pageSize, long totalRecord, List<T> pageRows){
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.pageRows = pageRows;
		this.totalRecord = totalRecord;
		this.setPageRows(pageRows);
		this.settotalRecord(totalRecord);
		if(totalRecord==0){
			this.totalPage = 0;
		}else if(totalRecord%pageSize==0){
			this.totalPage = totalRecord/pageSize;
		}else{
			this.totalPage = totalRecord/pageSize+1;
		}
	}
}
