<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <%--${APP_PATH}本身以/开头--%>
    <%  pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/jquery-3.3.1/jquery-3.3.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--增加数据——模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="add_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增企业</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_modal_form">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">公司名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="inputName" name="name" placeholder="请输入公司名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">联系方式</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="inputTime" name="time" placeholder="例如1999-2-9">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">公司地址</label>
                        <div class="col-sm-5">
                            <select class="form-control" placeholder="中国大陆" name="address">
                                <option>某地区</option>
                                <option>某地区</option>
                                <option>某地区</option>
                                <option>某地区</option>
                                <option>某地区</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">邮政编码</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="inputNumber" name="number" placeholder="报警次数">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="add_modal_save" type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<%--修改数据——模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="update_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_modal_form">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">ID</label>
                        <div class="col-sm-5">
                            <p  class="form-control-static"><strong id="updateID"></strong></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">公司名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="updateName" name="name" placeholder="请输入公司名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">联系方式</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="updateTime" name="time" placeholder="例如1999-2-9">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">公司地址</label>
                        <div class="col-sm-5">
                            <select class="form-control" placeholder="某地区" name="address" id="updateAddress">
                                <option>某地区</option>
                                <option>某地区</option>
                                <option>某地区</option>
                                <option>某地区</option>
                                <option>某地区</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">邮政编码</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="updateNumber" name="number" placeholder="报警次数">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="edit_modal_update" type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
