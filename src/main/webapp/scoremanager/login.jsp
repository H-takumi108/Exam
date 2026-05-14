<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

<script>
document.getElementById("showPass").addEventListener("change", function() {
    const pass = document.getElementById("password");
    pass.type = this.checked ? "text" : "password";
});
</script>