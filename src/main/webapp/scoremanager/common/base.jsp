<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">

	
    <style>
         .page-title {
             font-size: 2.2rem;
             font-weight: bold;
         }


        .header-box {
             border-radius: 0px;
             background-color: #e9f7ff;
             padding: 0.8rem 1.5rem;
         }
         
         .custom-success {
             padding: 6px 12px;
             font-size: 0.9rem;
             background-color: #6fa88c;
             border-color: #6fa88c;
             border-radius: 0; 
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

</head>

<body>
    
    <!-- ヘッダー -->
    <header class="bg-white shadow-sm">
    	<div class="header-box d-flex justify-content-between align-items-center">
           	<h1 class="page-title m-0">得点管理システム</h1>
        
        	<c:if test="${not empty sessionScope.user}">
		        <div>
		           <span class="me-3">${sessionScope.user.name} 様</span>
		           <a href="Logout.action">ログアウト</a>
		        </div>
        	</c:if>
        
        
       </div>
    </header>
    
    <jsp:include page="/scoremanager/common/sidebar.jsp" />

    <main style="max-width: 1200px; margin:0 auto;">
    	<jsp:include page="${param.content}" />
    </main>
    
    <!-- フッター -->
<footer class="text-center py-3 mt-5" style="background-color:#e9ecef; width:100%;">
    © 2023 TIC<br>
    大原学園
</footer>

</body>
</html>