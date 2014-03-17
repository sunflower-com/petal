package com.sunflower.petal.dao;
import com.sunflower.petal.entity.Image;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ImageDao {
    
    public List<Image> list();
    
    public Image create(Image image);
    
    public Image get(Long id);
    
    public void delete(Image image);
}
