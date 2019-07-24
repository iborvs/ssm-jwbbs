package com.uj.ssm.mapper;


import java.util.List;
import com.uj.ssm.pojo.Topic;

public interface TopicMapper {
    int TopicCreate(Topic topic);
    public int TopicKeep(Topic topic);
}
