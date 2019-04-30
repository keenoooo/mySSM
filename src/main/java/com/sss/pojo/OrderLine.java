package com.sss.pojo;

public class OrderLine {
    private Integer id;

    private Long odno;

    private Integer sid;

    private String sname;

    private String img;

    private Integer quantity;

    private Integer totalPrice;

    private Integer uid;

    public OrderLine(Integer id, Long odno, Integer sid, String sname, String img, Integer quantity, Integer totalPrice, Integer uid) {
        this.id = id;
        this.odno = odno;
        this.sid = sid;
        this.sname = sname;
        this.img = img;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.uid = uid;
    }

    public OrderLine() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getOdno() {
        return odno;
    }

    public void setOdno(Long odno) {
        this.odno = odno;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}