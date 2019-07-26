<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <script src="../resources/js/jquery-2.1.4.min.js"></script>
    <script src="../resources/js/bootstrap.js"></script>
    <script src="../resources/js/jquery.base64.js"></script>
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
            padding-top: 8%;
            padding-bottom: 8%;
        }
        .div_box{
            height: 100%;
        }
        .form-control{
            font-size: 15px;
        }
        .col12{
            margin-bottom: 15px;
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

        function setCookie(cname,cvalue,exdays)
        {
            var d = new Date();
            d.setTime(d.getTime()+(exdays*24*60*60*1000));
            var expires = "expires="+d.toGMTString();
            document.cookie = cname + "=" + cvalue + "; " + expires;
        }

        function getCookie(cname)
        {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++)
            {
                var c = ca[i].trim();
                if (c.indexOf(name)==0) return c.substring(name.length,c.length);
            }
            return "";
        }
        function rememberpw() {
            if(document.getElementById("InputRemember").checked == true) {
                var password64 = $.base64.encode(document.getElementById("InputPassword").value);
                setCookie("username", document.getElementById("InputUsername").value, 1);
                setCookie("password", password64, 1);
                setCookie("checked", document.getElementById("InputRemember").value, 1);
            }
            else{
                document.cookie = "username=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
                document.cookie = "password=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
                document.cookie = "checked=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
            }
        }


        function login_leap() {
                var username = document.getElementById("InputUsername").value;
                var pwd = document.getElementById("InputPassword").value;
                $.post("${pageContext.request.contextPath}/login.action", {username:username,password:pwd}, function (data) {
                    data = data.replace(/[\r\n]/g,"");
                    if(data == "success"){
                        alert("登陆成功！");
                        window.location.href = "/";
                    }
                    else{
                        alert("用户名或密码错误！");
                    }
                });
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="col-md-6 div_box">
        <div class="css-k58if visible-md-block visible-lg-block">

        </div>
        <div class="center-block col0">
            <form name="myForm">
                <div>
                    <h1>登录</h1>
                </div>
                <div class="form-group">
                    <label for="InputUsername"><span class="glyphicon glyphicon-user"></span> 用户名</label>
                    <input type="text" class="form-control" id="InputUsername" name="username" placeholder="Username" onchange="rememberpw()">
                </div>
                <div class="form-group">
                    <label for="InputPassword"><span class="glyphicon glyphicon-lock"></span> 密码</label>
                    <input type="password" class="form-control" id="InputPassword" name="password" placeholder="Password" onchange="rememberpw()">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="InputRemember" name="checkbox" onclick="rememberpw()">记住密码
                    </label>
                </div>
                <div>
                    <button type="button" class="btn btn-default col-md-12 col12" onclick="login_leap()"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;登录</button>
                </div>
                <div>

                    <a href="/register.views">没有账号？立即注册</a>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-6 col1  visible-md-block visible-lg-block">
        <img src="../assets/timg.jpg" id="img" ondragstart="return false">
    </div>
</div>
<script>
    document.getElementById("InputRemember").checked = getCookie("checked");
    document.getElementById("InputUsername").value = getCookie("username");
    document.getElementById("InputPassword").value = $.base64.decode(getCookie("password"));
</script>
</body>
</html>