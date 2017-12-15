package cn.hzhy.oa.util;

import java.util.List;

/**
 * 分页查询工具类
 * 
 * @author Administrator
 * 
 */
public class PageUtil<T> {
	private int totalPages; // 总页数
	private int currPageNo=1; // 当前页
	private int prePageNo; // 上一页
	private int nextPageNo; // 下一页
	private List<T> list; // 查询

	/**
	 * 获取总页数
	 * @return
	 */
	public int getTotalPages() {
		return totalPages;
	}

	/**
	 * 设置总页数
	 * @param totalPages
	 */
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	/**
	 * 获取当前页码
	 * @return
	 */
	public int getCurrPageNo() {
		return currPageNo;
	}

	/**
	 * 设置当前页码
	 * @param currPageNo
	 */
	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}

	/**
	 * 获取查询结果
	 * @return
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * 设置查询结果
	 * @param list
	 */
	public void setList(List<T> list) {
		this.list = list;
	}

	/**
	 * 获取上一页
	 * @return
	 */
	public int getPrePageNo() {
		this.prePageNo=this.currPageNo-1;
		if(this.prePageNo<1){
			this.prePageNo=1;
		}
		return this.prePageNo;
	}

	/**
	 * 获取下一页
	 * @return
	 */
	public int getNextPageNo() {
		this.nextPageNo=this.currPageNo+1;
		if(this.nextPageNo>this.getTotalPages()){			
			//this.nextPageNo=this.totalPages;
			this.nextPageNo=this.getTotalPages();
		}
		return nextPageNo;
	}

}
