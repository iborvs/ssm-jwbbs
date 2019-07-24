package com.uj.ssm.controller;


import com.google.gson.Gson;
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
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class TopicController {

    @Autowired
    private TopicService topicService;
    @RequestMapping(value = {"/TopicCreate.action"})
    //
    public void TopicCreate(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicname=request.getParameter("topicname");
        String owner=request.getParameter("owner");
        int state;

        java.util.Date date = new java.util.Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
        String ndate = dateFormat.format(date); //可以把日期转换转指定格式的字符串

        Topic topic = new Topic(topicname, owner, ndate, ndate, 1);
        state = topicService.TopicCreate(topic);
    }
    //return one specific topic in json
    //@ResponseBody
    @RequestMapping(value = {"/TopicRead.action"})
    public void TopicRead(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicidStr = request.getParameter("topicid");
        int topicid = 0;
        if(topicidStr == null || topicidStr.equals("")) {
            topicid = 0;
        } else {
            topicid = Integer.parseInt(topicidStr);
        }
        Topic topic = new Topic(topicid);
        Topic ans = topicService.TopicRead(topic);
        //topicname owner starttime lasttime comments topicid
        System.out.println("[{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" }]");
        writer.println("[{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" }]");
    }
    //return all topics in json
    //@ResponseBody
    @RequestMapping(value = {"/TopicReadAll.action"})
    public void TopicReadAll(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        List<Topic>lst = topicService.TopicReadAll();
        int len = lst.size();
        writer.println("[");
        System.out.println("[");
        for(int i = 0; i < len; i++){
            Topic ans = lst.get(i);
            System.out.println("{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" }");
            writer.println("{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" }");
        }
        writer.println("]");
        System.out.println("]");
    }
}
