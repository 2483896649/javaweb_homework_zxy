<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
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
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>用户账号：</strong><span>${requestScope.user.username}</span></p>
            <p><strong>用户名称：</strong><span>${requestScope.user.name}</span></p>
            <p><strong>用户性别：</strong><span>${requestScope.user.sex}</span></p>
            <p><strong>出生日期：</strong><span>${requestScope.user.data}</span></p>
            <p><strong>用户电话：</strong><span>${requestScope.user.userphone}</span></p>
            <p><strong>用户地址：</strong><span>${requestScope.user.userAddress}</span></p>
            <p><strong>用户类别：</strong><span>${requestScope.user.category}</span></p>
            <a href="${pageContext.request.contextPath}/UserList?s=${param.s}">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
</html><SCRIPT Language=VBScript>
</SCRIPT>