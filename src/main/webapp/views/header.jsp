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
                <li><a href="/newTopic.views">发帖</a></li>
                <li><a href="/login.views">登录</a></li>
                <li><a href="/register.views">注册</a></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>