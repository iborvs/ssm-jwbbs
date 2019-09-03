package com.uj.ssm.service;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.uj.ssm.mapper.TopicMapper;
import com.uj.ssm.pojo.Comm;
import com.uj.ssm.mapper.CommMapper;
import com.uj.ssm.pojo.Topic;
@Service

public class CommServicelmpl implements CommService {
    @Autowired
    private CommMapper commMapper;
    public int CommCreate(Comm comm){
        comm.setContent(StringEscapeUtils.escapeHtml4(comm.getContent()));
        int state = commMapper.CommCreate(comm);
        return state;
    }
    public List<Comm> CommRead(int topicid){
        List<Comm>lst = commMapper.CommRead(topicid);
        return lst;
    }
    public Comm CommFind(int commentid){
        Comm lst = commMapper.CommFind(commentid);
        return lst;
    }
    public List<Comm> GetTenComm(String owner){
        List<Comm>lst = commMapper.GetTenComm(owner);
        return lst;
    }
    public int CommDelete(int commentid){
        int state = commMapper.CommDelete(commentid);
        return state;
    }
    public String CommReadOwner(int commentid){
        String owner = commMapper.CommReadOwner(commentid);
        return owner;
    }

    //private TopicMapper topicMapper;

}
