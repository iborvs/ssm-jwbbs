<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <script src="../resources/js/jquery-2.1.4.min.js"></script>
    <script src="../resources/js/bootstrap.js"></script>
    <script src="../resources/js/gVerify.js"></script>
    <script src="../resources/js/del.js"></script>
    <style>
        body{
            background-image: url("../assets/demo-1-bg.jpg");
            background-size: cover;
        }
        .div_list{

        }
        .reply{
            border:1px solid black;
            border-radius: 4px;
            padding: 0 1% 1% 1%;
            margin-bottom: 1%;
            background-color: white;
        }
        .avatar{
            height: 90px;
            width: 90px;
        }
        .div_item{
            display: flex;
            justify-content: center;
            margin-bottom: 1%;
        }
        .div_item1{
            padding: 3%;
            display: inline-block;
            border:1px solid black;
            border-radius: 4px;
            min-height:200px;
            text-align: center;
            background-color: white;
        }
        .div_item1>div{
            padding: 4%;
        }
        .div_item2{
            display: inline-block;
            border:1px solid black;
            border-radius: 4px;
            min-height: 200px;
            flex-grow: 1;
        }
        .badge{
            background-color: #2ecc71;
        }
        .badge_host{
            background-color: #ff6927;
        }
        .panel{
            margin-bottom: 0;
        }
        .inline_block{
            display: inline-block;
        }
        .bth_{
            padding: 0;
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
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });


        function newAuthor(topicname, owner, content, starttime,id){
            var num = Math.random();
            var list = $("#post_list");
            list.append('        <div class="div_item">\n' +
                '            <div class="div_item1">\n' +
                '                <div>\n' +
                '                    <a href="profile.views?user='+owner+'"><img src="../../avatar.views?user='+ owner +'&date='+num+'" alt="" class="img-circle avatar" style="border: 1px solid black"></a>\n' +
                '                </div>\n' +
                '                <div>\n' +
                '                    <span class="badge">' + owner + '</span>\n' +
                '                </div>\n' +
                '                <div>\n' +
                '                    <span class="badge badge_host">楼主</span>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '            <div class="div_item2 panel panel-default">\n' +
                '                <div class="panel-heading">\n' +
                '                    <div>\n' +
                '                        <h3>' + topicname + '</h3>\n' +
                '                    </div>\n' +
                '                    <div class="inline_block">\n' +
                '                        <span class="glyphicon glyphicon-comment"></span>\n' +
                '                        <span id="return_num"></span>\n' +
                '                    </div>\n' +
                '                    |\n' +
                '                    <div class="inline_block">\n' +
                '                        <span>发表于:</span>\n' +
                '                        <span>' + starttime + '</span>\n' +
                '                    </div>\n' +
                '<a class="del" style="float:right" onclick="confirmDel(\''+ id +'\',1)">删除</a>'+
                '                </div>\n' +
                '                <div class="panel-body">\n' + content +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>');
        }

        function newAnswerer(owner, lasttime, content,id){
            var num = Math.random();
            var list = $("#post_list");
            list.append('<div class="div_item">\n' +
                '            <div class="div_item1">\n' +
                '                <div>\n' +
                '                    <a href="profile.views?user='+owner+'"><img src="../../avatar.views?user='+ owner +'&date='+num+'" alt="" class="img-circle avatar" style="border: 1px solid black"></a>\n' +
                '                </div>\n' +
                '                <div>\n' +
                '                    <span class="badge">' + owner + '</span>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '            <div class="div_item2 panel panel-default">\n' +
                '                <div class="panel-heading">\n' +
                '                    <span>回复于:</span>\n' +
                '                    <span>' + lasttime + '</span>\n' +
                    '<a class="del" style="float:right" onclick="confirmDel(\''+ id +'\',0)">删除</a>'+
                '                </div>\n' +
                '                <div class="panel-body">\n' + content +
                '                </div>\n' +
                '            </div>\n' +
                '        </div>');
        }


        var href = location.href;
        $(document).ready(function () {
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}/TopicRead.action",
                data : {topicid : location.search.substring(9)},
                dataType : "json",
                async : false,
                success : function (data) {
                    $.each(data, function (index, item) {
                        console.log(data);
                        newAuthor(item.topicname, item.owner, item.content, item.starttime,item.topicid);
                    });
                }
            });
            $.ajax({
                type : "get",
                url : "${pageContext.request.contextPath}/CommRead.action",
                data : {topicid : location.search.substring(9)},
                dataType : "text",
                async : false,
                success : function (data) {
                    data=data.replace(/[\r\n]/g,"");
                    data = $.parseJSON(data);
                    $.each(data, function (index, item) {
                        newAnswerer(item.owner, item.lasttime, item.content,item.commentid);
                    });
                }
            });
            divide_page();
        });

        // 以上为获取帖子内容

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

        // 以上为分页

        function create_reply() {
            var owner = "${cookie.login_user.value}";//不再需要
            var content = document.getElementById("ReplyContent").value;
            if(content == ""){
                alert("内容不能为空！");
            }else{
                $.post("${pageContext.request.contextPath}/CommCreate.action", {topicid:location.search.substring(9),owner:owner,content:content}, function () {
                    alert("发表成功！");
                    window.location.reload();
                    // window.location.href = href;
                });
            }
        }
        // 以上为回复
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
    <div class="item_list" id="post_list">

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
<%--    <nav aria-label="Page navigation" style="text-align: center">--%>
<%--        <ul class="pagination">--%>
<%--            <li>--%>
<%--                <a href="#" aria-label="Previous">--%>
<%--                    <span aria-hidden="true">&laquo;</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li class="active"><span href="#">1</span></li>--%>
<%--            <li><a href="#">2</a></li>--%>
<%--            <li><a href="#">3</a></li>--%>
<%--            <li><a href="#">4</a></li>--%>
<%--            <li><a href="#">5</a></li>--%>
<%--            <li>--%>
<%--                <a href="#" aria-label="Next">--%>
<%--                    <span aria-hidden="true">&raquo;</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </nav>--%>
    <div class="reply">
        <form>
            <div>
                <h4><span class="glyphicon glyphicon-pencil"></span>发表回复</h4>
            </div>
            <div class="form-group">
                <textarea class="form-control" rows="9" style="resize: none;" placeholder="发表一下你的看法" id="ReplyContent"></textarea>
            </div>
            <div>
                <div id="v_container"></div>
                <input type="text" id="code_input" value="" placeholder="请输入验证码"/>
            </div>
            <div>
                <button type="submit" class="btn btn-default" id="my_button"><span class="glyphicon glyphicon-upload"></span>&nbsp;&nbsp;发表</button>
            </div>
            <script>
                var verifyCode = new GVerify("v_container");
                document.getElementById("my_button").onclick = function(){
                    $.get("${pageContext.request.contextPath}/login.if",function (data) {
                        var test = /success/.test(data);
                        if(test == true){
                            var res = verifyCode.validate(document.getElementById("code_input").value);
                            if(res){
                                create_reply();
                            }else{
                                alert("验证码错误！");
                                // window.location.href = href;
                            }
                        }else{
                            alert("在发表回复前请先登录！");
                        }

                    });
                    return false;
                };
            </script>
        </form>
    </div>
</div>
</body>
</html>