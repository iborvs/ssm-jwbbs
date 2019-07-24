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
</head>
<body>
三秒后自动跳转到首页
</body>
<script>
    redirect();
    function redirect(){
        setTimeout(function(){window.location.href="../"},3000);
    }
</script>
</html>
