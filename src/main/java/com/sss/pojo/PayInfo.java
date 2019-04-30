package com.sss.pojo;

import java.util.Date;

public class PayInfo {
    private Integer id;

    private Integer uid;

    private Long odno;

    private String payno;

    private String paystate;

    private Date modified;

    private Date updatatime;

    public PayInfo(Integer id, Integer uid, Long odno, String payno, String paystate, Date modified, Date updatatime) {
        this.id = id;
        this.uid = uid;
        this.odno = odno;
        this.payno = payno;
        this.paystate = paystate;
        this.modified = modified;
        this.updatatime = updatatime;
    }

    public PayInfo() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Long getOdno() {
        return odno;
    }

    public void setOdno(Long odno) {
        this.odno = odno;
    }

    public String getPayno() {
        return payno;
    }

    public void setPayno(String payno) {
        this.payno = payno == null ? null : payno.trim();
    }

    public String getPaystate() {
        return paystate;
    }

    public void setPaystate(String paystate) {
        this.paystate = paystate == null ? null : paystate.trim();
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public Date getUpdatatime() {
        return updatatime;
    }

    public void setUpdatatime(Date updatatime) {
        this.updatatime = updatatime;
    }
}