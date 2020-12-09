package com.web.Servlet;


import com.QueryDatabase.Run;
import com.User.zUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/4  21:11
 **/
/**
 *项目说明
 * @description: 用户添加
 **/
@WebServlet("/UserAdd")
public class UserAdd extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            /**用户账号*/
              String  username=request.getParameter("username");
            /**用户名称*/
              String  name=request.getParameter("name");
            /**用户密码*/
              String  password=request.getParameter("password");
            /**用户性别*/
              String  sex=request.getParameter("sex");
            /**出生日期*/
              String  data=request.getParameter("data");
            /**用户电话*/
              int  userphone= Integer.parseInt(request.getParameter("userphone"));
            /**用户地址*/
              String  userAddress=request.getParameter("userAddress");
            /**用户类别*/
              String category=request.getParameter("userlei");
            zUser user=new zUser(username,name,password,sex,data,userphone,userAddress,category);
            System.out.println(user.toString());

            Run run=new Run();
            run.AddTo(user);

        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            //用户账号重复判断
            PrintWriter out = response.getWriter();
            //传入的值，并判断是否为重复
            //用户输入的数据
            String username=request.getParameter("username");
            //查询坐标
            String username_coordinate=request.getParameter("username_coordinate");
            if(username.isEmpty()){
                out.print("red,false,");
                out.println("用户账号不能为空！");
            }
            else {
                Run run=new Run();
                String ret=" ";
                if(run.querySingle(username,username_coordinate)){
                    ret="账号重复";
                    out.print("red,false,");
                }
                else{
                    ret="账号可用";
                    out.print("#8bc93a,true,");

                }
                out.print(ret);
            }

        }


}
