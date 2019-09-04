<%--
  Created by IntelliJ IDEA.
  User: iborvs
  Date: 2019/7/10
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>不合法请求</title>
    <script src="../resources/js/jquery-2.1.4.min.js"></script>
    <link href="../resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="mx-auto" style="color: white;margin-top: 100px;">
    <h1>
        <p id="error_info"></p>三秒后自动跳转到首页
    </h1>
</div>
</body>
<script>
    var errorType = GetQueryString("error");
    var errorInfo = "错误：";
    switch (errorType) {
        case "0":
            errorInfo += "用户未登录";
            break;
        case "1":
            errorInfo += "权限不足";
            break;
        case "2":
            errorInfo += "被封禁";
            break;
    }
    $("#error_info").html(errorInfo);
    redirect();
    function GetQueryString(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    function redirect(){
        setTimeout(function(){window.location.href="../"},3000);
    }
</script>
</html>
