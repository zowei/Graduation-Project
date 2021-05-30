<%--
  Created by IntelliJ IDEA.
  User: zouwei
  Date: 2019/4/30
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查询页面</title>

    <%  pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/jquery-3.3.1/jquery-3.3.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <h3>请输入查询条件</h3>
        <hr>
    </div>
    <br>
    <div class="row">
        <form class="form-inline">
            <div class="form-group">
                <label>公司名</label>
                <input type="text" class="form-control" id="inputName" naem="name" placeholder="例如:百度">
            </div>
            <div class="form-group">
                <label>公司地址</label>
                <select class="form-control" name="address" id="inputAddress">
                    <option>某地区</option>
                    <option>某地区</option>
                    <option>某地区</option>
                    <option>某地区</option>
                    <option>某地区</option>
                </select>
            </div>
            <div class="form-group">
                <label>邮政编码</label>
                <input type="text" class="form-control" id="inputNumber" name="number" placeholder="请输入报警次数">
            </div>
            <div class="form-group col-md-offset-1">
                <button type="button" id="query_button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span>立即查询
                </button>
                <button type="reset" id="reset_button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-repeat"></span>重置
                </button>
            </div>
        </form>

    </div>
    <br>
    <br>
    <%--第三行--%>
    <div class="row">
        <div class="col-md-9">
            <table class="table table-striped table-bordered" id="table_query">
                <thead>
                </thead>
                <tbody>
                </tbody>
            </table>
    </div>

</div>
    <%--第四行--%>
    <div class="row">
        <div class="col-md-5" id="page_info">
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_nav">

                </ul>
            </nav>
        </div>


    </div>
    <script>
        //定义全局参数
        var name;
        var address;
        var number;

        $(function () {

        })
        $("#query_button").click(function () {
            name=$("#inputName").val();
            address=$("#inputAddress").val();
            number=$("#inputNumber").val();
            to_page(1);
        })
        function to_page(pn){
            $.ajax({
                url:"${APP_PATH}/qur",
                data:"pn="+pn+"&name="+name+"&address="+address+"&number="+number,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    //每次分页查询之后先清空页面数据在重新显示数据
                    $("#table_query thead").empty();
                    $("#table_query tbody").empty();
                    $("#page_info").empty();
                    $("#page_nav").empty();
                    //构建thead表头
                    build_table_head();
                    //构建表格tbody
                    build_table_tbody(result);
                    //构建分页信息
                    build_page_info(result);
                    //构建分页条
                    build_page_nav(result);
                }
            })
        }

        //构建表头
        function build_table_head() {
            var idTD = $("<td></td>").append("#ID");
            var nameTD = $("<td></td>").append("公司名");
            var timeTD = $("<td></td>").append("联系方式");
            var addressTD = $("<td></td>").append("公司地址");
            var numberTD = $("<td></td>").append("邮政编码");
            $("<tr></tr>")
                .append(idTD)
                .append(nameTD)
                .append(timeTD)
                .append(addressTD)
                .append(numberTD)
                .appendTo($("#table_query thead"));
        }
        //构建表tbody
        function build_table_tbody(result) {
            $.each(result.extend.pageInfo.list,function (index,item) {
                var idTD = $("<td></td>").append(item.id);
                var nameTD = $("<td></td>").append(item.name);
                var timeTD = $("<td></td>").append(item.time);
                var addressTD = $("<td></td>").append(item.address);
                var numberTD = $("<td></td>").append(item.number);
                $("<tr></tr>")
                    .append(idTD)
                    .append(nameTD)
                    .append(timeTD)
                    .append(addressTD)
                    .append(numberTD)
                    .appendTo($("#table_query tbody"));
            })
        }
        //构建分页信息
        function build_page_info(result) {
            $("#page_info").append("当前第"+result.extend.pageInfo.pageNum+"页,"
            +"总共"+result.extend.pageInfo.pages+"页,"
            +"总共"+result.extend.pageInfo.total+"条记录");

        }
        //构建分页条
        function build_page_nav(result) {
            var firstLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            firstLi.click(function(){
                to_page(1);
            })
            var preLi = $("<li></li>").append($("<a></a>").attr("href","#").append("&laquo;"));
            if(!result.extend.pageInfo.hasPreviousPage){
                preLi.addClass("disabled");
            }else{
                preLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum-1);
                })
            }
            $("#page_nav").append(firstLi).append(preLi);
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var Li = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
                $("#page_nav").append(Li);
                if(item==result.extend.pageInfo.pageNum){
                    Li.addClass("active");
                }
                Li.click(function(){
                    to_page(item);
                })
            })
            var nextLi = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;"));
            var endLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
            $("#page_nav").append(nextLi).append(endLi);
            endLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            })
            if(!result.extend.pageInfo.hasNextPage){
                nextLi.addClass("disabled");
            }else{
                nextLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum+1);
                })
            }

        }

    </script>
</body>
</html>
