<%--
  Created by IntelliJ IDEA.
  User: iborvs
  Date: 2019/7/10
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .navbar-fixed-top{
            position: sticky;
            margin-bottom: 1%;
        }
        .avatar_box{
            width: 43px;
            height: 43px;
        }
    </style>
</head>
<body>
<% long date = new Date().getTime(); request.setAttribute("date", date); %>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">BBS</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="profile.views" style="padding: 0;" data-toggle="tooltip" data-placement="bottom" title="个人中心"><img src="../../avatar.views?${date}" class="avatar_box img-circle"></a>
                </li>
                <li id="topic_li"><a href="/newTopic.views">发帖</a></li>
                <li id="login_li"><a href="/login.views">登录</a></li>
                <li id="logout_li"><a id="logout_a" href="">登出</a></li>
                <li id="register_li"><a href="/register.views">注册</a></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<script>
    $.get("${pageContext.request.contextPath}/login.if",function (data) {
        var test = /success/.test(data);
        if(test == true){
            $("#topic_li").removeClass("hidden");
            $("#login_li").addClass("hidden");
            $("#logout_li").removeClass("hidden");
            $("#register_li").addClass("hidden");
        }else{
            $("#topic_li").addClass("hidden");
            $("#login_li").removeClass("hidden");
            $("#logout_li").addClass("hidden");
            $("#register_li").removeClass("hidden");
        }
    });
    document.getElementById("logout_li").onclick = function() {
        $.get("${pageContext.request.contextPath}/logout.action",function (data) {
            alert("登出账号成功！");
        });
    }
</script>
</body>
</html>