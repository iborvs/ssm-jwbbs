package com.uj.ssm.service;

import java.util.List;
import com.uj.ssm.pojo.Comm;

public interface CommService {
    public int CommCreate(Comm comm);
    public List<Comm> CommRead(int topicid);
    public Comm CommFind(int commentid);
    public List<Comm> GetTenComm(String owner);
    public int CommDelete(int commentid);
    public String CommReadOwner(int commentid);
    //public int TopicKeep();
}
