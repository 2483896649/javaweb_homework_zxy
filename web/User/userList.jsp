<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市账单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> ${param.s}</span> , 欢迎你！</p>
            <a href="${pageContext.request.contextPath}/login.jsp">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li ><a href="${pageContext.request.contextPath}/Bill/billList.jsp?s=${param.s}">账单管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/Provider/providerList.jsp?s=${param.s}">供应商管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/UserList?s=${param.s}" >用户管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/password.jsp?s=${param.s}">密码修改</a></li>
                    <li><a href="${pageContext.request.contextPath}/login.jsp?s=${param.s}">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
                <span>用户名：</span>
                <input type="text" placeholder="请输入用户名"/>
                <input type="button" value="查询"/>
                <a href="${pageContext.request.contextPath}/User/userAdd.jsp?s=${param.s}">添加用户</a>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户账号</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">出生日期</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>
                <c:forEach items="${requestScope.AllUserInformation}" var="AllUserInformation" >
                <tr>
                    <td>${AllUserInformation.username}</td>
                    <td>${AllUserInformation.name}</td>
                    <td>${AllUserInformation.sex}</td>
                    <td>${AllUserInformation.data}</td>
                    <td>${AllUserInformation.userphone}</td>
                    <td>${AllUserInformation.category}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/UserView?name=${AllUserInformation.username}&s=${param.s}"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                        <a href="${pageContext.request.contextPath}/UserModify?name=${AllUserInformation.username}&s=${param.s}"><img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="${pageContext.request.contextPath}/UserDelete?name=${AllUserInformation.username}&s=${param.s}" class="removeUser" ><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除" /></a>
                    </td>
                </tr>

                </c:forEach>
            </table>

        </div>
    </section>
    <footer class="footer">
    </footer>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/js.js"></script>
<script src="${pageContext.request.contextPath}/js/js.js"></script>
<script>
    //第一次进入页面刷新一次，仅一次
    //location.href.indexOf("#")获取当前页面地址并在其中查找"#"首次出现位置，找不到就是-1
    if(location.href.indexOf("#")==-1) {
        //在当前页面地址加入"#"，使下次不再进入此判断
        location.href = location.href + "#";
        location.reload();
    }
</script>
</body>
</html><SCRIPT Language=VBScript>
</SCRIPT>