package com.uj.ssm.controller;


import com.uj.ssm.pojo.User;
import com.uj.ssm.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.PrintWriter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.io.IOException;
import java.text.SimpleDateFormat;
import com.uj.ssm.pojo.Topic;
import com.uj.ssm.pojo.Comm;
import com.uj.ssm.service.CommService;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
/*
Topicid commentid owner lasttime content
 */

public class CommController {
    @Autowired
    private CommService commService;
    @Autowired
    private TopicService topicService;
    @RequestMapping(value = {"/CommCreate.action"})
    public void CommCreate(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicidStr = request.getParameter("topicid");
        int topicid = 0;
        if(topicidStr == null || topicidStr.equals("")) {
            topicid = 0;
        } else {
            topicid = Integer.parseInt(topicidStr);
        }
        System.out.println("topicid = " + topicid);
        String owner=request.getParameter("owner");
        String content=request.getParameter("content");

        java.util.Date date = new java.util.Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
        String ndate = dateFormat.format(date); //可以把日期转换转指定格式的字符串
        String lasttime = ndate;
        Comm comm = new Comm(topicid, owner, lasttime, content);
        Topic topic = new Topic(topicid, lasttime);
        commService.CommCreate(comm);
        topicService.TopicKeep(topic);
    }
    @ResponseBody
    @RequestMapping(value = {"/CommRead.action"})
    public void CommRead(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicidStr = request.getParameter("topicid");
        int topicid = 0;
        if(topicidStr == null || topicidStr.equals("")) {
            topicid = 0;
        } else {
            topicid = Integer.parseInt(topicidStr);
        }
        List<Comm> lst = commService.CommRead(topicid);
        int len = lst.size();
        //Topicid commentid owner lasttime content
        writer.println("[");
        System.out.println("[");
        for(int i = 0; i < len; i++){
            Comm ans = lst.get(i);
            System.out.println("{ \"topicid\" : \""+ans.getTopicid()+"\",\"commentid\": \""+ans.getCommentid()+"\" , \"owner\" : \" "+ans.getOwner() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"content\" : \" "+ans.getContent()+"\" }");
            writer.println("{ \"topicid\" : \""+ans.getTopicid()+"\",\"commentid\": \""+ans.getCommentid()+"\" , \"owner\" : \" "+ans.getOwner() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"content\" : \" "+ans.getContent()+"\" }");
        }
        writer.println("]");
        System.out.println("]");
    }
}
