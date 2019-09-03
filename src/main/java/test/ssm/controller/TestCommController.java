package test.ssm.controller;

import com.uj.ssm.controller.CommController;
import com.uj.ssm.controller.UserController;
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
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class TestCommController {

    @Resource
    private CommController commController;
    private MockMvc mockmvc;

    //构建MockMvc实例
    @Before
    public void init(){
        mockmvc = MockMvcBuilders.standaloneSetup(commController).build();
    }

    /**
     * 测试创建建评论
     * @throws Exception
     */
    @Test
    public void testCommCreate() throws Exception{
        System.out.println("开始进行测试创建评论接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/CommCreate.action");

        request
                .param("topicid", "2")
                .param("owner", "tom")
                .param("content", "测试评论内容")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试创建评论接口完毕！");
    }

    /**
     * 测试评论阅读接口
     * @throws Exception
     */
    @Test
    public void testCommRead() throws Exception{
        System.out.println("开始进行测试评论阅读接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/CommRead.action");

        request
                .param("topicid", "2")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试评论阅读接口完毕！");
    }

    /**
     * 测试获取用户的评论信息
     * @throws Exception
     */
    @Test
    public void testGetTenComm() throws Exception{
        System.out.println("开始进行测试获取评论接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/GetTenComm.action");

        request
                .param("owner", "ibor")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试获取论接口完毕！");
    }

    /**
     * 测试删除用户评论信息
     * @throws Exception
     */
    @Test
    public void testCommDelete() throws Exception{
        System.out.println("开始进行测试删除评论接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/CommDelete.action");

        request
                .param("commentid", "2")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试删除论接口完毕！");
    }

}
