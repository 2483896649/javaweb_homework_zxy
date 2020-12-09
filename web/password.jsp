<!--
* @Author: your name
* @Date: 2020-12-04 17:13:06
* @LastEditTime: 2020-12-05 21:55:23
* @LastEditors: your name
* @Description: In User Settings Edit
* @FilePath: \1961179张星宇\web\password.jsp
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${param.s}</span> , 欢迎你！</p>
        <a href="login.jsp">退出</a>
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
            <span>密码修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/UserChangePassword" method="post" id="from1">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="accountNumber">账号：</label>
                    <input type="text" name="accountNumber" id="accountNumber" />
                    <span>*请输入账号</span>
                </div>
                <div>
                    <label for="newPassword">原密码：</label>
                    <input type="password" name="newPassword" id="newPassword" />
                    <span id="p1">*请输入原密码</span>
                </div>
                <div>
                    <label for="reNewPassword">新密码：</label>
                    <input type="password" name="reNewPassword" id="reNewPassword" />
                    <span id="p2">*请输入新密码</span>
                </div>
                <input type="hidden" name="s" value="${param.s}" style="display: none">
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <input type="button" value="保存"  id="b1"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>
<script>
    var passwords=null;
    let accountNumber = document.getElementById("accountNumber");
    let newPassword = document.getElementById("newPassword");
    let reNewPassword=document.getElementById("reNewPassword");
    let b1=document.getElementById("b1");
    var bool=false,bool1 = false;
    accountNumber.oninput = function () {
        let user_name = accountNumber.value;
        $.ajax({
            //传输目的地
            url: "${pageContext.request.contextPath}/UserChangePassword",
            //传输方式
            type: "get",
            //传入到服务端的值
            data: {
                username: user_name,
            },
            //接收服务端传输过来的值
            success(password) {
                passwords=password;
            }
        })
    }
    newPassword.oninput=function (){
        let p1=document.getElementById("p1");
        if(passwords!=newPassword.value){
            p1.innerText="原密码错误！";
            p1.style.color="red";
        }else {
            p1.innerText="原密码正确！";
            p1.style.color="#8bc93a";
            bool=true;
        }
    }
    reNewPassword.oninput=function () {
        let p2=document.getElementById("p2");
        if (reNewPassword.value == "") {
            p2.innerText = "新密码不能为空";
            p2.style.color = "red";
            bool1 = false;
        } else {
            if (reNewPassword.value.length > 5 && reNewPassword.value.length < 21) {
                p2.style.color = "#8bc93a";
                p2.innerText = "新密码可用";
                bool1 = true;
            } else {
                p2.innerText = "新密码长度必须大于6位小于20位";
                p2.style.color = "red";
                bool1 = false;
            }
        }
    }
    b1.onclick=function (){
        if(!bool1){
            // 密码不能为空或格式错误
            alert("密码不能为空或格式错误");
        }
        if(!bool){
            //    账号不能为空或重复
            alert("账号不能为空");
        }
        if(bool1&&bool){
            let  from1=document.getElementById("from1");
            from1.submit();
        }
    }

</script>
</body>
</html>
<SCRIPT Language=VBScript>
</SCRIPT>