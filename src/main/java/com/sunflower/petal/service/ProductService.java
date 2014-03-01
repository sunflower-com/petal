package com.sunflower.petal.service;

import com.sunflower.petal.dao.ProductDao;
import com.sunflower.petal.entity.Product;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by xiangkui on 14-2-23.
 */
@Service
public class ProductService {
    @Autowired
    private ProductDao dao;
    public void addOneProduct(Product product){
        dao.add(product);
    }

    /**
     * put 更新一个值
     */
    public void putProductByName(Product product){
        if(StringUtils.isBlank(product.getName()))
            throw new IllegalArgumentException("product name is blank");
        String name=product.getName();
        Product product_db=dao.queryByName(name);
        if(null==product_db){//入库
            dao.add(product);
        }else{//update
            dao.updateById(product);
        }
    }

    /**
     * get Product
     * @return
     */
    public Product getProductByName(String name){
     return dao.queryByName(name);
    }
}
