<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>

#main{
    width: 100%;
    max-width: 760px !important;
    margin-left: auto !important;
    margin-right: auto !important;
    margin-bottom: 0 !important;
    padding: 0 10px 0 10px !important;
    box-sizing: border-box;
}

.login-box {
    width: 100%;
    max-width: 485px;
    margin: 30px auto 0;
    border: 1px solid #d9d9d9;
    background: #fff;
    box-sizing: border-box;
}

.login-title {
    background: #eee;
    text-align: center;
    font-weight: bold;
    padding: 10px;
    font-size: 18px;
}

.login-box form {
    padding: 12px 30px 8px;
}

.input-group {
    position: relative;
    margin-bottom: 10px;
}

.input-label {
    position: absolute;
    top: 4px;
    left: 10px;
    font-size: 11px;
    color: #666;
}

.login-box input[type="text"],
.login-box input[type="password"] {
    width: 100%;
    display: block;
    padding: 18px 10px 6px;
    box-sizing: border-box;
    border: none;
    border-radius: 4px;
    background-color: #e9f7ff;
    font-size: 13px;
}

.auth-error {
    font-size: 12px;
    color: #000000;
    margin: 8px 0 10px;
    padding-left: 5px;
    text-align: left;
}

.checkbox-area {
    text-align: center;
    margin: 3px 0 10px;
    font-size: 12px;
}

.login-box input[type="submit"] {
    display: block;
    margin: 0 auto 10px;
    padding: 8px 35px;
    background-color: #0d6efd;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: bold;
}

header {
    padding-top: 0 !important;
    padding-bottom: 5px !important;
    margin-bottom: 10px !important;
}

.page-title {
    font-size: 28px !important;
}

.header-box {
    padding: 12px 25px !important;
}

footer {
    margin-top: 30px !important;
}

footer div {
    padding: 4.5px 0 !important;
    font-size: 12px;
}

body{
    overflow-x: hidden;
}

header > div,
footer > div{
    margin-left: auto !important;
    margin-right: auto !important;
}

</style>

<div class="login-box">

    <div class="login-title">
        ログイン
    </div>

    <form action="<c:url value='/scoremanager/LoginExecute.action' />"
          method="post">

        <c:if test="${not empty msg}">
            <div class="auth-error">
                ${msg}
            </div>
        </c:if>

        <!-- ID -->
        <div class="input-group">
            <span class="input-label">ID</span>
            <input type="text" name="id" value="${param.id}" required>
        </div>

        <!-- パスワード -->
        <div class="input-group">
            <span class="input-label">パスワード</span>
            <input type="password" name="password" id="password" required>
        </div>

        <!-- パスワード表示 -->
        <p class="checkbox-area">
            <input type="checkbox" id="showPass">
            パスワードを表示
        </p>

        <!-- ログインボタン -->
        <p>
            <input type="submit" value="ログイン">
        </p>

    </form>

</div>

<script>
document.getElementById("showPass")
.addEventListener("change", function () {
    const pass = document.getElementById("password");
    pass.type = this.checked ? "text" : "password";
});
</script>