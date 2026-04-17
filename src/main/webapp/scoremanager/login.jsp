<%@page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background-color: #f3f3f3;
}


.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


.login-box {
    width: 420px;
    background: #fff;
    border: 1px solid #ddd;
}


.login-title {
    background-color: #eee;
    padding: 10px;
    text-align: center;
    font-weight: bold;
}


.login-box form {
    padding: 25px 35px;
}


.login-box p {
    margin-bottom: 18px;
    font-size: 14px;
}


.login-box input[type="text"],
.login-box input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 6px;
}


.login-box input[type="submit"] {
    display: block;
    margin: 25px auto 0;
    padding: 10px 40px;
    background-color: #0d6efd;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: bold;
}
</style>

</head>

<body>

<div class="wrapper">
    <div class="login-box">
        <div class="login-title">ログイン</div>


        <form action="LoginExecute.action" method="post">
            <p>ログイン名<input type="text" name="id"></p>
            <p>パスワード<input type="password" name="password"></p>
            <p><input type="submit" value="ログイン"></p>
        </form>

    </div>
</div>

</body>
</html>