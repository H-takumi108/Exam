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
             background-color: #e6f1fb;
             padding: 0.9rem 2rem;
             border-bottom: 3px solid #e0e4ea;
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
        	top: 95px;
        	left: 180px;
        	width: 200px;
        	height: calc(100vh - 280px);
        	padding: 10px;
        	background-color: #f8f8f8;
        	overflow-y: auto;
        	
        	border-right: 1px solid #dcdcdc;
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
    <header class="pt-0 py-3 mb-1">
      <div style="max-width: 1000px; margin-left: 160px; margin-right: 20px;">
       <div class="header-box d-flex justify-content-between align-items-center">
        <h1 class="page-title m-0">得点管理システム</h1>
        
        
        <c:if test="${not empty sessionScope.user }">
           <div>
                <span class="me-3">${sessionScope.user.name} 様</span>
                <a href="Logout.action" class="text-decoration-underline">ログアウト</a>
           </div>
        </c:if>
       </div>
      </div>
    </header>
    
    <jsp:include page="/scoremanager/common/sidebar.jsp" />

    <!-- main -->
    <main id="main" 
          style="max-width:730px;
                 margin-left:400px;
                 margin-right:20px;
                 margin-bottom:${empty param.noMargin ? '250' : '0'};">
           ${param.content}
    </main>
    
    <!-- フッター -->
<footer class="py-1"
        style="
           position: relative;
           z-index: 10;
           margin-top:${not empty sessionScope.user ? '120px' : '0'};
        ">
  <div style="
      max-width: 1000px;
      margin-left: 160px;
      margin-right: 20px;
      background-color:#e9ecef;
      text-align:center;
      padding:2px 0;
   ">
    © 2023 TIC<br>
    大原学園
  </div>
</footer>

</body>
</html>