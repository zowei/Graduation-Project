<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>registered</title>

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
        <h3>欢迎来到注册界面</h3>
    </div>
    <hr>
    <br>
    <form class="form-horizontal" id="reg_form">
        <div class="form-group col-lg-offset-3">
            <label class="col-sm-5 control-label">用户名</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="inputname" naem="name" placeholder="请输入用户名">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">密码</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" naem="password" id="inputpassword" placeholder="请输入密码">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-6">
                <button type="reset" class="btn btn-danger btn-lg">取消</button>
                <button id="regButton" type="button" class="btn btn btn-primary btn-lg">立即注册</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        //重置表单
        $("#reg_form")[0].reset();
    })
    //校验name
    $("#inputname").change(function () {
            //作后端校验
            //后端校验用户名是否存在
            $.ajax({
                url:"${APP_PATH}/regname",
                data:"name="+$("#inputname").val(),
                type:"GET",
                success:function (result) {
                    if(result.code==100){
                        show_msg("#inputname","error","后端检测:账户已存在");
                        //移除点击事件
                        $("#regButton").unbind("click");
                    }else {
                        show_msg("#inputname","success","");
                        //绑定点击事件
                        $("#regButton").bind("click",registered);
                    }
                }
            })
    })


    //提交注册按钮
   function registered() {
        if($("#inputpassword").val()==""){
            show_msg("#inputpassword","error","请输入密码");
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/register",
            data:"name="+$("#inputname").val()+"&password="+$("#inputpassword").val(),
            type:"GET",
            success:function (result) {
                alert("注册成功");
                if(confirm("您要回到登陆页面吗？")){
                    window.location.href="http://localhost:8086/";
                }else{
                    //重置表单
                    $("#reg_form")[0].reset();
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

