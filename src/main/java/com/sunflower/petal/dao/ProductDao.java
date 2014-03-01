package com.sunflower.petal.dao;

import com.sunflower.petal.entity.Product;
import com.sunflower.petal.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by xiangkui on 14-2-15.
 */
@Component
public interface ProductDao {
    @Insert("insert into product(name,manufacturers) values (#{product.name},#{product.manufacturers})")
    void add(@Param("product") Product product);

    @Delete(" delete from product where id=#{id}")
    void delete(@Param("id")Long id);

    @Update("update product set name=#{product.name},manufacturers=#{product.manufacturers} where id=#{product.id}")
    int updateById(@Param("product") Product product);

    @Select(" select * from product where id=#{id}")
    Product queryById(@Param("id") Long id);

    @Select("select * from product where name=#{name}")
    Product queryByName(@Param("name") String name);

    @Select(" select * from product order by id asc ")
    List<Product> listAll();

    @Select(" select * from product order by id asc limit #{pageSize} offset #{offset} ")
    List<Product> getProductByPage(@Param("offset") int offset, @Param("pageSize") int pageSize);//offset=pageSize*(page-1)}?
}