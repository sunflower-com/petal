package com.sunflower.petal.entity;

/**
 * Created by xiangkui on 14-2-13.
 */
public class Material {
    private Long id;
    private String identifier;
    private String name;
    private MaterialCategory materialCategory;//材料类别
    private String guige;
    private String yanse;
    private String danwei;
    private Double jinjia;
    private String beizhu;

    public Long getCategoryId(){
      if(materialCategory!=null)
          return materialCategory.getId();
        else{
          return null;
      }
    }
    public void setCategoryId(Long categoryId){
        if(materialCategory!=null){
            materialCategory.setId(categoryId);
        }else{
            materialCategory=new MaterialCategory(categoryId,null);
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MaterialCategory getMaterialCategory() {
        return materialCategory;
    }

    public void setMaterialCategory(MaterialCategory materialCategory) {
        this.materialCategory = materialCategory;
    }

    public String getGuige() {
        return guige;
    }

    public void setGuige(String guige) {
        this.guige = guige;
    }

    public String getYanse() {
        return yanse;
    }

    public void setYanse(String yanse) {
        this.yanse = yanse;
    }

    public String getDanwei() {
        return danwei;
    }

    public void setDanwei(String danwei) {
        this.danwei = danwei;
    }

    public Double getJinjia() {
        return jinjia;
    }

    public void setJinjia(Double jinjia) {
        this.jinjia = jinjia;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }
}
