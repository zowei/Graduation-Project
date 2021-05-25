package com.zw.controller;



import com.zw.bean.Account;
import com.zw.bean.Msg;
import com.zw.service.AccountService;
import com.zw.util.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
public class AccountController {

    @Autowired
    AccountService accountService;


    //注册提交按钮
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    @ResponseBody
    public Msg regAccount(@RequestParam("name")String name,@RequestParam("password")String password){
        accountService.insertAccount(name,password);
        return Msg.success();
    }

    //校验用户名是否存在
    @ResponseBody
    @RequestMapping(value = "/regname",method = RequestMethod.GET)
    public Msg checkName(@RequestParam("name") String name){

        System.out.println(name);
        if(accountService.checkName(name)){
            return Msg.fail();
        }else {
            return Msg.success();
        }
    }


    ///11111111111111111111111
//    //校验密码是否正确
//    @ResponseBody
//    @RequestMapping(value = "/login",method = RequestMethod.POST)
//    public Msg login(String name,String password) {
//        String querypsd=accountService.selectByName(name).getPassword();
//        if(querypsd.equals(password)){
//            return Msg.success();
//        }else{
//            return Msg.fail();
//        }
//    }
    ///222222222222222222222222222222222222222
    //校验密码是否正确+2.将当前用户名和密码放入session当中
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Msg login(String name,String password,HttpServletRequest request) {
        HttpSession session=request.getSession();
        session.setAttribute("name",name);
        String querypsd=accountService.selectByName(name).getPassword();
        if(querypsd.equals(password)){
            session.setAttribute("password",querypsd);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }



    //获取生成验证码显示,给前台img标签输送验证码
    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //拿到session中的生成的验证码字符串是否与用户输入的一致
    @RequestMapping(value = "/cdes",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCode(@RequestParam("codes") String codes,HttpServletRequest request, HttpServletResponse response){

        HttpSession session=request.getSession();

        //输出验证码code
        System.out.println(session.getAttribute("randomcode_key").toString());

        String codeSession=session.getAttribute("randomcode_key").toString();
        if(codes.equalsIgnoreCase(codeSession)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    //保存用户修改的密码，同时刷新session里面保存的密码
    @RequestMapping(value = "/save",method = RequestMethod.GET)
    @ResponseBody
    public Msg savePassword(@RequestParam("name")String name,@RequestParam("password")String password,HttpServletRequest request){
        accountService.savePassword(name,password);
        //刷新session里面的密码
        System.out.println(request.getSession().getAttribute("password"));
        request.getSession().setAttribute("password",password);
        System.out.println(request.getSession().getAttribute("password"));

        return Msg.success();
    }
}
