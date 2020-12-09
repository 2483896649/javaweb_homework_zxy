<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/UserModify" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="Name">用户名称：</label>
                    <input type="text" name="Name" id="Name" value="${requestScope.user.name}"/>
                    <span >*</span>
                </div>

                <div>
                    <label >用户性别：</label>

                    <select name="job">
                        <option value="男" id="op1">男</option>
                        <option value="女"  id="op2">女</option>
                    </select>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="text" name="data" id="data" value="${requestScope.user.data}"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="userphone" id="userphone" value="${requestScope.user.userphone}"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="userAddress" id="userAddress" value="${requestScope.user.userAddress}"/>
                </div>
                <div>
                    <label >用户类别：</label>
                    <input type="radio" name="userlei" value="管理员"/>管理员
                    <input type="radio" name="userlei" value="经理"/>经理
                    <input type="radio" name="userlei" value="普通用户"/>普通用户

                </div>
                <input type="hidden" name="username" value="${requestScope.user.username}" style="display: none">
                <input type="hidden" name="s" value="${param.s}" style="display: none">
                <div class="providerAddBtn">
                    <input type="submit" value="保存"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
<script>
document.getElementsByName("job")[0].value="${requestScope.user.sex}";
var userlei = document.getElementsByName("userlei");
for (var i=0; i<userlei.length; i++){
    if (userlei[i].value=="${requestScope.user.category}") {
        userlei[i].checked= true;
        break;
    }
}
</script>
</body>
</html><SCRIPT Language=VBScript>
</SCRIPT>