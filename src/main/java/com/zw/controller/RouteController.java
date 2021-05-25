package com.zw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class RouteController {

    @RequestMapping("/reg")
    public String route1(){
        return "registered";
    }
    @RequestMapping("/list")
    public String route2(){
        return "list";
    }
    @RequestMapping("/query")
    public String route3(){
        return "query";
    }
    @RequestMapping("/index")
    public String route4(){
        return "index";
    }
    @RequestMapping("/2018")
    public String route5(){
        return "2018";
    }
    @RequestMapping("/2019")
    public String route6(){
        return "2019";
    }

    }

