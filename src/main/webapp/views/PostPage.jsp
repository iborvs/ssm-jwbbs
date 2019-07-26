<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>PostPage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <script src="../resources/js/jquery-2.1.4.min.js"></script>
    <script src="../resources/js/bootstrap.js"></script>
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
        $(document).ready(function () {
            var returns = $("[class='div_item']").length;
            $("[id='return_num']").text(returns - 1);
        })
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
    <div class="item_list">
        <div class="div_item">
            <div class="div_item1">
                <div>
                    <img src="../assets/photo.jpg" alt="" class="img-circle avatar" style="border: 1px solid black">
                </div>
                <div>
                    <span class="badge">用户名</span>
                </div>
                <div>
                    <span class="badge badge_host">楼主</span>
                </div>
            </div>
            <div class="div_item2 panel panel-default">
                <div class="panel-heading">
                    <div>
                        <h3>一次快乐的购物体验</h3>
                    </div>
                    <div class="inline_block">
                        <span class="glyphicon glyphicon-comment"></span>
                        <span id="return_num"></span>
                    </div>
                    |
                    <div class="inline_block">
                        <span>发表于:</span>
                        <span>2016-12-04</span>
                    </div>
                    <div style="float:right;" class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle bth_" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            编辑 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#">修改</a></li>
                            <li><a href="#">删除</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">
                    真的超级喜欢，非常支持，质量非常好，与卖家描述的完全一致，非常满意,真的很喜欢，完全超出期望值，发货速度非常快，包装非常仔细、严实，物流公司服务态度很好，运送速度很快，很满意的一次购物
                </div>
            </div>
        </div>
        <div class="div_item">
            <div class="div_item1">
                <div>
                    <img src="../assets/photo2.jpg" alt="" class="img-circle avatar" style="border: 1px solid black">
                </div>
                <div>
                    <span class="badge">用户名</span>
                </div>
            </div>
            <div class="div_item2 panel panel-default">
                <div class="panel-heading">
                    <span>回复于:</span>
                    <span>2016-9-24</span>
                </div>
                <div class="panel-body">
                    破事水
                </div>
            </div>
        </div>
        <div class="div_item">
            <div class="div_item1">
                <div>
                    <img src="../assets/photo2.jpg" alt="" class="img-circle avatar" style="border: 1px solid black">
                </div>
                <div>
                    <span class="badge">用户名</span>
                </div>
            </div>
            <div class="div_item2 panel panel-default">
                <div class="panel-heading">
                    <span>回复于:</span>
                    <span>2016-9-24</span>
                </div>
                <div class="panel-body">
                    破事水
                </div>
            </div>
        </div>
        <div class="div_item">
            <div class="div_item1">
                <div>
                    <img src="../assets/photo2.jpg" alt="" class="img-circle avatar" style="border: 1px solid black">
                </div>
                <div>
                    <span class="badge">用户名</span>
                </div>
            </div>
            <div class="div_item2 panel panel-default">
                <div class="panel-heading">
                    <span>回复于:</span>
                    <span>2016-9-24</span>
                </div>
                <div class="panel-body">
                    破事水
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
    <div class="reply">
        <form>
            <div>
                <h4><span class="glyphicon glyphicon-pencil"></span>发表回复</h4>
            </div>
            <div>
                <textarea class="form-control" rows="9" style="resize: none;" placeholder="发表一下你的看法" required></textarea>
            </div>
            <div class="form-group">
                <label for="InputFile">上传图片</label>
                <input type="file" id="InputFile" title="?">
            </div>
            <div>
                <div id="v_container"></div>
                <input type="text" id="code_input" value="" placeholder="请输入验证码"/>
            </div>
            <div>
                <button type="submit" class="btn btn-default" id="my_button"><span class="glyphicon glyphicon-upload"></span>&nbsp;&nbsp;发表</button>
            </div>
            <script src="../resources/js/gVerify.js"></script>
        </form>
    </div>
</div>
</body>
</html>