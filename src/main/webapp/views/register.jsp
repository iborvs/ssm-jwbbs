<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>register</title>
    <meta name="viewport" http-equiv="content-type" content="width=device-width;initial-scale=1;charset=UTF-8">
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <script src="../resources/js/jquery-2.1.4.min.js"></script>
    <script src="../resources/js/bootstrap.js"></script>
    <style>
        #img{
            width: 100%;
        }
        .col0{
            position: relative;
            max-width: 66.6667%;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
        }
        .col1{
            padding-left: 0;
            padding-right: 0;
        }
        .container-fluid{
            padding-left: 0;
            padding-right: 0;
        }
        .css-rcz4v8{
            box-sizing: border-box;
            flex-basis: 0px;
            -webkit-box-flex: 1;
            flex-grow: 1;
            max-width: 100%;
            padding-left: 8px;
            padding-right: 8px;
        }
        .css-b46a1g {
            margin-top: 24px;
            margin-left: 16px;
            width: 160px;
            height: 40px;
        }
        .css-k58if {
            box-sizing: border-box;
            -webkit-box-flex: 1;
            flex-grow: 1;
            flex-wrap: wrap;
            display: flex;
            margin-left: -8px;
            margin-right: -8px;
            height: 30%;
            min-height: 30px;
            padding-top: 5%;
            padding-bottom: 5%;
        }
        .div_box{
            height: 100%;
        }
        .btn-lg{
            padding: 0px;
            font-size: 14px;
            line-height: 1.2;
        }
        .footer {
            font-size: 14px;
            color: #bbb;
            text-align: center;
            padding: 20% 0 2%;
            font-weight: lighter;
        }
        .form-control{
            font-size: 15px;
        }
        .col12{
            width: 100%;
        }
    </style>
    <script>
        window.onresize = function(){
            var img = document.getElementById("img");
            var box = document.getElementsByClassName("div_box");
            if(box.item(0).clientHeight <= window.innerHeight){
                img.height = window.innerHeight;
            }
            else{
                img.height = box.item(0).clientHeight;
            }
        }
        window.onload = function () {
            var img = document.getElementById("img");
            var box = document.getElementsByClassName("div_box");
            // document.write(box.item(0).clientHeight+","+window.innerHeight);
            if(box.item(0).clientHeight <= window.innerHeight){
                img.height = window.innerHeight;
            }
            else{
                img.height = box.item(0).clientHeight;
            }
        }
        var access = function () {
            document.getElementById("if_access").checked = true;
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="col-md-6 div_box">
        <!--            <div class="css-rcz4v8">-->
        <!--                <img src="https://console.scaleway.com/42827ed243ccf76c82d512be13dc8057.svg" class="css-b46a1g">-->
        <!--            </div>-->
        <div class="css-k58if visible-md-block visible-lg-block">

        </div>
        <div class="center-block col0">
            <form method="post" action="${pageContext.request.contextPath}/register.action">
                <div>
                    <h1>创建你的论坛账号</h1>
                    <p>欢迎加入我们！</p>
                </div>
                <div class="form-group">
                    <label for="InputEmail"><span class="glyphicon glyphicon-envelope"></span> 电子邮箱</label>
                    <input type="email" class="form-control" id="InputEmail" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="InputUsername"><span class="glyphicon glyphicon-user"></span> 用户名</label>
                    <input type="text" class="form-control" id="InputUsername" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="InputNickname"><span class="glyphicon glyphicon-gift"></span> 昵称</label>
                    <input type="text" class="form-control" id="InputNickname" name="nickname" placeholder="Nickname">
                </div>
                <div class="form-group">
                    <label for="InputPassword"><span class="glyphicon glyphicon-lock"></span> 密码</label>
                    <input type="password" class="form-control" id="InputPassword" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="InputQQ"><span class="glyphicon glyphicon-comment"></span> QQ</label>
                    <input type="text" class="form-control" id="InputQQ" name="qq" placeholder="QQ">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="if_access" name="InputCheckbox">我已阅读并同意相关服务条款和隐私政策
                    </label>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        条款&政策
                    </button>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <p class="modal-title" id="myModalLabel">条款政策</p>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="access()">同意</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-default col-md-12 col12"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;立即注册</button>
            </form>
        </div>
        <!--            <div>-->
        <!--                <div class="footer">-->
        <!--                    Copyright-->
        <!--                    <span>©</span>-->
        <!--                    <script>-->
        <!--                        document.write((new Date).getFullYear())-->
        <!--                    </script>-->
        <!--                    Dreamlands All Rights Reserved-->
        <!--                </div>-->
        <!--            </div>-->
    </div>
    <div class="col-md-6 col1 visible-md-block visible-lg-block">
        <img src="../assets/timg.jpg" id="img" ondragstart="return false">
    </div>
</div>
</body>
</html>