package com.uj.ssm.controller;

import com.uj.ssm.MD5;
import com.uj.ssm.imagedeal;
import com.uj.ssm.pojo.User;
import com.uj.ssm.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ViewsController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/userInfo.views"})
	public String userInfo(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("login_user")!=null){
			return "User/userpage.jsp";
		}else{
			writer.println("failed");
		}
		return "welcome.blade.jsp";
	}
	@RequestMapping(value = {"/login.views"})
	public String loginViews(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("login_user")==null){
			return "login.jsp";
		}else{
			writer.println("failed");
		}
		return "welcome.blade.jsp";
	}

	@RequestMapping(value = {"/register.views"})
	public String registerViews(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("login_user")==null){
			return "register.jsp";
		}else{
			writer.println("failed");
		}
		return "welcome.blade.jsp";
	}

	@RequestMapping(value = {"/profile.views"})
	public String profileViews(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("user");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		if(username!=null){
			return "User/profile.jsp?user="+username;
		}else{
			writer.println("failed");
		}
		return "welcome.blade.jsp";
	}

	@RequestMapping(value = {"/avatar.views"})
	public String avatarGet(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("user");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String filePath=request.getServletContext().getRealPath("/");
		String destPath = filePath+"public/avatar/"+ username+".png";
		File tempfile=new File(destPath);
		if(tempfile.exists()&&tempfile.isFile()) {
			File destfile = new File(destPath);
			if (destfile.exists() && destfile.isFile()) {
				return  "../public/avatar/" + username + ".png";
			}
		}
		return "../public/avatar/iborvs.png";
	}
	}