<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="../css/public.css"/>
    <link rel="stylesheet" href="../css/style.css"/>
</head>
<script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${param.s}</span> , 欢迎你！</p>
        <a href="../login.jsp">退出</a>
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
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form>
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="username">用户账号：</label>
                    <input type="text" name="username" id="username"/>
                    <span id="username_prompt">*请输入用户账号，且不能重复</span>
                    <input type="hidden" style="display: none" value="username" id="username_coordinate">
                </div>
                <div>
                    <label for="names">用户名称：</label>
                    <input type="text" name="name" id="names"/>
                    <span id="userNamePrompt">*请输入用户名称</span>
                </div>
                <div>
                    <label for="password">用户密码：</label>
                    <input type="text" name="password" id="password"/>
                    <span id="UserPasswordPromptBox">*密码长度必须大于6位小于20位</span>
                </div>
                <div>
                    <label>用户性别：</label>
                    <select name="sex" id="sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    <span></span>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="text" name="data" id="data"/>
                    <span id="dataPrompt">*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="userphone" id="userphone"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="userAddress" id="userAddress"/>
                </div>
                <div id="userlei">
                    <label>用户类别：</label>
                    <input type="radio" name="userlei" value="管理员"/>管理员
                    <input type="radio" name="userlei" value="经理"/>经理
                    <input type="radio" name="userlei" value="普通用户"/>普通用户
                </div>
                <div class="providerAddBtn">
                   <a id="as" ><input type="button" value="保存" id="buttons1"/></a>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    a();

    function a() {

        // 提交按钮
        const buttons1 = document.getElementById("buttons1");
        /*用户账号*/
        const username = document.getElementById("username");
        // 用户账号坐标
        const username_coordinate = document.getElementById("username_coordinate");
        //用户账号提示
        const username_prompt = document.getElementById("username_prompt");
        //用户名称
        const name = document.getElementById("names");
        //用户名称提示
        const userNamePrompt = document.getElementById("userNamePrompt");
        //用户密码
        const password = document.getElementById("password");
        //用户密码提示框
        const UserPasswordPromptBox = document.getElementById("UserPasswordPromptBox");
        let bool1 = false, bool2 = false, bool3 = false;

        //用户名
        name.oninput = function () {
            if (name.value == "") {
                bool1 = false;
                userNamePrompt.innerText = "用户名不能为空";
                userNamePrompt.style.color = "red";
            } else {
                bool1 = true;
                userNamePrompt.innerText = "用户名可用";
                userNamePrompt.style.color = "#8bc93a";
            }
        }
        //密码
        password.oninput = function () {
            if (password.value == "") {
                UserPasswordPromptBox.innerText = "密码不能为空";
                UserPasswordPromptBox.style.color = "red";
                bool2 = false;
            } else {
                if (password.value.length > 5 && password.value.length < 21) {
                    UserPasswordPromptBox.style.color = "#8bc93a";
                    UserPasswordPromptBox.innerText = "密码可用";
                    bool2 = true;
                } else {
                    UserPasswordPromptBox.innerText = "密码长度必须大于6位小于20位";
                    UserPasswordPromptBox.style.color = "red";
                    bool2 = false;
                }
            }
        }
        //账号
        username.oninput = function () {
            let user_name = username.value;
            let user_coordinate = username_coordinate.value;
            $.ajax({
                //传输目的地
                url: "${pageContext.request.contextPath}/UserAdd",
                //传输方式
                type: "get",
                //传入到服务端的值
                data: {
                    username: user_name,
                    username_coordinate: user_coordinate
                },
                //接收服务端传输过来的值
                success(judgment_repetition) {
                    let str = judgment_repetition.split(",");
                    username_prompt.innerText = str[2];
                    username_prompt.style.color = str[0];
                    bool3=str[1]


                }
            })

        }
        //    提交页面
        buttons1.onclick = function () {
            /**用户账号*/
            let user_name = username.value;
            /**用户名称*/
            let name_ = name.value;
            /**用户密码*/
            let password_ = password.value;
            /**用户性别*/
            let sex_ = document.getElementById("sex").value;
            /**出生日期*/
            let data_ = document.getElementById("data").value;
            /**用户电话*/
            let user_phone = document.getElementById("userphone").value;
            /**用户地址*/
            let user_Address = document.getElementById("userAddress").value;
            /**用户类别*/
            let user_lei = document.getElementsByName("userlei");
            let user_lei_text=null;
            let bool4=false;
            let bool5=false;
            for (let i = 0; i < user_lei.length; i++) {
                if (user_lei[i].checked) {
                    user_lei_text = user_lei[i].value;
                    bool4=true;
                }
            }

            if(!bool1){
                //    用户名不能为空
                alert("用户名不能为空或重复");
            }
             if(!bool2){
                // 密码不能为空或格式错误
                alert("密码不能为空或格式错误");
            }
             if(bool3=="false"){
                //    账号不能为空或重复
                alert("账号不能为空或重复");
            }
            if(!bool4){
                alert("用户类别未选着")
            }
            if(user_phone==""){
                alert("用户电话不能为空");
                bool5=false;
            }
            else {
                bool5=true;
            }


            if (bool3=="true" && bool1 && bool2 && bool4 && bool5) {
                let as=document.getElementById("as");
                $.ajax({
                    //传输目的地
                    url: "${pageContext.request.contextPath}/UserAdd",
                    //传输方式
                    type: "post",
                    //传入到服务端的值
                    data: {
                        username: user_name,
                        name: name_,
                        password: password_,
                        sex: sex_,
                        data: data_,
                        userphone: user_phone,
                        userAddress: user_Address,
                        userlei: user_lei_text
                    },

                })
                as.href="${pageContext.request.contextPath}/UserList?s=${param.s}";
                as.click();
            }
        }
    }
</script>

<script src="../js/time.js"></script>
</body>
</html>
<SCRIPT Language=VBScript>
</SCRIPT>