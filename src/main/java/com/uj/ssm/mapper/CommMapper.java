package com.uj.ssm.mapper;



import java.util.List;
import com.uj.ssm.pojo.Comm;

public interface CommMapper {
    int CommCreate(Comm comm);
    List<Comm>CommRead(int topicid);
    List<Comm>GetTenComm(String owner);
    int CommDelete(int commentid);
}
