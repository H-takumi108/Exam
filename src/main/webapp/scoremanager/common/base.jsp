<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>${param.title}</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">

	
    <style>
        .page-title {
            font-size: 2.2rem;
            font-weight: bold;
            border: 3px solid #7ecbff;
            padding: 0.4rem 1.2rem;
            border-radius: 10px;
            background-color: #e9f7ff;
            display: inline-block;
            margin: 1rem 0;
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

    	#sidebar ul {
        	list-style: none;
        	padding: 0;
   	 	}

    	#sidebar li {
        	margin-bottom: 8px;
    	}

    	#sidebar a {
        	text-decoration: none;
    	}

    	#main {
        	margin-left: 220px;
    	}
    </style>
    
    ${param.scripts}

</head>

<body class="bg-light">
    
    <!-- ヘッダー -->
    <header class="bg-white shadow-sm py-4 mb-4">
        <h1 class="page-title">${param.title}</h1>
        
        <div class="text-end mt-2">
           <span class="me-3">${sessionScope.userName} 様</span>
           <a href="Logout.action">ログアウト</a>
        </div>
    </header>
    
    <jsp:include page="/scoremanager/common/sidebar.jsp" />

    <main class="container" style="max-width: 900px;">
        ${param.content}
    </main>
    
    <!-- フッター -->
    <footer class="text-center text-muted py-3 mt-5">
        © 2023 TIC
        大原学園
    </footer>

</body>
</html>