package com.uj.ssm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;// 用户姓名
	private String password;// 性别
	private String registerDate;// 生日
	private String lateLoginDate;// 地址
	private  String email;
	private String qq;
	private  String nickname;
	//附加对象List

	public User(String username, String password, String email, String qq,String nickname,String registerDate,String lateLoginDate) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.qq = qq;
		this.nickname = nickname;
		this.registerDate = registerDate;
		this.lateLoginDate = lateLoginDate;
	}
	public User(String username,String password){
		this.username = username;
		this.password = password;
	}
	public User(){
		this.username = "";
		this.password = "";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getLoginDate() {
		return lateLoginDate;
	}

	public void setLoginDate(String loginDate) {
		this.lateLoginDate = loginDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "User [nickname=" + nickname + ", username=" + username + ", lastLoginDate=" + lateLoginDate
				+ ", qq=" + qq + ", email=" + email + "]";
	}

	
	

}
