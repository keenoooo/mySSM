package com.sss.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class OrderInfomation {
    private Long id;

    private Integer uid;

    private String address;

    private String context;

    private Date modified;

    private BigDecimal payment;

    private Date paymentTime;

    private Integer paystate;

    private Date sendTime;

    private Date endTime;

    private Integer display;

    public OrderInfomation(Long id, Integer uid, String address, String context, Date modified, BigDecimal payment, Date paymentTime, Integer paystate, Date sendTime, Date endTime, Integer display) {
        this.id = id;
        this.uid = uid;
        this.address = address;
        this.context = context;
        this.modified = modified;
        this.payment = payment;
        this.paymentTime = paymentTime;
        this.paystate = paystate;
        this.sendTime = sendTime;
        this.endTime = endTime;
        this.display = display;
    }

    public OrderInfomation() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public BigDecimal getPayment() {
        return payment;
    }

    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Integer getPaystate() {
        return paystate;
    }

    public void setPaystate(Integer paystate) {
        this.paystate = paystate;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getDisplay() {
        return display;
    }

    public void setDisplay(Integer display) {
        this.display = display;
    }
}