<%--搭建显示页面--%>
<div class="container">
    <%--第一行--%>
    <br>
        <br>
    <div class="row">
        <div class="col-md-12">
            <h3>企业信息展示</h3>
            <hr>
        </div>
    </div>
    <%--第二行--%>
    <div class="row">
        <div class="col-md-3 col-md-offset-9">
            <button type="button" id="add_button" class="btn btn-primary btn-lg">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button type="button" id="delete_checked" class="btn btn-danger btn-lg" >
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
    <br>
    <%--第三行--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="table_enterprise">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#ID</th>
                    <th>公司名</th>
                    <th>联系方式</th>
                    <th>公司地址</th>
                    <th>邮政编码</th>
                    <th>相关操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--第四行--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6" id="page_info">

        </div>
        <%--===分页条===--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_nav">

                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    //全局变量
    //当前多少页
    var currentpage;
    //总共多少条记录
    var totals;
    //jQuery入口函数
    $(function(){
        to_page(1);
    });
    //根据页码发送ajax请求
    function to_page(pn) {
        //发送ajax请求，拿到服务器的响应数据
        $.ajax({
            url:"${APP_PATH}/enps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {

                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    //构建分页数据
    function build_emps_table(result) {
        //清空####页面局部刷新，所以需要清空
        $("#table_enterprise tbody").empty();
        //list是一个对象数组，里面的每一个对象就是一个伪数组
        var enps=result.extend.pageInfo.list;
        $.each(enps,function (index,item) {
            var checkTD=$("<td><input type='checkbox' class='check_item'/></td>");
            var idTD = $("<td></td>").append(item.id);
            var nameTD = $("<td></td>").append(item.name);
            var timeTD = $("<td></td>").append(item.time);
            var addressTD = $("<td></td>").append(item.address);
            var numberTD = $("<td></td>").append(item.number);
            //构建两个button按钮,将span标签放入button当中
            var button1 = $("<button></button>")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .addClass("btn btn-primary edit_btn")
                .append(" 修改");
            //为button按钮添加一个自定义属性，绑定所在行id值
            button1.attr("edit_id",item.id);
            var button2 = $("<button></button>")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .addClass("btn btn-danger delete_btn")
                .append(" 删除");
            button2.attr("delete_id",item.id);
            //将button按钮放入td中
            var buttonTD = $("<td></td>").append(button1).append(" ").append(button2);
            //将tr放入表中
            $("<tr></tr>").append(checkTD)
                .append(idTD)
                .append(nameTD)
                .append(timeTD)
                .append(addressTD)
                .append(numberTD)
                .append(buttonTD)
                .appendTo("#table_enterprise tbody");
        })
    }

    //构建分页信息
    function build_page_info(result){
        $("#page_info").empty();
        $("#page_info").append("当前是第"+result.extend.pageInfo.pageNum+
            "页，"+"总共"+result.extend.pageInfo.pages+"页，"+"总共"+result.extend.pageInfo.total+"条记录")
        currentpage=result.extend.pageInfo.pageNum;
        totals=result.extend.pageInfo.total;
    }

    //构建分页条
    function build_page_nav(result){
        $("#page_nav").empty();

        var firstPage = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
        firstPage.click(function(){
            to_page(1);
        })
        var prePage = $("<li></li>").append($("<a></a>").attr("href","#").append("&laquo;"));
        if(!result.extend.pageInfo.hasPreviousPage){
            prePage.addClass("disabled");
        }else{
            prePage.click(function (){
                to_page(currentpage-1);
            })
        }
        $("#page_nav").append(firstPage).append(prePage);
        var navi = result.extend.pageInfo.navigatepageNums;
        $.each(navi,function (index,item) {
            var li = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
            if(currentpage == item){
                li.addClass("active");
            }
            li.click(function () {
                to_page(item);
            })
            $("#page_nav").append(li);
        })
        var nextPage = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;"));
        if(!result.extend.pageInfo.hasNextPage){
            nextPage.addClass("disabled");
        }else{
            nextPage.click(function(){
                to_page(currentpage+1);
            })
        }
        var endPage = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
        endPage.click(function(){
            to_page(result.extend.pageInfo.pages);
        })
        $("#page_nav").append(nextPage).append(endPage);
    }

    //给新增按钮绑定点击事件
    $("#add_button").click(function () {
        $('#add_modal').modal({
            backdrop:true,
        });
    })



    //校验name
    $("#inputName").change(function () {
        //对name前端校验
        var enpName=$("#inputName").val();
        var regName=/^[\u2E80-\u9FFF]+$|^[a-z]\w{1,6}$/;
        if(!regName.test(enpName)){
            show_add_msg("#inputName","error","公司名必须为中文字符");
        }else{
            //前端验证通过，在else里面进行后端验证
            //对name作后端校验，不允许重复值
            $.ajax({
                url:"${APP_PATH}/enp",
                data:"name="+enpName,
                type:"GET",
                success:function (result) {
                    if(result.code==100){
                        show_add_msg("#inputName","success","");
                    }else{
                        show_add_msg("#inputName","error","公司名已存在，请重新输入");
                    }
                }
            })
        }

    })

    //除name以外表单校验
    function form_validator(){
        //校验时间
        var enpTime = $("#inputTime").val();
        var regTime= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
        //测试顺序不能写反
        if(regTime.test(enpTime)){
            show_add_msg("#inputTime","success","")
        }else{
            show_add_msg("#inputTime","error","时间格式不正确");
            return false;
        }
        //校验报警次数
        var enpNumber = $("#inputNumber").val();
        var regNumber = /^\d{1,3}$/;
        if(!regNumber.test(enpNumber)){
            show_add_msg("#inputNumber","error","报警次数必须为1-3位数字");
            return false;
        }else{
            show_add_msg("#inputNumber","success","");
        }
        return true;
    }
    //显示校验信息
    function show_add_msg(obj,status,msg){
        //移除状态
        $(obj).parent().removeClass("has-error has-success");
        $(obj).next("span").text("");
        if(status=="error"){
            $(obj).parent().addClass("has-error");
            $(obj).next("span").append(msg);
        }else if(status=="success"){
            $(obj).parent().addClass("has-success");
            $(obj).next("span").append(msg);
        }

    }

    //点击保存按钮，提交新增数据
    $("#add_modal_save").click(function () {
        //作除name以外的表单校验
        if(!form_validator()){
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/enps",
            data:$("#add_modal_form").serialize(),
            type:"POST",
            success:function (result) {
                //关闭模态框
                $('#add_modal').modal('hide');
                //跳转到最后一页
                to_page(totals);
            }
        })
    })



    /*
    给后来元素添加绑定事件，必须以此格式
    否则绑定不上
    */
    //修改按钮
    var currentID;
    $(document).on("click",".edit_btn",function () {
        //显示模态框
        $("#update_modal").modal({backdrop:false});
        currentID=$(this).attr("edit_id");
        $.ajax({
            url:"${APP_PATH}/enp/"+currentID,
            type:"GET",
            success:function (result) {
                console.log(result);
                //成功获得数据
                $("#updateID").text(result.extend.enterprise.id);
                $("#updateName").val(result.extend.enterprise.name);
                $("#updateTime").val(result.extend.enterprise.time);
                $("#updateAddress").val(result.extend.enterprise.address);
                $("#updateNumber").val(result.extend.enterprise.number);
            }

        })

    })

    //修改提交后的数据
    $("#edit_modal_update").click(function () {
        $.ajax({
            url:"${APP_PATH}/enp/"+currentID,
            data:$("#update_modal_form").serialize(),
            type:"PUT",
            success:function (result) {
                //提交成功
                //1.关闭模态框
                $("#update_modal").modal('hide');
                //2.跳到之前操作的页面
                to_page(currentpage);
            }
        })
    })

    //单个删除
    $(document).on("click",".delete_btn",function (){
        var deleteID = $(this).attr("delete_id");
        var deleteName=$(this).parents("tr").find("td:eq(2)").text();
        //提示用户是否确认删除
        if(confirm("您确认删除【"+deleteName+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/enp/"+deleteID,
                type:"DELETE",
                success:function (result) {
                    //跳转到之前操作的页面
                    to_page(currentpage);
                    alert("删除成功");
                }
            })
        }

    })

    //1.完成第一行按钮的全选/全不选功能
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    //批量删除
    $("#delete_checked").click(function () {
        var idstr="";
        $.each($(".check_item:checked"),function () {
            idstr += $(this).parents("tr").find("td:eq(1)").text()+",";
        })
        //去除最后一个逗号
        idstr=idstr.substring(0,idstr.length-1);
        if(idstr == ""){
            alert("您还没有选中要删除的记录！！！");
        }else{
            if(confirm("你想删除所选中的记录吗？")){
                $.ajax({
                    url:"${APP_PATH}/enps/"+idstr,
                    type:"DELETE",
                    success:function (result) {
                        to_page(currentpage);
                        alert("删除成功");
                    }
                })
            }
        }

    })

</script>
</body>
</html>
