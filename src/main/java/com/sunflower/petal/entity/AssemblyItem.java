package com.sunflower.petal.entity;

/**
 * Created by xiangkui on 14-2-22
 * 组装规则中一个明细
 * 如：
 * 材料 个数 说明.
 */
public class AssemblyItem {
    private Material material;//材料
    private Integer count;
    private String beizhu;

    private Long ruleId;//assemblyRule外键

    public AssemblyItem(Material material,Integer count){
        this.material=material;
        this.count=count;
    }

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }
}
