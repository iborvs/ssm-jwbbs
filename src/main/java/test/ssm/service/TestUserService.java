package test.ssm.service;

import com.uj.ssm.MD5;
import com.uj.ssm.pojo.User;
import com.uj.ssm.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class TestUserService {


    @Autowired
    private UserService userService;

    /**
     * 测试获取用户信息接口
     */
    @Test
    public void testUserLogin() {
        User user = new User();
        user.setUsername("tom");
        User userInfo = userService.userFind(user);
        System.out.println(userInfo.toString());
    }

    /**
     * 测试用户注册
     */
    @Test
    public void testUserRegister() throws Exception {
        User user = new User();
        user.setUsername("张三");
        user.setEmail("123123@163.com");
        user.setNickname("张大三");
        user.setQq("232123123");
        user.setPassword(MD5.md5("123123", "张三"));
        int flag = userService.userRegister(user);
        if (flag > 0) {
            //注册成功 查询是否有信息
            System.out.println("用户信息注册成功！");
        }else{
            System.out.println("用户信息注册失败！");
        }

    }

}
