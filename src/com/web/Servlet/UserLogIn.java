package com.web.Servlet;/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/7  12:34
 **/

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
 *项目说明
 * @description: 用户登录
 **/
@WebServlet("/UserLogIn")
public class UserLogIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Run run=new Run();
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

       String username=req.getParameter("username");
       String password=req.getParameter("password");
       zUser user=  run.querySingle1(username);

        out.print(user.getUsername()+","+user.getPassword());
        System.out.print(user.getPassword());

    }
}
