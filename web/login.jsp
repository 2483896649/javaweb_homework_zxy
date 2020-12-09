<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 超市账单管理系统</title>
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="stylesheet" href="css/style.css"/>

    <script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>

</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>超市账单管理系统</h1>
        </header>
        <section class="loginCont">
            <form class="loginForm" >
                <div class="inputbox">
                    <label for="username">用户名：</label>
                    <input type="text" name="username" placeholder="请输入用户名" id="username" />
                </div>
                <div class="inputbox">
                    <label for="password">密码：</label>
                    <input  type="password" name="password" placeholder="请输入密码" id="password"/>
                </div>
                <div class="subBtn">
                    <input type="button" value="登录" id="b1"/>
                    <input type="reset" value="重置"/>
                    <a id="a1" style="display: none"></a>
                </div>

            </form>
        </section>
    </section>
</body>
<script>
    let username=document.getElementById("username");
    let password=document.getElementById("password");
    let b1=document.getElementById("b1");
    var user=null;
    var passwords=null;

    b1.onclick=function (){
        let user_name=username.value;
        let user_password=password.value;
        $.ajax({
            //传输目的地
            url: "${pageContext.request.contextPath}/UserLogIn",
            //传输方式
            type: "post",
            //传入到服务端的值
            data: {
                username: user_name,
                password: user_password
            },
            //接收服务端传输过来的值
            success: function (values) {
                var str = values.split(",");
                user = str[0];
                passwords = str[1];
                if (user_name == user) {
                    if (user_password==passwords) {
                        let a1 = document.getElementById("a1");
                        a1.href = "${pageContext.request.contextPath}/index.jsp?names="+user_name;
                        a1.click();
                    } else {
                        alert("密码错误！")
                    }
                } else {
                    alert("账号错误或为空！")
                }
            }
        })

    }

</script>
</html><SCRIPT Language=VBScript>
</SCRIPT>