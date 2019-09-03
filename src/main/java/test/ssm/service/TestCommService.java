package test.ssm.service;

import com.uj.ssm.pojo.Comm;
import com.uj.ssm.service.CommService;
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
public class TestCommService {


    @Autowired
    private CommService commService;

    /**
     * 测试创建评论
     */
    @Test
    public void testCommCreate() {
        //构建要添加的评论信息
        Comm comm = new Comm();
        comm.setTopicid(2);
        comm.setContent("测试评论内容");
        comm.setOwner("tom");
        //调用CommService的创建评论方法
        int flag = commService.CommCreate(comm);
        if(flag > 0){
            System.out.println("评论成功！");
        }else{
            System.out.println("评论失败！");
        }
    }

    /**
     * 测试阅读评论内容
     */
    @Test
    public void testCommRead(){

        List<Comm> comms = commService.CommRead(2);
        for (int i = 0; i < comms.size(); i++) {
            System.out.println(comms.get(i).toString());
        }
    }

    /**
     * 测试获取对应人的所有评论信息
     */
    @Test
    public void testGetTenComm(){
        List<Comm> comms = commService.GetTenComm("test123");
        for (int i = 0; i < comms.size(); i++) {
            System.out.println(comms.get(i).toString());
        }
    }

    /**
     * 测试删除评论
     */
    @Test
    public void testCommDelete(){

        int flag = commService.CommDelete(2);
        if(flag > 0){
            System.out.println("删除成功！");
        }else{
            System.out.println("删除失败！");
        }
    }

    /**
     * 测试获取评论人
     */
    @Test
    public void testCommReadOwner(){
        String res = commService.CommReadOwner(2);
        if(res != null){
            System.out.println("获取成功："+res);
        }else{
            System.out.println("获取失败！");
        }
    }
}
