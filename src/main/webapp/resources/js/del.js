function confirmDel(para,type){
    if(window.confirm('确定要删除此条回复么？')){
        var url = "/CommDelete.action";
        var data = 'commentid=';
        if(type=="1"){
            url = "/TopicDelete.action";
            data = "topicid=";
        }
        $.get(
            url,
            data+para,
            function (response,status) {
                if(response!=null){
                    if(response.indexOf("denied")!=-1)
                        alert("无权限！");
                    else
                        alert("删除成功！");
                    location.reload();
                }
                else{
                    alert("网络异常！");
                    location.reload();
                }

            }
        );
    }
}