package com.zw.bean;

public class Enterprise {
    //自增id
    private Integer id;
    //公司名
    private String name;
    //注册时间
    private String time;
    //地址
    private String address;
    //报警次数
    private Integer number;

    //构造方法
    public Enterprise(){}
    public Enterprise(Integer id,String name,String time,String address,Integer number){
        this.id=id;
        this.name=name;
        this.time=time;
        this.address=address;
        this.number=number;
    }
    @Override
    public String toString() {
        return "Enterprise{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", time='" + time + '\'' +
                ", address='" + address + '\'' +
                ", number=" + number +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}