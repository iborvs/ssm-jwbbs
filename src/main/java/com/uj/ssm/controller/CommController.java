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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.uj.ssm.pojo.Topic;
import com.uj.ssm.pojo.Comm;
import com.uj.ssm.service.CommService;
import org.springframework.web.bind.annotation.ResponseBody;

import static java.lang.Math.min;

@Controller
/*
Topicid commentid owner lasttime content
 */

public class CommController {
    @Autowired
    private CommService commService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private UserService userService;
    @RequestMapping(value = {"/CommCreate.action"})
    public void CommCreate(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        //用户被封禁检查

        String topicidStr = request.getParameter("topicid");
        int topicid = 0;
        if(topicidStr == null || topicidStr.equals("")) {
            topicid = 0;
        } else {
            topicid = Integer.parseInt(topicidStr);
        }
        String owner=request.getParameter("owner");
        String content=request.getParameter("content");
        User login_user = userService.getLoginUser(request);
        if (login_user!=null)
            owner = login_user.getUsername();
        else {
            writer.println("用户未登录");
            return;
        }
        if(!userService.legalUser(request,login_user)){
            writer.println("用户已封禁");
            return;
        }

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
        List<Comm> lst = commService.CommRead(topicid);
        int len = lst.size();
        //Topicid commentid owner lasttime content
        writer.println("[");
        for(int i = 0; i < len; i++){
            Comm ans = lst.get(i);
            if(i != 0) {
                writer.print(", ");
            }
            Pattern pattern=Pattern.compile("(\r\n|\r|\n|\n\r)");
            //正则表达式的匹配一定要是这样，单个替换\r|\n的时候会错误
            Matcher matcher=pattern.matcher(ans.getContent());
            String content=matcher.replaceAll("<br>");
           writer.println("{ \"topicid\" : \""+ans.getTopicid()+"\",\"commentid\": \""+ans.getCommentid()+"\" , \"owner\" : \""+ans.getOwner() + "\" , \"lasttime\" : \""+ans.getLasttime()+"\" , \"content\" : \""+ans.getContent()+"\" }");
        }
        writer.println("]");
    }
    @RequestMapping(value = {"/GetTenComm.action"})
    //Topicid commentid owner lasttime content
    public void GetTenComm(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String owner=request.getParameter("owner");
        if(owner == "" || owner == null || owner=="null"){
            User login_user = userService.getLoginUser(request);
            if (login_user!=null)
                owner = login_user.getUsername();
            else {
                writer.println("用户未登录");
                return;
            }
        }

        List<Comm>lst = commService.GetTenComm(owner);
        int len = lst.size();
        len = min(len, 10);
        writer.println("[");
              for(int i = 0; i < len; i++){
            Comm ans = lst.get(i);
            int topicid = ans.getTopicid();
            String topicname = topicService.TopicGetName(topicid);
            if(i != 0) {
                       writer.print(", ");
            }
                  Pattern pattern=Pattern.compile("(\r\n|\r|\n|\n\r)");
                  //正则表达式的匹配一定要是这样，单个替换\r|\n的时候会错误
                  Matcher matcher=pattern.matcher(ans.getContent());
                  String content=matcher.replaceAll("<br>");

             writer.println("{ \"topicid\" : \""+ans.getTopicid()+"\",\"commentid\": \""+ans.getCommentid()+"\" , \"owner\" : \""+ans.getOwner() + "\" , \"lasttime\" : \""+ans.getLasttime()+"\" , \"content\" : \""+content+"\" , \"topicname\" : \""+topicname+"\" }");
        }
        writer.println("]");
              writer.close();
        }
    @RequestMapping(value = {"/CommDelete.action"})
    public void CommDelete(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String commentidStr = request.getParameter("commentid");
        int commentid = 0;
        if(commentidStr == null || commentidStr.equals("")) {
            commentid = 0;
        } else {
            commentid = Integer.parseInt(commentidStr);
        }
        String owner = commService.CommReadOwner(commentid);
        User requestUser = new User();
        requestUser.setUsername(owner);
        boolean ok = userService.legalUser(request, requestUser);
        if(ok == true) {
            Comm newComm = commService.CommFind(commentid);
            Topic newTopic = new Topic(newComm.getTopicid());
            newTopic = topicService.TopicRead(newTopic);
            List<Comm> commOfNewTopic = commService.CommRead(newTopic.getTopicid());
            if(commOfNewTopic.size()>1)
                newTopic.setLasttime(commOfNewTopic.get(commOfNewTopic.size()-1).getLasttime());
            else
                newTopic.setLasttime(newTopic.getStarttime());
            topicService.TopicMinus(newTopic);
            commService.CommDelete(commentid);
        }
        else{
            writer.println("access denied");
        }
    }

}
