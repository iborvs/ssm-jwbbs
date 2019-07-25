package com.uj.ssm.controller;

import com.uj.ssm.pojo.User;
import com.uj.ssm.service.TopicService;
import com.uj.ssm.service.UserService;
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
    @Autowired
    private UserService userService;
    @RequestMapping(value = {"/TopicCreate.action"})
    //
    public void TopicCreate(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicname=request.getParameter("topicname");
        String owner=request.getParameter("owner");
        String content=request.getParameter("content");
        int state;

        java.util.Date date = new java.util.Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
        String ndate = dateFormat.format(date); //可以把日期转换转指定格式的字符串

        Topic topic = new Topic(topicname, owner, ndate, ndate, 1, content);
        state = topicService.TopicCreate(topic);
    }
    //return one specific topic in json
    //@ResponseBody
    @RequestMapping(value = {"/TopicRead.action"})
    public void TopicRead(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
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
        //topicname owner starttime lasttime comments topicid content
        System.out.println("[{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" , \"content\" : \" "+ans.getContent()+"\" }]");
        writer.println("[{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" , \"content\" : \" "+ans.getContent()+"\" }]");
    }
    //return all topics in json
    //@ResponseBody
    @RequestMapping(value = {"/TopicReadAll.action"})
    public void TopicReadAll(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        List<Topic>lst = topicService.TopicReadAll();
        int len = lst.size();
        writer.println("[");
        System.out.println("[");
        for(int i = 0; i < len; i++){
            Topic ans = lst.get(i);
            if(i != 0) {
                System.out.print(", ");
                writer.print(", ");
            }
            System.out.println("{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" , \"content\" : \" "+ans.getContent()+"\" }");
            writer.println("{ \"topicname\" : \""+ans.getTopicname()+"\",\"owner\": \""+ans.getOwner()+"\" , \"starttime\" : \" "+ans.getStarttime() + "\" , \"lasttime\" : \" "+ans.getLasttime()+"\" , \"topicid\" : \" "+ans.getTopicid()+"\" , \"content\" : \" "+ans.getContent()+"\" }");
        }
        writer.println("]");
        System.out.println("]");
    }
    @RequestMapping(value = {"/TopicGetName.action"})
    public void TopicGetName(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicidStr = request.getParameter("topicid");
        int topicid = 0;
        if(topicidStr == null || topicidStr.equals("")) {
            topicid = 0;
        } else {
            topicid = Integer.parseInt(topicidStr);
        }

        String topicname = topicService.TopicGetName(topicid);
        writer.print("[{ \"topicname\" : \"");
        System.out.print("[{ \"topicname\" : \"");
        writer.print(topicname);
        System.out.print(topicname);
        writer.println("\"}]");
        System.out.println("\"}]");
    }
    @RequestMapping(value = {"/TopicDelete.action"})
    public void TopicDelete(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String topicidStr = request.getParameter("topicid");
        int topicid = 0;
        if(topicidStr == null || topicidStr.equals("")) {
            topicid = 0;
        } else {
            topicid = Integer.parseInt(topicidStr);
        }
        Topic safe = new Topic(topicid);
        Topic wholeTopic = topicService.TopicRead(safe);
        String owner = wholeTopic.getOwner();
        User requestUser = new User();
        requestUser.setUsername(owner);
        boolean ok = userService.legalUser(request, requestUser);
        if(ok == true)
            topicService.TopicDelete(topicid);
        else{
            System.out.println("access denied");
            writer.println("access denied");
        }
    }
}
