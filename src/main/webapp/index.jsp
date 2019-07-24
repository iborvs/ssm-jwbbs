<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>index</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <script src="resources/js/jquery-2.1.4.min.js"></script>
  <script src="resources/js/bootstrap.js"></script>
  <style>
    body{
      background-image: url("assets/back1.jpg");
      background-size: cover;
    }
    .jumbotron{
      background-image: url("assets/background01.jpg");
      background-size:cover;
      padding-bottom: 0;
      padding-top: 0;
    }
    .header{
      color: #fff;
      background-color: #6699cc;
      padding: 0.5% 1% 0.5% 1%;
      border-top-left-radius: 4px;
      border-top-right-radius: 4px;
    }
    .avatar{
      height: 60px;
      width: 60px;
    }
    .div_list{
      background-color: #fff;
    }
    .div_item{
      display: flex;
      border:1px solid black;
      padding-bottom: 0.8%;
    }
    .div_item1{
      display: inline-block;
    }
    .div_item2{
      display: inline-block;
      vertical-align: top;
      padding: 3px 3px;
      overflow: hidden;
      max-width: 100%;
    }
    .avatar_user{
      text-align: center;
    }
    .item_h3{
      margin-top: 0;
    }
    .item_a:hover{
      text-decoration: none;
      color: #fb7709;
    }
    .avatar_box{
      width: 43px;
      height: 43px;
    }
    .navbar-fixed-top{
      position: sticky;
      margin-bottom: 0;
    }
  </style>
  <script>
    $(function () {
      $('[data-toggle="tooltip"]').tooltip();
    });
  </script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">BBS</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <!--                <ul class="nav navbar-nav">-->
      <!--                    <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>-->
      <!--                    <li><a href="#">Link</a></li>-->
      <!--                    <li class="dropdown">-->
      <!--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>-->
      <!--                        <ul class="dropdown-menu">-->
      <!--                            <li><a href="#">Action</a></li>-->
      <!--                            <li><a href="#">Another action</a></li>-->
      <!--                            <li><a href="#">Something else here</a></li>-->
      <!--                            <li role="separator" class="divider"></li>-->
      <!--                            <li><a href="#">Separated link</a></li>-->
      <!--                            <li role="separator" class="divider"></li>-->
      <!--                            <li><a href="#">One more separated link</a></li>-->
      <!--                        </ul>-->
      <!--                    </li>-->
      <!--                </ul>-->
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" style="padding: 0;" data-toggle="tooltip" data-placement="bottom" title="个人中心"><img src="assets/photo.jpg" class="avatar_box img-circle"></a>
        </li>
        <li><a href="#">发帖</a></li>
        <li><a href="login.views">登录</a></li>
        <li><a href="/register.views">注册</a></li>
        <!--                    <li class="dropdown">-->
        <!--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>-->
        <!--                        <ul class="dropdown-menu">-->
        <!--                            <li><a href="#">Action</a></li>-->
        <!--                            <li><a href="#">Another action</a></li>-->
        <!--                            <li><a href="#">Something else here</a></li>-->
        <!--                            <li role="separator" class="divider"></li>-->
        <!--                            <li><a href="#">Separated link</a></li>-->
        <!--                        </ul>-->
        <!--                    </li>-->
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
<div class="jumbotron">
  <div class="container">
    <h1>欢迎来到XX论坛！</h1>
    <p>...</p>
    <p><a class="btn btn-danger btn-lg" href="#" role="button">Learn more</a></p>
  </div>
</div>
<div class="container">
  <div class="header">
    <header style="display: inline-block">热帖</header>
    <a href="#" style="float: right;color: #fff;">更多&raquo;</a>
  </div>
  <div class="div_list">
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
    <div class="div_item">
      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">
        <div>
          <img src="assets/photo.jpg" alt="" class="avatar img-thumbnail">
        </div>
        <div class="avatar_user">
          <span class="badge">用户名</span>
        </div>
      </div>
      <div class="div_item2">
        <div>
          <h3 class="item_h3"><a href="#" class="item_a">帖子标题</a></h3>
        </div>
        <div>
          <p>帖子内容简览~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
        </div>
      </div>
    </div>
  </div>
  <nav aria-label="Page navigation" style="text-align: center">
    <ul class="pagination">
      <li>
        <a href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li class="active"><span href="#">1</span></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li>
        <a href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
  <div id="yes">

  </div>
</div>
</body>
</html>