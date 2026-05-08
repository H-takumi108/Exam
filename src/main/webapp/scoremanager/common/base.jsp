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
        	left: 180px;
        	width: 200px;
        	height: calc(100vh - 360px);
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
        	margin-left: 360px;
        	margin-right: 20px;
    	}
    </style>

</head>

<body class="bg-light">
    
    <!-- ヘッダー -->
    <header class="pt-0 py-3 mb-2">
      <div style="max-width: 1000px; margin: 0 auto;">
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
    <main id="main" 
          style="max-width:800px;
                 margin-left:400px;
                 margin-right:20px;
                 margin-bottom:80px;">
           ${param.content}
    </main>
    
    <!-- フッター -->
<footer class="py-1">
  <div style="
      max-width: 1000px;
      margin: 0 auto;
      background-color:#e9ecef;
      text-align:center;
      padding:8px 0;
   ">
    © 2023 TIC<br>
    大原学園
  </div>
</footer>

</body>
</html>