package com.DatabaseConnectionConfiguration;

import java.sql.*;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 * @program: 1961179张星宇
 * @description: 数据库连接
 * @author: 星子
 * @create: 2020-12-04 19:05
 **/
public class DatabaseLink {
    /**配置文件读取*/
    private static String driver;
    private static String url;
    private static String userName;
    private static String Password;
    static {
        ResourceBundle resourceBundle=ResourceBundle.getBundle("JDBC" ,new Locale("zh","CN"));
        driver=resourceBundle.getString("driver");
        url=resourceBundle.getString("url");
        userName=resourceBundle.getString("userName");
        Password=resourceBundle.getString("Password");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取连接
     * @return*/
    public static Connection getConnection() throws SQLException {
       return DriverManager.getConnection(url, userName, Password);
    }

    /**
     * 关闭连接
     * */
    public  static  void  CloseTheConnection(Statement statement, Connection connection, ResultSet resultSet){
        try {
            if(statement!=null){
                statement.close();
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }

        try {
            if(connection!=null){
                connection.close();
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }

        try {
            if(resultSet!=null){
                resultSet.close();
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

}
