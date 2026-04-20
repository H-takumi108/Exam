<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
=======
    <meta charset="UTF-8">
>>>>>>> branch 'master' of https://github.com/H-takumi108/Exam

<style>
body {
    margin: 0;
    background-color: #ffffff;
}

<<<<<<< HEAD
/* ヘッダー */
.header {
    background-color: #cfe2f3;
    padding: 20px;
    font-size: 26px;
    font-weight: bold;
=======
	
    <style>
         .page-title {
             font-size: 2.2rem;
             font-weight: bold;
         }


        .header-box {
             border: 3px solid #7ecbff;
             border-radius: 10px;
             background-color: #e9f7ff;
             padding: 0.8rem 1.5rem;
         }
        
        
    	#sidebar {
        	position: fixed;
        	top: 100px;
        	left: 0;
        	width: 200px;
        	height: 100vh;
        	padding: 10px;
        	background-color: #f8f8f8;
        	overflow-y: auto;
    	}
>>>>>>> branch 'master' of https://github.com/H-takumi108/Exam

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

<<<<<<< HEAD
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
=======
    	#main {
        	margin-left: 220px;
    	}
    </style>
>>>>>>> branch 'master' of https://github.com/H-takumi108/Exam

</head>

<<<<<<< HEAD
<body>
=======
<body class="bg-light">
    
    <!-- ヘッダー -->
    <header class="bg-white shadow-sm py-4 mb-4">
       <div class="header-box d-flex justify-content-between align-items-center">
        <h1 class="page-title m-0">得点管理システム</h1>
        
        <div>
           <span class="me-3">${sessionScope.user.name} 様</span>
           <a href="Logout.action">ログアウト</a>
        </div>
    </header>
    
    <jsp:include page="/scoremanager/common/sidebar.jsp" />
>>>>>>> branch 'master' of https://github.com/H-takumi108/Exam

<<<<<<< HEAD
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
=======
    <main class="container" style="max-width: 900px;">
    ${param.content}
    </main>
    
    <!-- フッター -->
<footer class="text-center text-muted py-3 mt-5">
        © 2023 TIC
        大原学園
</footer>
>>>>>>> branch 'master' of https://github.com/H-takumi108/Exam

</body>
</html>