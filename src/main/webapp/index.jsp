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
      padding-bottom: 6.5%;
      padding-top: 6.5%;
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
      text-align: center;
    }
    .div_item2{
      display: inline-block;
      vertical-align: top;
      padding: 3px 3px;
      overflow: hidden;
      max-width: 100%;
    }
    .avatar_user{

    }
    .item_h3{
      margin-top: 0;
    }
    .item_a:hover{
      text-decoration: none;
      color: #fb7709;
    }
  </style>
  <script>
    $(function () {
      $('[data-toggle="tooltip"]').tooltip();
    });

    function newTopic(topicname, owner, content, topicid){
      var list = $("#list");
      list.append('<div class="div_item">' +
              '      <div class="div_item1 visible-md-inline-block visible-lg-inline-block">' +
              '        <div>' +
              '          <a href="profile.views?user='+owner+'"><img src="../../avatar.views?user='+ owner +'" alt="" class="avatar img-thumbnail"></a>' +
              '        </div>' +
              '        <div class="avatar_user">' +
              '          <span class="badge">' + owner + '</span>' +
              '        </div>' +
              '      </div>' +
              '      <div class="div_item2">' +
              '        <div>' +
              '          <h3 class="item_h3"><a href="views/PostPage.jsp?topicid=' + topicid + '" class="item_a">' + topicname + '</a></h3>' +
              '        </div>' +
              '        <div>' +
              '          <p>' + content + '</p>' +
              '        </div>' +
              '      </div>' +
              '    </div>');
    }

    $(document).ready(function () {
      $.ajax({
        type : "get",
        url : "${pageContext.request.contextPath}/TopicReadAll.action",
        dataType : "json",
        async : false,
        success : function (data) {
          // data = $.parseJSON(data);
          $.each(data, function (index, item) {
            var simple_text;
            if(item.content.length > 25){
                simple_text = item.content.slice(0,25) + "...";
            }else{
                simple_text = item.content;
            }
            newTopic(item.topicname, item.owner, simple_text, item.topicid);
          });
        }
      });
      divide_page();
    });

    var page_num;
    var item_num;
    var page_now = 1;
    function divide_page() {
      item_num = document.getElementsByClassName("div_item").length;
      if(parseInt(item_num%8) == 0){
        page_num = parseInt(item_num/8);
      }
      else{
        page_num = parseInt(item_num/8) + 1;
      }
      if(page_num<=4){
        for(var i=1;i<=page_num;i++){
          $(".lastli").before('<li><a class="page" onclick="pageleap(this)">'+i+'</a></li>');
        }
      }
      else{
        for(var i=1;i<=5;i++){
          $(".lastli").before('<li><a class="page" onclick="pageleap(this)">'+i+'</a></li>');
        }
      }
      if(item_num>8){
        $(".div_item:gt(" + (page_now*8-1) + ")").hide();
      }
      signActive();
    }

    function nextPage() {
      if(page_now < page_num){
        $(".div_item:lt(" + page_now*8 + ")").hide();
        // $(".div_item:gt(" + (page_now*8-1) + "):lt(" + (page_now+1)*8 + ")").show();
        $(".div_item").slice(page_now*8, (page_now+1)*8).show();
        page_now++;
      }
      pageShift();
    }
    function prevPage() {
      if(page_now == 2){
        $(".div_item:lt(" + page_now*8 + ")").hide();
        // $(".div_item:lt(" + (page_now-1)*8 + ")").show();
        $(".div_item").slice(0, (page_now-1)*8).show();
        page_now--;
      }
      else if(page_now > 2){
        $(".div_item:lt(" + page_now*8 + ")").hide();
        $(".div_item").slice((page_now-2)*8, (page_now-1)*8).show();
        page_now--;
      }
      pageShift();
    }

    function pageleap(self) {
      var divItem = $(".div_item");
      page_now = parseInt(self.innerText);
      if(parseInt(self.innerText) == 1){
        divItem.hide();
        // $(".div_item:lt(" + parseInt(self.innerText)*8 + ")").show();
        divItem.slice(0, parseInt(self.innerText)*8).show();
      }
      else{
        divItem.hide();
        // console.log(".div_item:gt(" + ((parseInt(self.innerText)-1)*8-1) + "):lt(" + parseInt(self.innerText)*8 + ")");
        // $(".div_item:gt(" + ((parseInt(self.innerText)-1)*8-1) + "):lt(" + parseInt(self.innerText)*8 + ")").show();
        divItem.slice((parseInt(self.innerText)-1)*8,parseInt(self.innerText)*8).show();
      }
      // $(".page").remove();
      pageShift();
    }

    function pageShift() {
      if(page_num > 5){
        if(page_now > 3 && page_now < page_num-2){
          $(".page").remove();
          for(var i=page_now-2;i<=page_now+2;i++){
            $(".lastli").before('<li><a class="page" onclick="pageleap(this)">'+ i +'</a></li>');
          }
        }else if(page_now <= 3 && parseInt($(".page").eq(2).innerText) != 3){
          $(".page").remove();
          for(var i=1;i<=5;i++) {
            $(".lastli").before('<li><a class="page" onclick="pageleap(this)">' + i + '</a></li>');
          }
        }else if(page_now >= page_num-2 && parseInt($(".page").eq(2).innerText) != page_num-2){
          $(".page").remove();
          for(var i=page_num-4;i<=page_num;i++) {
            $(".lastli").before('<li><a class="page" onclick="pageleap(this)">' + i + '</a></li>');
          }
        }
      }
      signActive();
    }

    function signActive() {
      // var reg = /.+#\d+/i;
      // if(reg.test(document.location.href) == false){
      //   document.location.href += ("#" + page_now);
      // }
      for(var i=0;i<$(".page").length;i++){
        if(parseInt($(".page")[i].innerText) == page_now){
          $(".page").eq(i).parent().addClass("active");
        }
        else{
            $(".page").eq(i).parent().removeClass("active");
        }
      }
    }
  </script>
</head>
<body>
<%@include file="views/header.jsp"%>
<div class="jumbotron">
</div>
<div class="container">
  <div class="header">
    <header style="display: inline-block">热帖</header>
    <a href="#" style="float: right;color: #fff;">更多&raquo;</a>
  </div>
  <div class="div_list" id="list">

  </div>
  <nav aria-label="Page navigation" style="text-align: center">
    <ul class="pagination">
      <li>
        <a aria-label="Previous" class="prev" onclick="prevPage()">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li class="lastli">
        <a aria-label="Next" class="next" onclick="nextPage()">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
</body>
</html>