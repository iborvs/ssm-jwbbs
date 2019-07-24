<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: iborvs
  Date: 2019/7/16
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
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
            height: auto;
        }
    </style>
</head>
<body>
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
                                        <div id="preview"><img id="avatarPreview" class="avatar" src=""/></div>
                                    </div>
                                </form>
                                <form action="/user" method="POST" enctype="application/x-www-form-urlencoded" id="userinfo-form">
                                    <div class="row">
                                        <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2">
                                                <label for="nickname">昵称:</label>  <span id="nickname"></span>
                                        </div>
                                        <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2">
                                            <label for="qq">qq:</label>  <span id="qq"></span>
                                        </div>
                                        <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2">
                                            <label for="email">email:</label>  <span id="email"></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="user-info-panel">
                            <ul class="nav nav-list" id="hr_line"><li class="divider"></li></ul>
                            <h4>最近发帖:</h4>
                            <div class="div_item">
                                <div class="div_item2 panel panel-default">
                                    <div class="panel-heading">
                                        <span>回复:</span>
                                        <a src="#">关于猫红常年吃屎的事情</a>
                                        <div style="float: right">
                                            <span>回复于:</span>
                                            <span>2019-7-25</span>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        破事水
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    getInfo();
    function pageReload() {
        location.reload();
    }
    function getInfo(){
        $.get(
            '${pageContext.request.contextPath}/getuserinfo.action',
            'user='+GetQueryString("user"),
            function(response,status,xhr){
                if(response!=null){
                    if( true ){
                        response=response.replace(/[\r\n]/g,"");
                        response = response.replace(/\s*/g,"");
                        var json=$.parseJSON(response);
                        $("#nickname").html(json[0].nickname);
                        $("#qq").html(json[0].qq);
                        $("#email").html(json[0].email);
                        $("#avatarPreview").attr("src","../../avatar.views?user="+json[0].username+"&date=${date}");
                    }
                    else {
                        alert("获取数据失败，请检查网络");
                    }
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
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>
