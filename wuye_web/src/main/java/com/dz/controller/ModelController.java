package com.dz.controller;

import com.dz.pojo.Model;
import com.dz.service.ModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/model/")
public class ModelController {
    //户型
    @Autowired
    private ModelService modelService;

    /*跳转到户型列表   用model表*/
    @RequestMapping(value = "modellist")
    public String modellist(org.springframework.ui.Model model){
        List<Model> modelList = modelService.findAllModel(model);
        model.addAttribute("modellist",modelList);
        return "model/model-list";
    }
    /*跳转到添加户型*/
    @RequestMapping(value = "addmodel")
    public String addmodel(){
        return "model/model-add";
    }

    /*删除户型信息*/
    @RequestMapping(value = "deletemodel")
    public String deletemodel(int id){
        modelService.deletemodel(id);
        return "redirect:modellist";
    }
    /*添加户型信息*/
    @RequestMapping(value = "savemodel")
    public String savemodel(String modelname,int area,String note,double propertmoney){
        Model model = new Model();
        model.setModelname(modelname);
        model.setArea(area);
        model.setNote(note);
        model.setPropertmoney(propertmoney);
        modelService.savemodel(model);
        return "redirect:modellist";
    }
}
