package com.sunflower.petal.controller;

import com.sunflower.petal.entity.Material;
import com.sunflower.petal.entity.Pagination;
import com.sunflower.petal.entity.Product;
import com.sunflower.petal.service.support.Paginationable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiangkui on 14-3-2.
 * 分页控制器
 */
@Controller
@RequestMapping("/pagination")
public class PaginationControl{
    @Autowired
    Map<String,Paginationable> paginationables=new HashMap<String, Paginationable>();

    @RequestMapping(value = "/{objName}")
    public @ResponseBody
    Pagination getPagination(@PathVariable("objName") String objName,@RequestParam("pageSize") int pageSize,@RequestParam("pageIndex") int pageIndex){
        if("material".equals(objName)){
            Paginationable paginationable=paginationables.get("materialService");
            if(null==paginationable)
                throwUnsopportExp("material is not support,because materialService is not exsited");
            Pagination<Material> materialPagination=paginationable.getPagination(pageSize,pageIndex);
            return materialPagination;
        }else if("product".equals(objName)){
            Paginationable paginationable=paginationables.get("productService");
            if(null==paginationable)
                throwUnsopportExp("product is not support,because productService is not exsited");
            Pagination<Product> productPagination=paginationable.getPagination(pageSize,pageIndex);
            return productPagination;
        }else{
            throw new UnsupportedOperationException("not supported pagination obj:"+objName);
        }
    }

    private void throwUnsopportExp(String message){
        throw new UnsupportedOperationException(message);
    }
}
