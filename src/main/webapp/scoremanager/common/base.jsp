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
             padding: 1.4rem 2rem;
             border: 1px solid #c5c5c5;
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
        	top: 120px;
        	left: 0;
        	width: 200px;
        	height: calc(100vh - 120px);
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
        	margin-left: 240px;
        	margin-right: 40px;
    	}
    </style>

</head>

<body class="bg-light d-flex flex-column min-vh-100">
    
    <!-- ヘッダー -->
    <header class="py-4 mb-4">
      <div style="max-width: 1400px; margin: 0 auto;">
       <div class="header-box d-flex justify-content-between align-items-center">
        <h1 class="page-title m-0">得点管理システム</h1>
        
        
        <c:if test="${not empty sessionScope.user }">
           <div>
                <span class="me-3">${sessionScope.user.name} 様</span>
                <a href="Logout.action">ログアウト</a>
           </div>
        </c:if>
       </div>
      </div>
    </header>
    
    <jsp:include page="/scoremanager/common/sidebar.jsp" />

    <!-- main -->
    <main id="main" class="flex-grow-1">
       <div style="max-width: 1100px;">
           ${param.content}
       </div>
    </main>
    
    <!-- フッター -->
<footer class="py-1" style="background-color:#e9ecef;">
  <div style="max-width: 1400px; margin: 0 auto;" class="text-center">
    © 2023 TIC<br>
    大原学園
  </div>
</footer>

</body>
</html>