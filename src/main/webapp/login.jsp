<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>首页</title>

    <%  pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/jquery-3.3.1/jquery-3.3.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap1.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <br>
    <br>
    <br>
    <div class="row col-md-offset-3">
        <h3>欢迎来到登录界面</h3>
    </div>
    <hr>
    <br>
    <br>
    <form class="form-horizontal" id="loginForm">
        <div class="form-group col-md-offset-3">
            <label class="col-sm-5 control-label">用户名</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="inputName" placeholder="请输入用户名">
                <span id="validatorName" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">密码</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码">
                <span id="validatorpassword" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">验证码</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="inputCode" placeholder="输入验证码">
                <span id="validatorcode" class="help-block"></span>
            </div>
            <img src="checkCode" alt="" width="100" height="22" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-5">
                <a href="/reg"><button id="reg" type="button" class="btn btn-danger btn-lg">尚无账号</button></a>
                <button type="button" id="loginButton" class="btn btn btn-primary btn-lg">立即登陆</button>
            </div>
        </div>
    </form>
</div>
<script>
    $(function () {
        //重置表单
        $("#loginForm")[0].reset();
        $("#loginButton").bind("click",login);

    })
    //校验验证码
    $("#inputCode").change(function () {
        $.ajax({
            url:"${APP_PATH}/cdes",
            data:"codes="+$("#inputCode").val(),
            type:"GET",
            success:function (result) {
                if(result.code==100){
                     show_msg("#inputCode","success","验证码正确");
                    //为登陆按钮恢复点击事件
                    $("#loginButton").bind("click",login);
                    //验证正确之后，立马调用
                    login();

                }else{
                    show_msg("#inputCode","error","验证码错误");
                    //为登陆按钮移除点击事件
                    $("#loginButton").unbind("click");
                }
            }
        })
    })


    //提交之前先校验name是否存在
    $("#inputName").change(function () {
        //前端校验
        var inputName = $("#inputName").val();
        var regName = /^[\u2E80-\u9FFF]+$|^[a-z]\w{1,10}$/;
        if(!regName.test(inputName)){
            show_msg("#inputName","error","id格式不正确");
            //为登陆按钮移除点击事件
            $("#loginButton").unbind("click");
        }else{
            //后端校验用户名是否存在
            $.ajax({
                url:"${APP_PATH}/regname",
                data:"name="+$("#inputName").val(),
                type:"GET",
                success:function (result) {

                    if(result.code==100){
                        show_msg("#inputName","success","正确输入");
                        //为登陆按钮恢复点击事件
                        $("#loginButton").bind("click",login);
                    }else {
                        show_msg("#inputName","error","后端检测:账户不存在");
                        //为登陆按钮移除点击事件
                        $("#loginButton").unbind("click");
                    }

                }
            })
        }

    })
    //提交登录请求之后，查询密码是否正确
    function login() {
        if($("#inputCode").val()==""||$("#inputName").val()==""||$("#inputPassword").val()==""){
           alert("请输入全部内容");
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/login",
            data:"name="+$("#inputName").val()+"&password="+$("#inputPassword").val(),
            type:"POST",
            success:function (result) {
                //成功,跳转到index页面
                if(result.code==100){
                    alert("登录成功，即将进入系统！");
                    window.location.href="${APP_PATH}/index";
                }else{
                    //密码错误==>提示其修改
                    show_msg("#inputPassword","error","密码不正确");
                }

            }
        })
    }


    //显示校验信息
    function show_msg(obj,status,msg) {
        //清空
        $(obj).parent().removeClass("has-success has-error");
        $(obj).next("span").text("");
        if(status=="success"){
            $(obj).parent().addClass("has-success");
            $(obj).next("span").text(msg);
        }else if(status=="error"){
            $(obj).parent().addClass("has-error");
            $(obj).next("span").text(msg);
        }
    }
</script>
</body>
</html>

