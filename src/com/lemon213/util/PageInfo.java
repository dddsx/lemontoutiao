package com.lemon213.util;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

/**
 * @author xiaobu
 */
public class PageInfo<T> implements Serializable{
    // 每一页记录数
    private int pageSize = 1;
    // 总页数
    private int totalPage = 0;
    // 总记录数
    private int totalItem = 0;
    // 请求页数
    private int requestPage = 1;
    // mysql筛选起始处
    private int startIndex;
    // mysql筛选条目数
    private int selectNum;
    // 数据
    private List<T> dataList;

    public PageInfo(){}

    public PageInfo(int totalItem, int pageSize, int requestPage){
        this.totalItem = totalItem;
        this.pageSize = pageSize;
        this.requestPage = requestPage;
    }

    public void Init(){
        countTotalPage();
        checkRequestPage();
        countStartIndex();
        countSelectNum();
    }

    private void countTotalPage(){
        if(totalItem == 0){
            totalPage = 0;
        } else if(totalItem % pageSize == 0){
            totalPage = totalItem / pageSize;
        } else{
            totalPage = totalItem / pageSize + 1;
        }
    }

    private void checkRequestPage(){
        if(requestPage <= 0)
            requestPage = 1;
        if(requestPage > totalPage)
            requestPage = totalPage;
    }

    private void countStartIndex(){
        if(requestPage != 0)
            startIndex = pageSize  * (requestPage - 1);
        else
            startIndex = 0;
    }

    private void countSelectNum(){
        if(requestPage == 0){
            selectNum = 0;
        } else if(totalItem % pageSize == 0 || requestPage < totalPage){
            selectNum = pageSize;
        } else {
            selectNum = totalItem % pageSize;
        }
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

    public int getRequestPage() {
        return requestPage;
    }

    public void setRequestPage(int requestPage) {
        this.requestPage = requestPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getSelectNum() {
        return selectNum;
    }

    public void setSelectNum(int selectNum) {
        this.selectNum = selectNum;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    @Override
    public String toString() {
        return "PageInfo{" +
                "pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                ", totalItem=" + totalItem +
                ", requestPage=" + requestPage +
                ", startIndex=" + startIndex +
                ", selectNum=" + selectNum +
                ", dataList=" + dataList +
                '}';
    }
}
