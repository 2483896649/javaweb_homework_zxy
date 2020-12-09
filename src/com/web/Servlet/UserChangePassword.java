package com.web.Servlet;/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/7  11:07
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
import java.util.List;

/**
 *项目说明
 * @description: 修改密码
 **/
@WebServlet("/UserChangePassword")
public class UserChangePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
//        查询单个用户的密码
        String username=req.getParameter("username");
        Run run=new Run();
        zUser user= run.querySingle1(username);
//        用户密码
        String password=user.getPassword();
        out.print(password);




    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

//        username 账号
        String accountNumber=req.getParameter("accountNumber");
//        新密码
        String reNewPassword=req.getParameter("reNewPassword");

        zUser user=new zUser(accountNumber,reNewPassword);
        Run  run=new Run();
        run.Modify(user);





        List<zUser> AllUserInformation=run.inquiry();
        req.setAttribute("AllUserInformation", AllUserInformation);
        req.getRequestDispatcher("User/userList.jsp").forward(req, resp);
    }
}
