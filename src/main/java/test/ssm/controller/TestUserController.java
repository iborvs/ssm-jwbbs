package test.ssm.controller;

import com.uj.ssm.controller.UserController;
import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class TestUserController {

    @Resource
    private UserController userController;
    private MockMvc mockmvc;

    @Before
    public void init(){
        mockmvc = MockMvcBuilders.standaloneSetup(userController).build();
    }

    //测试UserController,测试登录接口
    @Test
    public void testLogin() throws Exception{
        System.out.println("开始进行测试登录接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/login.action");
        //给请求添加参数,设置登录用户名密码：    "username":cdd,"password":1234
        request.param("username", "20164484").param("password", "123456");

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试登录接口完毕！");
    }


    /**
     * 测试注销登录接口
     */
    @Test
    public void testLogOut() throws Exception {
        System.out.println("开始进行测试注销登录接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/logout.action");

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试注销登录接口完毕！");
    }

    /**
     * 测试用户注册接口
     */
    @Test
    public void testRegister() throws Exception {
        System.out.println("开始进行测试用户注册接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/register.action");

        request
                .param("username", "tom")
                .param("password", "123456")
                .param("email", "test@163.com")
                .param("qq", "691342897")
                .param("nickname", "汤姆布鲁斯")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试用户注册接口完毕！");
    }

    /**
     * 测试用户信息更新接口
     * @throws Exception
     */
    @Test
    public void testUserInfoUpdate() throws Exception {
        System.out.println("开始进行测试用户信息更新接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/userinfoupdate.action");
        //在此处设置注册的信息
        request
                .param("avatar", "avatar")
                .param("email", "test@163.com")
                .param("qq", "691342897")
                .param("nickname", "汤姆布鲁斯")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试用户信息更新接口完毕！");
    }

    /**
     * 测试获取用户信息
     * @throws Exception
     */
    @Test
    public void testGetUserInfo() throws Exception {
        System.out.println("开始进行测试获取用户信息接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/getuserinfo.action");
        request.param("user","tom");//设置要获取用户的名称

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();
        System.out.println("测试响应结果："+content);
        System.out.println("测试获取用户信息接口完毕！");
    }
}
