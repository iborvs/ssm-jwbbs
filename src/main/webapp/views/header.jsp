<%--
  Created by IntelliJ IDEA.
  User: iborvs
  Date: 2019/7/10
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
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
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">BBS</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="profile.views" style="padding: 0;" data-toggle="tooltip" data-placement="bottom" title="个人中心"><img src="../../avatar.views?user=${cookie.login_user.value}
" class="avatar_box img-circle"></a>
                </li>
                <li><a href="#">发帖</a></li>
                <li><a href="login.views">登录</a></li>
                <li><a href="/register.views">注册</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>