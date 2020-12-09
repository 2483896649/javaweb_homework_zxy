package com.User;

/**
 * @program: 1961179张星宇
 * @description: 用户字段
 * @author: 星子
 * @create: 2020-12-04 17:28
 **/
public class zUser {
    /**用户账号*/
    private  String  username;
    /**用户名称*/
    private  String  name;
    /**用户密码*/
    private  String  password;
    /**用户性别*/
    private  String  sex;
    /**出生日期*/
    private  String  data;
    /**用户电话*/
    private  int  userphone;
    /**用户地址*/
    private  String  userAddress;
    /**用户类别*/
    private  String category;

    @Override
    public String toString() {
        return "zUser{" +
                "username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", data='" + data + '\'' +
                ", userphone=" + userphone +
                ", userAddress='" + userAddress + '\'' +
                ", category='" + category + '\'' +
                '}';
    }

    public zUser(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public zUser(String name, String sex, String data, int userphone, String userAddress, String category) {
        this.name = name;
        this.sex = sex;
        this.data = data;
        this.userphone = userphone;
        this.userAddress = userAddress;
        this.category = category;
    }

    public zUser(String username, String name, String password, String sex, String data, int userphone, String userAddress, String category) {
        this.username = username;
        this.name = name;
        this.password = password;
        this.sex = sex;
        this.data = data;
        this.userphone = userphone;
        this.userAddress = userAddress;
        this.category = category;
    }

    public zUser() {
    }



    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getUserphone() {
        return userphone;
    }

    public void setUserphone(int userphone) {
        this.userphone = userphone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
}
