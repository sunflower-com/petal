package com.sunflower.petal.dao;

import com.sunflower.petal.entity.Material;
import com.sunflower.petal.entity.MaterialCategory;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by xiangkui on 14-2-13
 * 原材料数据库持久层.
 */
@Component
public interface MaterialDao {
    @Insert("insert into material(identifier,name,categoryId,guige,yanse,danwei,jinjia,beizhu) values " +
            "(#{identifier},#{name},#{materialCategory.id},#{guige},#{yanse},#{danwei},#{jinjia},#{beizhu})")
    public void add(Material material);

    @Delete("delete from material where id=#{id}")
    public int deleteById(Long id);

    @Update(" update material set name=#{material.name},categoryId=#{material.materialCategory.id}," +
            "guige=#{material.guige},yanse=#{material.yanse}," +
            "danwei=#{material.danwei},jinjia=#{material.jinjia},beizhu=#{material.beizhu} " +
            "where name=#{material.name}")
    public int updateByName(@Param("material") Material material);

    @Select("select * from material,materialcategory where material.categoryId=materialcategory.id and material.id=#{id}")
    @Result(property = "materialCategory",column = "categoryId",javaType= MaterialCategory.class,
            one=@One(select="com.sunflower.petal.dao.MaterialCategoryDao.findById"))
    public Material queryById(@Param("id") Long id);

    @Select("select * from material where material.name=#{name}")
//    @Result(property = "materialCategory",column = "categoryId",javaType= MaterialCategory.class,
//            one=@One(select="com.sunflower.petal.dao.MaterialCategoryDao.findById"))
    public Material queryByName(@Param("name") String name);

    @Select("select * from material left outer join materialcategory on material.id=materialcategory.id")
    @Results(value = {
            @Result(property = "materialCategory",column = "categoryId",javaType= MaterialCategory.class,
                    one=@One(select="com.sunflower.petal.dao.MaterialCategoryDao.listAll"))
    })
    public List<Material> listAll();

    /**
     * 分页查询接口
     * @return
     */
    @Select("select * from material limit #{start},#{pageNum} ")
    public List<Material> listPage(@Param("start") int start,@Param("pageNum") int pageNum);
}
