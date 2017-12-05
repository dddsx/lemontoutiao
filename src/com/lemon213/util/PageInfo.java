package com.lemon213.util;

import java.io.Serializable;
import java.util.List;

/**
 * @author xiaobu
 */
public class PageInfo<T> implements Serializable{
    // 每一页记录数
    private int pageSize;
    // 总页数
    private int totalPage;
    // 总记录数
    private int totalItem;
    // 当前页数
    private int currentPage;

    private List<T> dataList;

    public PageInfo(){

    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(int totalItem) {
        this.totalItem = totalItem;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }
}
