package com.QueryDatabase;

import com.DatabaseConnectionConfiguration.DatabaseLink;
import com.User.zUser;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 运行mysql的增删改查
 */
public class Run implements RunInterface {
    Connection con = null;
    Statement stm = null;
    ResultSet rs = null;
    DatabaseLink databaseLink = new DatabaseLink();
    /*查询等结果*/
    int outcome;

    /**
     * 添加
     */
    @Override
    public boolean AddTo(zUser User) {
        boolean bool = false;
        //2.得到连接(访问数据库地址    用户名  密码）
        try {
            con = databaseLink.getConnection();
            //3.获取执行对象
            stm = con.createStatement();
            //4.准备sql语句
            String sql = "INSERT INTO zuser(username,name,password,sex,data,phone,address,category) " +
                    "VALUES ('" + User.getUsername() + "', '" +
                    User.getName() + "', '" +
                    User.getPassword() + "', '" +
                    User.getSex() + "', '" +
                    User.getData() + "', '" +
                    User.getUserphone() + "', '" +
                    User.getUserAddress() + "', '" +
                    User.getCategory() + "')";
            //5.调用查询的方法
            outcome = stm.executeUpdate(sql);
            bool = outcome == 1 ? true : false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DatabaseLink.CloseTheConnection(stm, con, rs);
        }
        return bool;
    }


    /**
     * 删除
     */
    @Override
    public boolean Delete(String username) {
        boolean bool = false;
        //2.得到连接(访问数据库地址    用户名  密码）
        try {
            con = databaseLink.getConnection();
            //3.获取执行对象
            stm = con.createStatement();
            //4.准备sql语句
            String sql = "DELETE FROM  zuser where username= '" + username + "'";
//            DELETE FROM <表名> [WHERE 子句] [ORDER BY 子句] [LIMIT 子句]
            //5.调用查询的方法
            outcome = stm.executeUpdate(sql);
            bool = outcome == 1 ? true : false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DatabaseLink.CloseTheConnection(stm, con, rs);
        }
        return bool;
    }

    /**
     * 修改
     */
    @Override
    public int Modify(zUser User) {
        //2.得到连接(访问数据库地址    用户名  密码）
        try {
            con = databaseLink.getConnection();
            //3.获取执行对象
            stm = con.createStatement();
            //4.准备sql语句
            String sql = "UPDATE zuser  set password='" +User.getPassword() +
                    "'WHERE username='"+User.getUsername()+"'";
            //5.调用查询的方法
            outcome = stm.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DatabaseLink.CloseTheConnection(stm, con, rs);
        }
        return 0;
    }

    /**
     * 查询所有
     */
    @Override
    public List<zUser> inquiry() {
        List<zUser> AllUserInformation = new ArrayList<>();
        //2.得到连接(访问数据库地址    用户名  密码）
        try {
            con = databaseLink.getConnection();
            //3.获取执行对象
            stm = con.createStatement();
            //4.准备sql语句
            String sql = "select * from zuser";
            //5.调用查询的方法
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                /**用户账号*/
                String username = rs.getString("username");
                /**用户名称*/
                String name = rs.getString("name");
                /**用户密码*/
                String password = rs.getString("password");
                /**用户性别*/
                String sex = rs.getString("sex");
                /**出生日期*/
                String data = rs.getString("data");
                /**用户电话*/
                int userphone = Integer.parseInt(rs.getString("phone"));
                /**用户地址*/
                String userAddress = rs.getString("address");
                /**用户类别*/
                String category = rs.getString("category");
                zUser user = new zUser(username, name, password, sex, data, userphone, userAddress, category);
                AllUserInformation.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DatabaseLink.CloseTheConnection(stm, con, rs);
        }
        return AllUserInformation;
    }

    /**
     * 查询单个（注册区使用）
     */
    @Override
    public boolean querySingle(String username, String username_coordinate) {
        String usernames = null;
        //2.得到连接(访问数据库地址    用户名  密码）
        try {
            con = databaseLink.getConnection();
            //3.获取执行对象
            stm = con.createStatement();
            //4.准备sql语句
            String sql = "select * from zuser where " + username_coordinate + "='" + username + "'";
            //5.调用查询的方法
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                usernames = rs.getString("username");
                System.out.println(usernames);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DatabaseLink.CloseTheConnection(stm, con, rs);
        }

        return username.equals(usernames) ? true : false;
    }

    /**
     * 查询单个（查询用户区使用）
     */
    @Override
    public zUser querySingle1(String username_coordinate) {

        /**用户账号*/
        String username = null;
        /**用户名称*/
        String name = null;
        /**用户密码*/
        String password = null;
        /**用户性别*/
        String sex = null;
        /**出生日期*/
        String data = null;
        /**用户电话*/
        int userphone = 0;
        /**用户地址*/
        String userAddress = null;
        /**用户类别*/
        String category = null;
        //2.得到连接(访问数据库地址    用户名  密码）
        try {
            con = databaseLink.getConnection();
            //3.获取执行对象
            stm = con.createStatement();
            //4.准备sql语句
            String sql = "select * from zuser where username='" + username_coordinate + "'";
            //5.调用查询的方法
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                /**用户账号*/
                username = rs.getString("username");
                /**用户名称*/
                name = rs.getString("name");
                /**用户密码*/
                password = rs.getString("password");
                /**用户性别*/
                sex = rs.getString("sex");
                /**出生日期*/
                data = rs.getString("data");
                /**用户电话*/
                userphone = Integer.parseInt(rs.getString("phone"));
                /**用户地址*/
                userAddress = rs.getString("address");
                /**用户类别*/
                category = rs.getString("category");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DatabaseLink.CloseTheConnection(stm, con, rs);
        }
        zUser user = new zUser(username, name, password, sex, data, userphone, userAddress, category);
        return user;
    }
}
