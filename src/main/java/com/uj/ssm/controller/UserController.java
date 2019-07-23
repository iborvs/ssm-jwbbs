package com.uj.ssm.controller;

import com.uj.ssm.MD5;
import com.uj.ssm.imagedeal;
import com.uj.ssm.pojo.User;
import com.uj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.PrintWriter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/login.action"})
	public void UserLogin(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		String username=request.getParameter("username");
		String userpwd=request.getParameter("password");
		userpwd = MD5.md5(userpwd,username);
		User loginUser = new User(username,userpwd);
		int state;
		state = userService.userLogin(loginUser);
		if(state==1){
			Cookie cookie=new Cookie("username", username);
			cookie.setMaxAge(7*24*60*60);
			response.addCookie(cookie);
			//设置头像与默认头像cookie
			String filePath=request.getServletContext().getRealPath("/");
			String realPath = filePath+"public/avatar/"+ username+".png";
			System.out.println(realPath);
			File file=new File(realPath);
			String avatarName="iborvs";
			if(file.exists()&&file.isFile()){
				avatarName = username;
			}
			Cookie imgcookie=new Cookie("userimg", avatarName);
			cookie.setMaxAge(7*24*60*60);
			response.addCookie(imgcookie);
			writer.println("success");

		}else{
			writer.println("failed");
		}
	}

	@RequestMapping(value = {"/register.action"})
	public void UserRegister(HttpServletRequest request,HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		String username=request.getParameter("username");
		String userpwd=request.getParameter("password");
		userpwd = MD5.md5(userpwd,username);
		String email=request.getParameter("email");
		String qq=request.getParameter("qq");
		String nickname=request.getParameter("nickname");
		java.util.Date date = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
		String ndate = dateFormat.format(date); //可以把日期转换转指定格式的字符串
		User registerUser = new User(username,userpwd,email,qq,nickname,ndate,ndate);
		int state;
		state = userService.userRegister(registerUser);
		if(state == 0)
			writer.println("failed");
		else{
				writer.println("success");
		}
	}
	@RequestMapping(value = {"/userinfoupdate.action"})
	public void UserInfoUpdate(HttpServletRequest request,HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		String username=request.getParameter("username");
		String nickname=request.getParameter("nickname");
		String qq=request.getParameter("qq");
		String email=request.getParameter("email");
		String ifavatar=request.getParameter("avatar");
		User editUser = new User(username,"",email,qq,nickname,"","");
		int state;
		state = userService.userInfoUpdate(editUser);
		String filePath=request.getServletContext().getRealPath("/");
		System.out.println(ifavatar);
		if(ifavatar!=""){
			String sourcePath = filePath+"public/temp/"+ ifavatar;
			String destPath = filePath+"public/avatar/"+ username+".png";
			File tempfile=new File(sourcePath);
			if(tempfile.exists()&&tempfile.isFile()){
				File destfile=new File(destPath);
				if(destfile.exists()&&destfile.isFile()) {
					destfile.delete();
					destfile.renameTo(new File(filePath+"public/avatar/"+ username));
				}
				Files.copy(tempfile.toPath(), destfile.toPath());
			}
		}
		if(state==1){
			writer.println("success");
		}
		else {
			writer.println("failed");
		}
	}
	@RequestMapping(value = {"/uploadavatar.action"})
	public void UploadAvatar(HttpServletRequest request,HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		List<Double> paras = new ArrayList<>();
		Boolean isMultipart=ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			return; //如果不是就不用上传了
		}
		try {
			DiskFileItemFactory factory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(factory);
			List<FileItem> items=upload.parseRequest(request);
			for (FileItem item : items) {
				String fileName = item.getFieldName();
				if (item.isFormField()) {
					String value = item.getString("utf-8");
					System.out.println(fileName + "->" + value);
					paras.add(Double.valueOf(value));
				} else {
					//上传文件的控件
					System.out.println(fileName + "->" + item.getName()); //一个的标签的name，一个是文件的name
					String filePath=request.getServletContext().getRealPath("/");
					String realPath = filePath+"public/temp/"+ item.getName();
					System.out.println(realPath);
					File file=new File(realPath);
					if(file.exists()&&file.isFile())
						file.delete();
					item.write(new File(realPath)); //把上传的文件保存到某个文件中
					imagedeal.img_cropper(realPath , paras.get(0).intValue() , paras.get(1).intValue() , paras.get(2).intValue() , paras.get(3).intValue());
				}
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	}