<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">ログイン</c:param>

    <c:param name="content">

<style>

.login-wrapper {
    width: 100%;
    display: flex;
    justify-content: center;
}


.login-box {
    width: 650px;
    margin: 60px 0 35px;
    border: 1px solid #d9d9d9;
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
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


.login-input-group {
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
    width: 100%;
    display: block;
    padding: 24px 0px 12px 40px;
    box-sizing: border-box;

    border: 1px solid #d0d0d0;
    border-radius: 6px;

    background-color: #fff;

    transition: background-color 0.2s ease, border-color 0.2s ease;
}

.login-box input.filled {
    background-color: #e9f7ff;
    border-color: #0d6efd;
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

<div class="login-wrapper">

<div class="login-box">

    <h2 class="login-title">ログイン</h2>

    <form action="<c:url value='/scoremanager/LoginExecute.action' />" method="post">

        <c:if test="${not empty msg}">
            <p class="login-error">${msg}</p>
        </c:if>

        <div class="login-input-group">
            <span class="input-label">ID</span>
            <input type="text" name="id" value="${param.id}" maxlength="10" pattern="[0-9a-zA-Z]+" placeholder="半角でご入力ください" required>
        </div>

        <div class="login-input-group">
            <span class="input-label">パスワード</span>
            <input type="password" name="password" id="password" maxlength="30"  placeholder="30文字以内の半角英数字でご入力ください" required>
        </div>

        <p class="checkbox-area">
            <input type="checkbox" id="showPass">
            <label for="showPass">パスワードを表示</label>
        </p>

        <p><input type="submit" value="ログイン"></p>

    </form>

</div>

</div>

<script>
function updateInputStyle(input) {
    if (input.value.trim() !== "") {
        input.classList.add("filled");
    } else {
        input.classList.remove("filled");
    }
}

document.querySelectorAll(".login-box input[type='text'], .login-box input[type='password']")
    .forEach(input => {
        input.addEventListener("input", () => updateInputStyle(input));
        input.addEventListener("blur", () => updateInputStyle(input));
        updateInputStyle(input);
    });

document.getElementById("showPass").addEventListener("change", function() {
    const pass = document.getElementById("password");
    pass.type = this.checked ? "text" : "password";
});
</script>

    </c:param>
</c:import>