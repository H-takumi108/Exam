<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<style>
body {
    margin: 0;
    background-color: #ffffff;
}

/* ヘッダー */
.header {
    background-color: #cfe2f3;
    padding: 20px;
    font-size: 26px;
    font-weight: bold;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* タイトル（左） */
.title {
    margin-left: 10px;
}

/* ユーザー（右） */
.user-area {
    font-size: 14px;
    margin-right: 10px;
}

/* メイン */
.main {
    min-height: calc(100vh - 140px);
}

.no-footer-fix {
    min-height: auto !important;
}

/* フッター */
.footer {
    background-color: #eeeeee;
    text-align: center;
    padding: 20px 0;
    font-size: 13px;
    color: #666;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
</style>

</head>

<body>

<!-- ヘッダー -->
<div class="header">
    <div class="title">得点管理システム</div>

    <c:if test="${not empty sessionScope.user}">
        <div class="user-area">
            ${sessionScope.user.name} 様　
            <a href="Logout.action">ログアウト</a>
        </div>
    </c:if>
</div>

<!-- メイン -->
<div class="main ${param.layoutClass}">
    <c:if test="${not empty param.content}">
        <jsp:include page="${param.content}" />
    </c:if>
</div>

<!-- フッター -->
<div class="footer">
    <span>© 2023 TIC</span>
    <span>大原学園</span>
</div>

</body>
</html>