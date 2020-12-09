package com.web.Servlet;/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/7  8:42
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
 * @description: 删除用户
 **/
@WebServlet("/UserDelete")
public class UserDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String username=req.getParameter("name");
        Run run=new Run();
        run.Delete(username);

        List<zUser> AllUserInformation=run.inquiry();
        String s=req.getParameter("s");
        req.setAttribute("s",s);
        req.setAttribute("AllUserInformation", AllUserInformation);
        req.getRequestDispatcher("User/userList.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
