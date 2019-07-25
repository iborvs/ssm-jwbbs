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
	public boolean legalUser(HttpServletRequest request,User requestUser){
		HttpSession session = request.getSession(true);
		User legalUs = new User();
		if(session.getAttribute("login_user")!=null){
			legalUs.setUsername(session.getAttribute("login_user").toString());
			legalUs = UserMapper.findUser(legalUs).get(0);
			if(legalUs!=null){
				if(legalUs.getPrivileges() ==1 || legalUs.getUsername().equals(requestUser.getUsername()))
					return true;
			}
		}
		return false;
	}
}
