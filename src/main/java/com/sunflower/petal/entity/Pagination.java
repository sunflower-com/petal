package com.sunflower.petal.entity;

import java.util.ArrayList;
import java.util.List;
import static com.sunflower.petal.common.Constants.*;
/**
 * Created by xiangkui on 14-3-1.
 */
public class Pagination {
    private int currentPage=1;
    private int pageSize=PAGE_SIZE;
    private int totalRow=0;
    private List<Integer> pages=new ArrayList<Integer>();
    /*总页数*/
    private int totalPage;
    private int startRow=0;
    private Object queryObject;
    private List objList;

    public Pagination(){

    }
    public Pagination(int pageSize){
        this.pageSize=pageSize;
        this.currentPage=1;
        this.totalRow=1;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        if (currentPage==0) {
            return;
        }
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    public int getStartRow() {
        if(this.currentPage>1){
            this.startRow=(this.currentPage-1)*this.pageSize;
        }else{
            this.startRow=0;
        }
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public List<Integer> getPages() {
        this.pages.clear();
        for(int i=0;i<this.totalPage;i++){
            try{
                this.pages.add(i+1);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return pages;
    }

    public void setPages(List<Integer> pages) {
        this.pages = pages;
    }

    public Object getQueryObject() {
        return queryObject;
    }

    public void setQueryObject(Object queryObject) {
        this.queryObject = queryObject;
    }

    public List getObjList() {
        return objList;
    }

    public void setObjList(List objList) {
        this.objList = objList;
    }
    public int getTotalPage() {
        this.totalPage = this.totalRow / this.pageSize;
        if (this.totalRow % this.pageSize != 0) {
            this.totalPage += 1;
        }
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
