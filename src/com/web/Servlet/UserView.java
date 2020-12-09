package com.web.Servlet;/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/6  22:44
 **/

import com.QueryDatabase.Run;
import com.User.zUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *项目说明
 * @description: 查询单个用户
 **/
@WebServlet("/UserView")
public class UserView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String username=req.getParameter("name");
        String s=req.getParameter("s");

        Run run=new Run();
        zUser user= run.querySingle1(username);
        req.setAttribute("user",user);
        req.setAttribute("s",s);
        req.getRequestDispatcher("User/userView.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
