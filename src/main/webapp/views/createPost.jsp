<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/7/26
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发表帖子</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <script src="../resources/js/jquery-2.1.4.min.js"></script>
    <script src="../resources/js/bootstrap.js"></script>
    <script src="../resources/js/gVerify.js"></script>
    <style>
        body{
            background-image: url("../assets/back1.jpg");
            background-size: cover;
        }
        .reply{
            border:1px solid black;
            border-radius: 4px;
            padding: 1% 1% 1% 1%;
            margin-top: 9%;
            margin-bottom: 1%;
            background-color: white;
            opacity: 0.96;
        }
        #v_container{
            width: 100px;
            height: 40px;
        }
        #my_button{
            margin-top: 1%;
        }
    </style>
    <script>
        function create_topic() {
            var topicname = document.getElementById("InputTopic").value;
            var owner = "${cookie.login_user.value}";//不再需要
            var content = document.getElementById("InputContent").value;
            if(topicname == ""){
                alert("标题不能为空！");
            }else if(content == ""){
                alert("内容不能为空！");
            }else{
                $.post("${pageContext.request.contextPath}/TopicCreate.action", {topicname:topicname,owner:owner,content:content}, function (response) {
                    if(response.indexOf("封禁")==-1){
                        alert("发表成功！");
                        window.location.href = "/";
                    }
                    else
                        alert("您已被封禁！");
                });
            }
        }
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
    <div class="reply">
        <form>
            <div>
                <h4><span class="glyphicon glyphicon-pencil"></span>发表帖子</h4>
            </div>
            <div class="form-group">
                <label for="InputTopic">标题</label>
                <input type="text" class="form-control" id="InputTopic" name="topicname" placeholder="帖子题目">
            </div>
            <div class="form-group">
                <label for="InputContent">内容</label>
                <textarea class="form-control" rows="9" style="resize: none;" placeholder="发表一下你的看法" id="InputContent" name="content"></textarea>
            </div>
            <div>
                <div id="v_container"></div>
                <input type="text" id="code_input" value="" placeholder="请输入验证码"/>
            </div>
            <div>
                <button type="button" class="btn btn-default" id="my_button"><span class="glyphicon glyphicon-upload"></span>&nbsp;&nbsp;发表</button>
            </div>
            <script>
                var verifyCode = new GVerify("v_container");
                document.getElementById("my_button").onclick = function(){
                    var res = verifyCode.validate(document.getElementById("code_input").value);
                    if(res){
                        create_topic();
                    }else{
                        alert("验证码错误！");
                    }
                };
            </script>
        </form>
    </div>
</div>
</body>
</html>
