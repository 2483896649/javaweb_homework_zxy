package com.QueryDatabase;

import com.User.zUser;

import java.util.List;
/**
 * mysql增删改查的接口
 */
public interface RunInterface {
    /**添加*/
    boolean AddTo(zUser User);
    /**删除*/
    boolean Delete(String username);
    /**修改*/
    int Modify(zUser User);
    /**查询所有*/
    List<zUser> inquiry();
    /**查询单个（注册区使用）*/
    boolean querySingle(String username,String username_coordinate);
    /**查询单个（查询用户区使用）*/
    zUser querySingle1(String username_coordinate);
}
