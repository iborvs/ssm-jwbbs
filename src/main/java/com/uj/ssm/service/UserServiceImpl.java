package com.uj.ssm.service;

import com.uj.ssm.mapper.UserMapper;
import com.uj.ssm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper UserMapper;
	
	//查询商品列表
	public int userLogin(User loginUser){
		List<User> users = UserMapper.login(loginUser);
		int state = 0 ;
		if(users.size()!=0){
			state = 1;
			java.util.Date date = new java.util.Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
			String ndate = dateFormat.format(date); //可以把日期转换转指定格式的字符串
			loginUser.setLoginDate(ndate);
			UserMapper.updateLoginDate(loginUser);
			System.out.println(users.get(0));
		}
		return state;
	}

	public int userRegister(User newUser){
		List<User> users = UserMapper.findUser(newUser);
		int state = 0;
		if(users.size() == 0){
			state = 1;
			UserMapper.insert(newUser);
		}
		return state;
	}
	public User userFind(User findUser){
		List<User> users = UserMapper.findUser(findUser);
		if(users.size()>0)
			return  users.get(0);
		return null;
	}
	public int userInfoUpdate(User loginUser){
		int state = 0;
		state = UserMapper.updateUserInfo(loginUser);
		return state;
	}
	public boolean legalUser(HttpServletRequest request,User requestUser){ //request用于判断当前登录用户，request用于判断被操作的用户----
		HttpSession session = request.getSession(true);          //---判断一个用户时候被封禁时两个参数填同一用户就好
		User legalUs = new User();
		requestUser = UserMapper.findUser(requestUser).get(0);
		if(requestUser ==null)  //请求用户不存在
			return false;
		else if(requestUser.getPrivileges()==-1) //请求用户被禁止
			return false;
		if(session.getAttribute("login_user")!=null){
			legalUs.setUsername(session.getAttribute("login_user").toString());
			legalUs = UserMapper.findUser(legalUs).get(0);
			if(legalUs.getPrivileges()==-1)
				return false;
			if(legalUs!=null){
				if(legalUs.getPrivileges() ==1 || legalUs.getUsername().equals(requestUser.getUsername()))
					return true;
			}
		}
		return false;
	}
	public boolean ifLoggedin(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		User legalUs = new User();
		if(session.getAttribute("login_user")!=null){
			return true;
		}
		return false;
	}
	public boolean ifAdmin(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		User requestUser = new User();
		requestUser.setUsername( session.getAttribute("login_user").toString());
		requestUser = UserMapper.findUser(requestUser).get(0);
		if(requestUser!=null)
			if(requestUser.getPrivileges()==1)
				return true;
		return false;
	}
	public boolean banUser(User banneduser){
		int state=0;
		if(banneduser!=null)
			state = UserMapper.banUser(banneduser);
		if(state==1)
			return true;
		else
			return false;
	}
	public boolean releaseUser(User banneduser){
		int state=0;
		if(banneduser!=null)
			state = UserMapper.releaseUser(banneduser);
		if(state==1)
			return true;
		else
			return false;
	}
	public User getLoginUser(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		User legalUs = new User();
		if(session.getAttribute("login_user")!=null){
			legalUs.setUsername(session.getAttribute("login_user").toString());
			legalUs = userFind(legalUs);
		}
		else
			legalUs =null;
		return legalUs;
	}
}
