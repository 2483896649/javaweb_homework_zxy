package com.web.Servlet;

/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/6  21:09
 **/

import com.QueryDatabase.Run;
import com.User.zUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *项目说明
 * @description: 查询所有用户信息
 **/
@WebServlet(name = "UserList",urlPatterns = "/UserList")
public class UserList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Run run=new Run();
        List<zUser> AllUserInformation=run.inquiry();
        String name=req.getParameter("name");
        req.setAttribute("AllUserInformation", AllUserInformation);
        req.setAttribute("name", name);
        req.getRequestDispatcher("User/userList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
