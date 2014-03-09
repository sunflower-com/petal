package com.sunflower.petal.service;

import com.sunflower.petal.dao.MaterialDao;
import com.sunflower.petal.entity.Material;
import com.sunflower.petal.entity.Pagination;
import com.sunflower.petal.service.support.Paginationable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xiangkui on 14-2-13.
 */
@Service("materialService")
public class MaterialService implements Paginationable<Material>{
    @Autowired
    private MaterialDao materialDao;

    /**
     * 保存一个材料，材料名字区分唯一
     * @param material 材料
     */
    public void putMaterialByName(Material material){
        Material material_db=materialDao.queryByName(material.getName());
        if(null==material_db){
            materialDao.add(material);
        }else{
            materialDao.updateByName(material);
        }
    }

    public Material getMaterialByName(String name){
        return materialDao.queryByName(name);
    }

    /**
     * 添加一个材料项
     * @param material
     */
    public void saveMaterial(Material material){
        materialDao.add(material);
    }

    public List<Material> getAllMaterials(){
       return materialDao.listAll();
    }
    public Material getMaterial(Long id){
        return materialDao.queryById(id);
    }
    public int deleteMaterial(Long id){
        return materialDao.deleteById(id);
    }


    @Override
    public Pagination<Material> getPagination(int pageSize, int pageIndex) {
        int start=pageSize*pageIndex;
        List<Material> list=materialDao.listPage(start,pageSize);
        Pagination<Material> pagination=new Pagination<Material>();
        pagination.setPageSize(pageSize);
        pagination.setCurrentPage(pageIndex);
        pagination.setList(list);
        return pagination;
    }
}
