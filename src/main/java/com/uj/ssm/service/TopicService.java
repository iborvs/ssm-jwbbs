package com.uj.ssm.service;

import java.util.List;
import com.uj.ssm.pojo.Topic;
public interface TopicService {
    public int TopicCreate(Topic topic);
    public int TopicKeep(Topic topic);
    public int TopicMinus(Topic topic);
    public Topic TopicRead(Topic topic);
    public List<Topic> TopicReadAll();
    public List<Topic> TopicReadTen(Topic topic);
    public String TopicGetName(int topicid);
    public int TopicDelete(int topicid);
    public List<Topic> TopicSearch(Topic topic);
}
