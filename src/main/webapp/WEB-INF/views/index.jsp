<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <style>
        #image{
            width: 1000px;
        }
    </style>
    <%  pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/jquery-3.3.1/jquery-3.3.1.js"></script>
    <%--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap1.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 展示基本资料模态框 -->
<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">当前用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <fieldset disabled>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Name</label>
                            <div class="col-sm-4">
                                <input type="text" id="name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Password</label>
                            <div class="col-sm-4">
                                <input type="text" id="password" class="form-control">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<%-- 修改密码模态框 --%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_form">
                    <fieldset disabled>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Name</label>
                            <div class="col-sm-4">
                                <input type="text" id="updateName" class="form-control">
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Password</label>
                        <div class="col-sm-4">
                            <input type="text" id="updatePassword" class="form-control">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="update_button" type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

<br>
<br>
<div class="container">
    <!--第一行-->
    <div class="row">
        <div class="col-md-5">
            <h1>欢迎来到污染源监控系统</h1>
            <hr>
        </div>
    </div>

    <!--第二行-->
    <div class="row col-md-11">
        <%--导航条--%>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Brand</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="http://localhost:8086/index">首页 </a></li>
                        <li><a href="/list">企业信息 </a></li>
                        <li><a href="/query">数据查询 </a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">数据报表 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/2018">2018年</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/2019">2019年</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">更多时间</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" id="searchInput" class="form-control" placeholder="Search">
                        </div>
                        <button type="button" id="searchButton" class="btn btn-default">Submit</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#" id="base_info">基本资料</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#" id="edit_psd">修改密码</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于我们 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="https://blog.csdn.net/Z_zfer">项目博客</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="https://github.com/zowei/Graduation-Project.git">项目地址</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <%--第三行图片--%>
    <div class="row col-md-11">
        <img id="image" src="${APP_PATH}/static/image/index.jpeg">
    </div>
    <br>
    <br>
    <br>
</div>
<script type="text/javascript">
    //从session中拿到当前用户的信息
    var name='<%=session.getAttribute("name")%>';
    var password='<%=session.getAttribute("password")%>';
    //点击之后显示模态框和当前用户信息
    $("#base_info").click(function () {
        $("#edit_modal").modal({backdrop:false});
        //将值取出来显示给用户
        $("#name").val(name);
        $("#password").val(password);
    })

    //点击按钮之后显示修改密码模态框
    $("#edit_psd").click(function () {
        $("#update_modal").modal({backdrop:false});
        $("#updateName").val(name);
        $("#updatePassword").val(password);
    })
    //点击保存按钮==修改密码
    $("#update_button").click(function () {
        if($("#updatePassword").val()==""){
            alert("请输入密码！");
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/save",
            data:"name="+name+"&password="+$("#updatePassword").val(),
            type:"GET",
            success:function (result) {
                alert("保存成功");
                $("#update_modal").modal('hide');
                if(confirm("是否要重新登陆?")){
                    window.location.href="http://localhost:8086/";
                }
            }
        })
    })
    $("#searchButton").click(function () {
        window.location.href="http://www.baidu.com/s?wd="+$("#searchInput").val()+"&cl=3";
    })
</script>

</body>
</html>