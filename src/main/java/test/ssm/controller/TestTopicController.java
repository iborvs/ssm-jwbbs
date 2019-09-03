package test.ssm.controller;

import com.uj.ssm.controller.CommController;
import com.uj.ssm.controller.TopicController;
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
public class TestTopicController {

    @Resource
    private TopicController topicController;
    private MockMvc mockmvc;

    //构建MockMvc实例
    @Before
    public void init(){
        mockmvc = MockMvcBuilders.standaloneSetup(topicController).build();
    }

    /**
     * 测试创建话题接口
     * @throws Exception
     */
    @Test
    public void testTopicCreate() throws Exception{
        System.out.println("开始进行测试创建话题接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/TopicCreate.action");
        //给请求添加参数,设置话题信息
        //        String topicname = request.getParameter("topicname");
        //        String owner = request.getParameter("owner");
        //        String content = request.getParameter("content");
        request
                .param("topicname", "论香港问题....")
                .param("owner", "test123")
                .param("content", "测试评论内容")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试创建话题接口完毕！");
    }

    /**
     * 测试阅读话题接口
     * @throws Exception
     */
    @Test
    public void testTopicRead() throws Exception{
        System.out.println("开始进行测试话题阅读接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/TopicRead.action");

        request
                .param("topicid", "2")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试话题阅读接口完毕！");
    }

    /**
     * 测试设置所有话题数据已读
     * @throws Exception
     */
    @Test
    public void testTopicReadAll() throws Exception{
        System.out.println("开始进行测试测试设置所有话题数据已读接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/TopicReadAll.action");

        request
                .param("owner", "test123")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试测试设置所有话题数据已读接口完毕！");
    }

    /**
     * 测试获取话题名称
     * @throws Exception
     */
    @Test
    public void testTopicGetName() throws Exception{
        System.out.println("开始进行测试获取话题名称接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/TopicGetName.action");

        request
                .param("topicid", "2")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试获取话题名称接口完毕！");
    }

    /**
     * 测试删除话题数据
     * @throws Exception
     */
    @Test
    public void testTopicDelete() throws Exception{
        System.out.println("开始进行测试删除话题接口...");

        MockHttpServletRequestBuilder request = MockMvcRequestBuilders.post("http://localhost:8081/TopicDelete.action");

        request
                .param("topicid", "2")
        ;

        MvcResult result = mockmvc.perform(request).andReturn();

        String content = result.getResponse().getContentAsString();

        System.out.println("测试响应结果："+content);
        System.out.println("测试获删除话题接口完毕！");
    }

}
