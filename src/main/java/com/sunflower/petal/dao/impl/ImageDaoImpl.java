package com.sunflower.petal.dao.impl;

import com.sunflower.petal.dao.ImageDao;
import com.sunflower.petal.entity.Image;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by xiangkui on 2014/3/23.
 */
@Component
public class ImageDaoImpl implements ImageDao{

    public List<Image> list() {
        return null;
    }

    @Override
    public Image create(Image image) {
        return null;
    }

    @Override
    public Image get(Long id) {
        return null;
    }

    @Override
    public void delete(Image image) {

    }
}
