package com.web.Servlet;/**
 * @program:1961179张星宇
 * @author: 星子
 * @Time: 2020/12/7  10:02
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
 * @description: 修改(名称 性别 出生日期 用户电话 地址 类别 )
 **/
@WebServlet("/UserModify")
public class UserModify extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String username=req.getParameter("name");
        System.out.println(username);
        Run run=new Run();
        zUser user= run.querySingle1(username);
        String s=req.getParameter("s");
        req.setAttribute("s",s);
        req.setAttribute("user",user);
        req.getRequestDispatcher("User/userUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Run run=new Run();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        /**用户账号*/
        String username=req.getParameter("username");
        /**用户名称*/
        String name=req.getParameter("Name");
        /**用户密码*/
        zUser user1= run.querySingle1(username);
        String  password=user1.getPassword();
        /**用户性别*/
        String sex=req.getParameter("job");
        /**出生日期*/
        String data=req.getParameter("data");
        /**用户电话*/
        int userphone= Integer.parseInt(req.getParameter("userphone"));
        /**用户地址*/
        String userAddress=req.getParameter("userAddress");
        /**用户类别*/
        String category=req.getParameter("userlei");
//        先删除后添加，完成更新
//        删除：
        run.Delete(username);
//        添加：
        zUser user=new zUser(username,name,password,sex,data,userphone,userAddress,category);
        run.AddTo(user);





        List<zUser> AllUserInformation=run.inquiry();
        String s=req.getParameter("s");
        req.setAttribute("s",s);
        req.setAttribute("AllUserInformation", AllUserInformation);
        req.getRequestDispatcher("User/userList.jsp").forward(req, resp);

    }
}
