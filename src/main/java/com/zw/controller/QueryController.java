package com.zw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zw.bean.Enterprise;
import com.zw.bean.Msg;
import com.zw.service.EnterpriseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class QueryController {

    @Autowired
    EnterpriseService enterpriseService;
    /*
     * 1.mybatis传递多个参数进行xml映射查询
     * 2.多个参数必须用@Param注解进行标注，否则不能识别
     * */


    @ResponseBody
    @RequestMapping(value = "/qur",method = RequestMethod.GET)
    public Msg queryEnp(@RequestParam("pn") Integer pn,@RequestParam("name") String name, @RequestParam("address")String address, @RequestParam("number")Integer number){


        PageHelper.startPage(pn,6);
        List<Enterprise> list=enterpriseService.getByExample(name,address,number);
        PageInfo page=new PageInfo(list,5);
        return Msg.success().add("pageInfo",page);
    }




}
