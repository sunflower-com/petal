package com.sunflower.petal.controller;

import com.sunflower.petal.entity.Material;
import com.sunflower.petal.entity.MaterialCategory;
import com.sunflower.petal.service.MaterialCategoryService;
import com.sunflower.petal.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by xiangkui on 14-2-15.
 */
@Controller
@RequestMapping("/material")
public class MaterialControl {
    @Autowired
    private MaterialService materialService;
    @Autowired
    private MaterialCategoryService categoryService;

    @RequestMapping(value="",method = RequestMethod.GET)
    public String material(Model model){
        List<MaterialCategory> result=categoryService.getAllMaterialCategorys();
        model.addAttribute("categorys",result);
        return "material/materialInfoPanel";
    }
    @RequestMapping(value= "/list")
    public String getAllList(Model model){
        List<Material> result=materialService.getAllMaterials();
        model.addAttribute("materials",result);
        return "material/materialListPanel";
    }
    @RequestMapping(params = "method=saveMaterial",method = RequestMethod.POST)
    public String saveMaterial(@ModelAttribute("material") Material material){
        materialService.saveMaterial(material);
        return "redirect:/material?method=getAllList";
    }


    @RequestMapping(params = "method=getMaterial",method= RequestMethod.GET)
    public String getMaterial(@RequestParam("id") Long id,Model model){
        Material material=materialService.getMaterial(id);
        model.addAttribute("material",material);
        return "material/materialInfoPanel";
    }

    @RequestMapping(params = "method=deleteMaterial",method= RequestMethod.GET)
    public String deleteMaterial(@RequestParam("id") Long id){
        int result=materialService.deleteMaterial(id);
        return "redirect:/material?method=getAllList";
    }
}