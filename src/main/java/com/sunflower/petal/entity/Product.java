package com.sunflower.petal.entity;

import java.net.URL;

/**
 * Created by xiangkui on 14-2-22.
 */
public class Product {
    private Long id;
    private String manufacturers;//厂家
    private URL img;//图片
    private String name;
    private String xinghao;

    //getter and setter

    public String getManufacturers() {
        return manufacturers;
    }

    public void setManufacturers(String manufacturers) {
        this.manufacturers = manufacturers;
    }

    public URL getImg() {
        return img;
    }

    public void setImg(URL img) {
        this.img = img;
    }

    public String getXinghao() {
        return xinghao;
    }

    public void setXinghao(String xinghao) {
        this.xinghao = xinghao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
