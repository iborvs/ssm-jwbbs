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
@Controller

public class TopicController {

    @Autowired
    private TopicService topicService;
    @RequestMapping(value = {"/TopicCreate.action"})
    //needs a topicCreate.action
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
}
