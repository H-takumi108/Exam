<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
.login-box {
    width: 520px;
    margin: 20px auto 20px;
    border: 1px solid #ccc;
    border-radius: 0;
    overflow: hidden;
}

.login-title {
    background: #eee;
    text-align: center;
    font-weight: bold;
    padding: 12px;
    font-size: 18px;
}

.login-box form {
    background: #fff;
    padding: 20px 30px;
    border-radius: 8px;
}

.input-group {
    position: relative;
    margin-bottom: 10px;
}

.input-label {
    position: absolute;
    top: 5px;
    left: 10px;
    font-size: 11px;
    color: #666;
}

.login-box input[type="text"],
.login-box input[type="password"] {
    width: 97%;
    margin: 0 auto;
    display: block;
    padding: 14px 12px;
    box-sizing: border-box;
    border: none;
    border-radius: 6px;
    background-color: #d9ecf7;
}

.checkbox-area {
    text-align: center;
}

.login-box input[type="submit"] {
    display: block;
    margin: 10px auto 5px;
    padding: 8px 35px;
    background-color: #0d6efd;
    color: white;
    border: none;
    border-radius: 6px;
}

.login-error {
    color: #000;
    font-size: 14px;
    margin-bottom: 10px;
    text-align: center;
    white-space: nowrap;
}
</style>

<div class="login-box">
    <div class="login-title">ログイン</div>

    <form action="<c:url value='/scoremanager/Login.action' />" method="post">

        <c:if test="${not empty msg}">
            <p class="login-error">
                ${msg}
            </p>
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

        <p>
            <input type="submit" value="ログイン">
        </p>

    </form>
</div>

<script>
document.getElementById("showPass").addEventListener("change", function() {
    const pass = document.getElementById("password");
    pass.type = this.checked ? "text" : "password";
});
</script>