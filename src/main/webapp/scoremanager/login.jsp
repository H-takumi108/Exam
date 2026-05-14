<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<style>
.login-box {
    width: 760px;
    margin: 60px auto 35px;
    border: 1px solid #d9d9d9;
    background: #fff;
}

.login-title {
    background: #eee;
    text-align: center;
    font-weight: bold;
    padding: 15px;
    font-size: 30px;
}

.login-box form {
    padding: 15px 45px 10px;
}

.input-group {
    position: relative;
    margin-bottom: 12px;
}

.input-label {
    position: absolute;
    top: 5px;
    left: 10px;
    font-size: 18px;
    color: #666;
}

.login-box input[type="text"],
.login-box input[type="password"] {
    width: 99%;
    display: block;
    padding: 24px 12px;
    box-sizing: border-box;
    border: none;
    border-radius: 6px;
    background-color: #e9f7ff;
}

.login-error {
    color: #000;
    font-size: 14px;
    margin-bottom: 10px;
    text-align: center;
    white-space: nowrap;
}

.checkbox-area {
    text-align: center;
    margin: 5px 0 15px;
    font-size: 20px;
}

.login-box input[type="submit"] {
    display: block;
    margin: 0 auto 20px;
    padding: 14px 65px;
    background-color: #0d6efd;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    font-weight: bold;
    position: relative;
    top: 25px;
}
</style>
<header class="bg-white shadow-sm py-4 mb-4">
       <div class="header-box d-flex justify-content-between align-items-center">
        <h1 class="page-title m-0">得点管理システム</h1>
        </div>
</header>

<div class="login-box">

    <div class="login-title">ログイン</div>

    <form action="<c:url value='/scoremanager/LoginExecute.action' />" method="post">

        <c:if test="${not empty msg}">
            <p class="login-error">${msg}</p>
        </c:if>

        <div class="input-group">
            <span class="input-label">ID</span>
            <input type="text" name="id" value="${param.id}" required>
        </div>

        <div class="input-group">
            <span class="input-label">パスワード</span>
            <input type="password" name="password" id="password" required>
        </div>

        <p class="checkbox-area">
            <input type="checkbox" id="showPass"> パスワードを表示
        </p>

        <p><input type="submit" value="ログイン"></p>

    </form>
</div>

<footer class="text-center py-3 mt-5" style="background-color:#e9ecef; width:100%;">
    © 2023 TIC<br>
    大原学園
</footer>
<script>
document.getElementById("showPass").addEventListener("change", function() {
    const pass = document.getElementById("password");
    pass.type = this.checked ? "text" : "password";
});
</script>