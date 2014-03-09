package com.sunflower.petal.service.support;

import com.sunflower.petal.entity.Pagination;

/**
 * Created by xiangkui on 14-3-2.
 * 支持分页的查询服务
 */
public interface Paginationable<T> {
    /**
     * 按照每页 pageSize大小查询，查询第pageIndex+1页
     * @param pageSize 页大小
     * @param pageIndex  页索引
     * @param <T> 关联的实体beand
     */
    public Pagination<T> getPagination(int pageSize,int pageIndex);
}
