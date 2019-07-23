package com.uj.ssm.mapper;


import com.uj.ssm.pojo.User;

import java.util.List;

public interface UserMapper {
    int insert(User record);
    List<User> login(User loginUser);
    int updateLoginDate(User loginUser);
    int updateUserInfo(User loginUser);
    List<User> findUser(User user);
}