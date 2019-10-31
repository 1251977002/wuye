package com.dz.controller;

import com.dz.pojo.Model;
import com.dz.service.ModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/model/")
public class ModelController {
    //户型
    @Autowired
    private ModelService modelService;
    /*跳转到户型列表   用model表*/
    @RequestMapping(value = "modellist")
    public String modellist(){
        return "model/model-list";
    }
    /*跳转到添加户型*/
    @RequestMapping(value = "addmodel")
    public String addmodel(){
        return "model/model-add";
    }

    //查找所有的户型及面积
    @RequestMapping(value = "findAll",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Model> findAll(){
        return modelService.findAll();
    }

    //通过id查找户型物业费
    @RequestMapping(value = "findModelById",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Model findModelById(int modelid){
        return modelService.findModelById(modelid);
    }
}
