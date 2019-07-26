<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: iborvs
  Date: 2019/7/16
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <script src="../../resources/js/jquery-2.1.4.min.js"></script>
    <script src="../../resources/js/popper.min.js"></script>
    <script src="../../resources/js/jquery.slides.min.js"></script>
    <script src="../../resources/js/main.js"></script>
    <script src="../../resources/js/cropper.min.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/jquery.form.min.js"></script>
    <script src="../../resources/js/avatar.js"></script>
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../../resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="../../resources/css/cropper.min.css" rel="stylesheet" type="text/css">
    <title>用户信息</title>
    <style>
        #avatarPreview{
            border-radius:50%;
            width: 200px;
            height: 200px;
        }
        #hr_line{
            height: 10px;
        }
        a.del:link{color:red !important;}
        a.del{color:red !important;}
        a.del:visited{color:red !important;}
    </style>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="container">
    <div class="panel panel-default user-info-panel">
        <div class="panel-body">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="mx-auto user-info ">
                            <div id="profile">
                                <% long date = new Date().getTime(); request.setAttribute("date", date); %>
                                <form method="POST" enctype="multipart/form-data" id="uploadFrm">
                                    <div class="mx-auto">
                                        <div id="preview"><img id="avatarPreview" class="avatar" src="../../assets/mmm.png"/></div>
                                    </div>
                                </form>
                                <form action="/user" method="POST" enctype="application/x-www-form-urlencoded" id="userinfo-form">
                                    <div class="row">
                                        <div class="col-lg-8 col-lg-offset-3 col-md-8 col-md-offset-3 col-sm-8 col-sm-offset-3">
                                                <label for="nickname">昵称:</label>  <span id="nickname"></span>
                                        </div>
                                        <div class="col-lg-8 col-lg-offset-3 col-md-8 col-md-offset-3 col-sm-8 col-sm-offset-3">
                                            <label for="qq">qq:</label>  <span id="qq"></span>
                                        </div>
                                        <div class="col-lg-8 col-lg-offset-3 col-md-8 col-md-offset-3 col-sm-8 col-sm-offset-3">
                                            <label for="email">email:</label>  <span id="email"></span>
                                        </div>
                                        <div class="col-lg-8 col-lg-offset-3 col-md-8 col-md-offset-3 col-sm-8 col-sm-offset-3">
                                            <label for="privileges">用户状态:</label>  <span id="privileges"></span>
                                        </div>
                                        <div class="mx-auto" id="editInfoArea" style="display: none">
                                            <a class="btn btn-success" name="submit" type="button" href="/userInfo.views">修改信息 </a>
                                            <a class="btn btn-info" name="submit" type="button" href="/userInfo.views">发布新帖 </a>
                                        </div>
                                        <div class="mx-auto" id="banArea" style="display: none">
                                            <a class="btn btn-danger" id="ban-btn" type="button" onclick="banUser()" >禁止用户 </a>
                                            <a class="btn btn-warning" id="release-btn"  type="button" onclick="releaseUser()">解除禁止 </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div style="display: none"><label for="nickname">昵称:</label>  <span id="userid"></span></div>
                        <div class="row">
                            <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                                <hr>
                            </div>
                        </div>
                        <div class="user-info-panel">
                            <h4>最近发帖:</h4>
                            <div id = "comments_box">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        getInfo();
        getUserComments();
        $.get(
            "/admin.if",
            function (response) {
                var json=$.parseJSON(response);
                if(json[0].status.indexOf("success")!=-1){
                    if(GetQueryString("user")!=null)
                        $("#banArea").show();
                }
            }
        );
    });
    function banUser() {
        $.get(
            "/banUser.action",
            "user="+GetQueryString("user"),
            function (response) {
                var json=$.parseJSON(response);
                if(json[0].status.indexOf("success")!=-1){
                    alert("禁止成功!");
                    pageReload();
                }
            }
        );
    }
    function releaseUser() {
        $.get(
            "/releaseUser.action",
            "user="+GetQueryString("user"),
            function (response) {
                var json=$.parseJSON(response);
                if(json[0].status.indexOf("success")!=-1){
                    alert("解除成功!");
                    pageReload();
                }
            }
        );
    }
    function pageReload() {
        location.reload();
    }
    function confirmDel(para){
        if(window.confirm('确定要删除此条回复么？')){
           var url = "/CommDelete.action";
            $.get(
                url,
                'commentid='+para,
                function (response,status) {
                    if(response!=null){
                        if(status="success")
                            alert("删除成功！");
                    }
                    else{
                        alert("网络异常");
                    }

                }
            );
        }
    }
    function getUserComments(){
        var user="";
        var url="";
        if(GetQueryString("user")!=null)
            user = GetQueryString("user");
        var self = "0";
        if(user!="")
            url = 'user='+user;
        else
            url = "";
        $.get(
            '/legal.if',
            url,
            function (response) {
                if(response!=null){
                    var json=$.parseJSON(response);
                    if(json[0].status.indexOf("success")!=-1){
                        self = "1";
                    }
                }
            }
        );
        if(user!="")
            url = 'owner='+user;
        else
            url = "";
        $.get(
            '${pageContext.request.contextPath}/GetTenComm.action',
            url,
            function(response,status,xhr){
                if(response!=null){
                    if( status == "success" ){
                        response=response.replace(/[\r\n]/g,"");
                        //response = response.replace(/\s*/g,"");
                        var json=$.parseJSON(response);
                        for (var i = 0; i < json.length; i++) {
                            var comments = "<div class=\"div_item\">" +
                                "                                <div class=\"div_item2 panel panel-default\">" +
                                "                                    <div class=\"panel-heading\">" +
                                "                                        <span>回复:</span>" +
                                "                                        <a src=\""+  json[i].topicid +"\">"+json[i].topicname+"</a>" +
                                "                                        <div style=\"float: right\">" +
                                "                                            <span>回复于:</span>" +
                                "                                            <span>"+ json[i].lasttime +"</span>" +
                                    "                                        <a class='del' style='display: none' onclick=\"confirmDel(\'"+ json[i].commentid +"\')\">删除</a>"+
                                "                                        </div>" +
                                "                                    </div>" +
                                "                                    <div class=\"panel-body\">" +
                                json[i].content +
                                "                                    </div>" +
                                "                                </div>" +
                                "                            </div>";
                            $("#comments_box").append(comments);
                        }
                    }
                    else {
                        alert("获取数据失败，请检查网络");
                    }
                }
                if(self=="1"){
                    $(".del").show();
                }
            }
        );
    }
    function GetQueryString(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    function getInfo() {
        var user="";
        var url="";
        if(GetQueryString("user")!=null)
            user = GetQueryString("user");
        if(user!="")
            url = "user="+user;
        else
            url = "";
        $.get(
            '${pageContext.request.contextPath}/getuserinfo.action',
            url,
            function(response,status,xhr){
                if(response!=null){
                    if( true ){
                        response = response.replace(/[\r\n]/g,"");
                        response = response.replace(/\s*/g,"");
                        var json=$.parseJSON(response);
                        $("#nickname").html(json[0].nickname);
                        $("#qq").html(json[0].qq);
                        $("#email").html(json[0].email);
                        $("#avatarPreview").attr("src","../../avatar.views?user="+json[0].username+"&date=${date}");
                        switch (json[0].privileges) {
                            case "0":
                                $("#privileges").html("正常");break;
                            case "1":
                                $("#privileges").html("管理员");break;
                            case "-1":
                                $("#privileges").html("已封禁");break;
                        }
                        if(json[0].self=="1"){
                            $("#editInfoArea").show();
                        }
                    }
                    else {
                        alert("获取数据失败，请检查网络");
                    }
                }
            }
        );
    }
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>
