package com.dz.controller;

import com.dz.pojo.Model;
import com.dz.service.ModelService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    /*分页*/
    @RequestMapping(value = "findByPage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo findByPage(int pageNum){
        PageInfo pageInfo = modelService.findByPage(pageNum);
        return pageInfo;
    }

    /*编辑*/
    @RequestMapping(value = "edit",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public int updateUser(Model model){
        modelService.edit(model);
        return 0;
    }
}
