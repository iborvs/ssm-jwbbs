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
            padding-top: 3%;
            padding-bottom: 3%;
        }
        .div_box{
            height: 100%;
        }
        .btn-lg{
            padding: 0px;
            font-size: 14px;
            line-height: 1.2;
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
            checkAccess();
        }


        function validateForm(myForm){
            var x=document.forms["myForm"]["email"].value;
            var atpos=x.indexOf("@");
            var dotpos=x.lastIndexOf(".");
            if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                alert("不是一个有效的 e-mail 地址");
                return false;
            }

            var userid=document.forms["myForm"]["username"].value;
            if(userid.length<6||userid.length>12)
            { alert("用户名为6-12位字符串");
                return false;}


            var nickid=document.forms["myForm"]["nickname"].value;
            if(nickid.length<6||nickid.length>12)
            { alert("昵称为6-12位字符串");
                return false;}


            var ps=document.forms["myForm"]["password"].value;

            if (ps.length>=8)
            {
                var re =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;

                if (!re.test(ps))
                {  alert("密码由至少1个大写字母，1个小写字母和1个数字组成")
                    return(false);
                }
            }
            else{
                alert("密码至少8位")
                return(false);
            }

            var ps2=document.forms["myForm"]["password2"].value;
            if(ps!=ps2){
                alert("两次输入的密码不一致")
                return false;
            }

            var qqq=document.forms["myForm"]["qq"].value;
            var qqPattern = /^[1-9][0-9]{4,10}$/;
            if(!qqPattern.test(qqq)){
                alert("请输入5-11位qq号(只能为数字)");
                return false;

            }
        }
        function checkAccess(){
            if (document.getElementById("if_access").checked){
                document.getElementById("accept").removeAttribute("disabled");
            }
            else{
                document.getElementById("accept").setAttribute("disabled",true);
            }
        }

        window.onunload =function () {
            document.getElementById("if_access").checked = false;
        }

        function register_leap() {
            if(validateForm() != false){
                var email = document.getElementById("InputEmail").value;
                var username = document.getElementById("InputUsername").value;
                var nickname = document.getElementById("InputNickname").value;
                var pwd = document.getElementById("InputPassword").value;
                var qq = document.getElementById("InputQQ").value;
                $.post("${pageContext.request.contextPath}/register.action", {email:email,username:username,nickname:nickname,password:pwd,qq:qq}, function (data) {
                    data = data.replace(/[\r\n]/g,"");
                    if(data == "success"){
                        alert("注册成功，即将前往登录页面...");
                        window.location.href = "/login.views";
                    }
                    else{
                        alert("该用户名已存在！！");
                    }
                });
            }
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
            <form name="myForm">
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
                    <label for="InputPassword2"><span class="glyphicon glyphicon-record"></span> 确认密码</label>
                    <input type="password" class="form-control" id="InputPassword2" name="password2" placeholder="Require">
                </div>
                <div class="form-group">
                    <label for="InputQQ"><span class="glyphicon glyphicon-comment"></span> QQ</label>
                    <input type="text" class="form-control" id="InputQQ" name="qq" placeholder="QQ">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="if_access" name="InputCheckbox" onclick="checkAccess()">我已阅读并同意相关服务条款和隐私政策
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
                <button type="button" class="btn btn-default col-md-12 col12" id="accept"  disabled="true" onclick="register_leap()"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;立即注册</button>
            </form>
        </div>
    </div>
    <div class="col-md-6 col1 visible-md-block visible-lg-block">
        <img src="../assets/timg.jpg" id="img" ondragstart="return false">
    </div>
</div>
</body>
</html>