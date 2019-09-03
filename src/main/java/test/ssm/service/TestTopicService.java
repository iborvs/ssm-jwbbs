package test.ssm.service;

import com.uj.ssm.pojo.Topic;
import com.uj.ssm.service.TopicService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class TestTopicService {


    @Autowired
    private TopicService topicService;

    /**
     * 测试创建评论
     */
    @Test
    public void testTopicCreate() {

        Topic topic = new Topic();
        topic.setTopicid(2);
        topic.setTopicname("有关香港问题处理...");
        topic.setContent("测试content");
        topic.setComments(0);

        int flag = topicService.TopicCreate(topic);
        if (flag > 0) {
            System.out.println("创建成功！");
        } else {
            System.out.println("创建失败！");
        }
    }

    /**
     * 测试话题保留
     */
    @Test
    public void testTopicKeep() {
        Topic topic = new Topic();
        topic.setTopicid(2);
        int flag = topicService.TopicKeep(topic);
        if (flag > 0) {
            System.out.println("保留成功！");
        } else {
            System.out.println("保留失败！");
        }
    }

    /**
     * 测试设置topic状态为已读
     */
    @Test
    public void testTopicRead() {
        Topic topicParam = new Topic();
        topicParam.setTopicid(2);
        Topic topic = topicService.TopicRead(topicParam);
        if (topic != null) {
            System.out.println("阅读成功！");
        } else {
            System.out.println("没找到要阅读的数据！");
        }
    }

    /**
     * 设置所有topic状态为已读
     */
    @Test
    public void testTopicReadAll() {

        List<Topic> topics = topicService.TopicReadAll();
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
        }
    }

    /**
     * 测试获取话题名称
     */
    @Test
    public void testTopicGetName() {
        int topicid = 2;
        String name = topicService.TopicGetName(topicid);
        if (name != null) {
            System.out.println("获取成功：" + name);
        } else {
            System.out.println("获取失败，未找到id为" + topicid + "的数据");
        }
    }

    /**
     * 测试删除话题
     */
    @Test
    public void testTopicDelete() {

        int flag = topicService.TopicDelete(2);
        if (flag > 0) {
            System.out.println("删除成功！");
        } else {
            System.out.println("删除失败！");
        }
    }
}
