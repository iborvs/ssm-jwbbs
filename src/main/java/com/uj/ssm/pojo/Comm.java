package com.uj.ssm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/*
Topicid commentid owner lasttime content
 */
public class Comm {
    private int topicid;
    private int commentid;
    private String owner;
    private String lasttime;
    private String content;

    public int getTopicid() {
        return topicid;
    }

    public void setTopicid(int topicid) {
        this.topicid = topicid;
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public Comm(){

    }
    public Comm(int topicid, String owner, String lasttime, String content){
        this.topicid = topicid;
        this.owner = owner;
        this.lasttime = lasttime;
        this.content = content;
    }
}
