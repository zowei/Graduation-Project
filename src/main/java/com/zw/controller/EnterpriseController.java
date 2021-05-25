package com.zw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zw.bean.Enterprise;
import com.zw.bean.Msg;
import com.zw.service.EnterpriseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EnterpriseController {

    @Autowired
    EnterpriseService enterpriseService;




    //GET初始分页查询数据
    @RequestMapping(value = "/enps",method = RequestMethod.GET)
    @ResponseBody//将结果以json格式返回
    public Msg getEnps(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //在查询之前只需要调用startPage，
        //startPage紧跟的查询就是一个分页查询
        PageHelper.startPage(pn,7);
        List<Enterprise> enps=enterpriseService.getAll();
        //使用PageInfo包装查询后的结果，只需将PageInfo交给页面
        //封装了详细的分页信息，包括我们查询出来的数据,连续传入5页
        PageInfo page=new PageInfo(enps,5);
        //构建通用类Msg，返回状态信息，然后链式操作结果集放入Map集合当中
        return Msg.success().add("pageInfo",page);
    }


    //检验name是否重复
    @ResponseBody
    @RequestMapping(value = "/enp",method = RequestMethod.GET)
    public Msg checkName(@RequestParam("name") String name){
        if(enterpriseService.checkName(name)){
            return Msg.success();
        }else{
            return Msg.fail();
        }

    }

    //POST提交保存数据
    @ResponseBody
    @RequestMapping(value = "/enps",method = RequestMethod.POST)
    public Msg saveEnps(Enterprise enterprise){
        enterpriseService.saveEnps(enterprise);
        return Msg.success();
    }


    //根据id获得单条记录
    @RequestMapping(value = "/enp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEnp(@PathVariable("id") Integer id){
        Enterprise enterprise=enterpriseService.selectById(id);
        return Msg.success().add("enterprise",enterprise);
    }

    //PUT修改数据
    @ResponseBody
    @RequestMapping(value = "/enp/{id}",method = RequestMethod.PUT)
    public Msg updateEnp(Enterprise enterprise){
        enterpriseService.updateEnp(enterprise);
        return Msg.success();
    }

    //单个删除
    @ResponseBody
    @RequestMapping(value = "/enp/{id}",method = RequestMethod.DELETE)
    public Msg deleteEnp(@PathVariable("id") Integer id){
        enterpriseService.deleteById(id);
        return  Msg.success();
    }

    //批量删除
    @ResponseBody
    @RequestMapping(value = "/enps/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEnps(@PathVariable("ids") String ids){
        String []str=ids.split(",");
        List<Integer> list=new ArrayList<>();

        for (String id: str) {
            list.add(Integer.parseInt(id));
        }
        enterpriseService.delectAll(list);
        return Msg.success();
    }
}
