<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>
    
    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-bold bg-secondary bg-opacity-10 py-2 px-4">ログアウト</h2>

            <div class="px-4 fs-3 my-3">
            
			<div class="alert alert-success text-center" 
				style="
					width: 860px;
					padding: 1px 0;
					margin-left: -25px;
					margin-bottom: 0;
					border-radius: 0;
					font-size: 80%;
					--bs-alert-bg: #19875496;">
					ログアウトしました
            </div>
            <div style="margin-top: 150px;">
                <a href="/ExamSystem/scoremanager/Login.action" class="me-5 fs-6">
                    ログイン
                </a>
            </div>
            
            </div>
        </section>
    </c:param>
</c:import>