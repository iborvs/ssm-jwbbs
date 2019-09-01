package com.uj.ssm.mapper;


import java.util.List;
import com.uj.ssm.pojo.Topic;

public interface TopicMapper {
    public int TopicCreate(Topic topic);
    public int TopicKeep(Topic topic);
    public Topic TopicRead(Topic topic);
    public List<Topic> TopicReadAll();
    public List<Topic> TopicReadTen(Topic topic);
    public String TopicGetName(int topicid);
    public int TopicDelete(int topicid);
    public List<Topic>TopicSearch(Topic topic);
}
