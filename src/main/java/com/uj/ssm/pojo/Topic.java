package com.uj.ssm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/*
Topic:
topicname owner starttime lasttime comments topicid
 */

public class Topic {
    private String topicname;
    private String owner;
    private String starttime;
    private String lasttime;
    private int comments;
    private int topicid;

    public String getTopicname() {
        return topicname;
    }

    public void setTopicname(String topicname) {
        this.topicname = topicname;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }

    public int getTopicid() {
        return topicid;
    }

    public void setTopicid(int topicid) {
        this.topicid = topicid;
    }

    public Topic(){
       //do nothing
    }
    /*
    Topicname owner starttime lasttime comments topicid
     */
    public Topic(String topicname, String owner, String starttime, String lasttime, int comments, int topicid){
        this.topicname =  topicname;
        this.owner = owner;
        this.starttime = starttime;
        this.lasttime = lasttime;
        this.comments = comments;
        this.topicid = topicid;
    }
    public Topic(String topicname, String owner, String starttime, String lasttime, int comments){
        this.topicname =  topicname;
        this.owner = owner;
        this.starttime = starttime;
        this.lasttime = lasttime;
        this.comments = comments;
    }
    public Topic(int topicid, String lasttime){
        this.topicid = topicid;
        this.lasttime = lasttime;
    }
    public Topic(int topicid){
        this.topicid = topicid;
    }
}
