<%-- 共通テンプレート --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous">
<title>${param.title}</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
${param.scripts}
</head>
<body>
  <div id="wrapper" class="container">
    <header
      class="d-flex flex-wrap justify-content-center py-3 px-5 mb-4 border-bottom border-2 bg-primary bg-opacity-10 bg-gradient">
      <c:import url="/common/header.jsp" />
    </header>
 
    <div class="row justify-content-center">
      <c:choose>
        <%-- ログイン済みの場合 --%>
        <c:when test="${user.isAuthenticated()}">
          <nav class="col-3" style="height:40rem;">
            <c:import url="/common/navigation.jsp" />
          </nav>
          <main class="col-9 border-start"> ${param.content} </main>
        </c:when>
        <%-- 未ログインの場合 --%>
        <c:otherwise>
          <main class="col-8"> ${param.content} </main>
        </c:otherwise>
      </c:choose>
    </div>
    <footer class="py-2 my-4 bg-dark bg-opacity-10 border-top border-3 align-bottom">
      <c:import url="/common/footer.jsp" />
    </footer>
 
  </div>base.jsp

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>${param.title}</title>

    <!-- Bootstrap -->
    <link href="/ExamSystem/webapp/css/bootstrap.min.css" rel="stylesheet">
	
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

    	main {
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
</body>
</html>