<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン</title>

<style>
body {
    background-color: #fff;
}

/* 外枠（角なし・横長） */
.login-box {
    width: 520px;
    margin: 80px auto;
    border: 1px solid #ccc;
    border-radius: 0;
    overflow: hidden;
}

/* 上（グレー） */
.login-title {
    background: #eee;
    text-align: center;
    font-weight: bold;
    padding: 12px;
    font-size: 18px;
}

/* 下（白・内側丸角） */
.login-box form {
    background: #fff;
    padding: 20px 30px;
    border-radius: 8px;
}

/* 入力グループ */
.input-group {
    position: relative;
    margin-bottom: 15px;
}

/* ラベル（入力欄の中 左上） */
.input-label {
    position: absolute;
    top: 5px;
    left: 10px;
    font-size: 11px;
    color: #666;
    pointer-events: none;
}

/* 入力欄（薄い水色） */
.login-box input[type="text"],
.login-box input[type="password"] {
    width: 100%;
    padding: 16px 10px 6px;
    border: none;
    border-radius: 6px;
    background-color: #e6edfa; /* ←薄め水色 */
    box-sizing: border-box;
}

/* チェックボックス中央 */
.checkbox-area {
    text-align: center;
    margin-top: 5px;
}

/* ボタン */
.login-box input[type="submit"] {
    display: block;
    margin: 15px auto 0;
    padding: 8px 35px;
    background-color: #0d6efd;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: bold;
}

/* エラー */
.error {
    color: red;
    text-align: center;
    margin-bottom: 8px;
    font-size: 13px;
}
</style>

</head>

<body>

<div class="login-box">
    <div class="login-title">ログイン</div>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="LoginExecute.action" method="post">

        <div class="input-group">
            <span class="input-label">ID</span>
            <input type="text" name="id" value="${param.id}">
        </div>

        <div class="input-group">
            <span class="input-label">パスワード</span>
            <input type="password" name="password" id="password">
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

</body>
</html>