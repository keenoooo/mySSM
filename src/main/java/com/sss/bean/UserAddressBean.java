package com.sss.bean;

import java.io.Serializable;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.bean
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/1/17 17:21
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/1/17    pc           v1.0.0               修改原因
 */
public class UserAddressBean implements Serializable {
    private int id;
    private int uid;
    private String reciver;
    private String phone;
    private String address;
    private int display;

    public UserAddressBean() {
    }

    public UserAddressBean(String reciver, String phone, String address) {
        this.reciver = reciver;
        this.phone = phone;
        this.address = address;
    }

    public UserAddressBean(int id ,String reciver, String phone, String address) {
        this.id = id;
        this.reciver = reciver;
        this.phone = phone;
        this.address = address;
    }

    public int getUid() { return uid; }

    public void setUid(int uid) { this.uid = uid; }

    public int getDisplay() { return display; }

    public void setDisplay(int display) { this.display = display; }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getReciver() {
        return reciver;
    }

    public void setReciver(String reciver) {
        this.reciver = reciver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
