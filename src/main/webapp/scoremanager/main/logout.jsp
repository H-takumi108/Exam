<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>
    
    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-bold bg-secondary bg-opacity-10 py-2 px-4">ログアウト</h2>

            <div class="px-4 fs-3 my-5">
            
            <div class="alert alert-success text-center custom-success">
             ログアウトしました
            </div>
            <div class="mt-5">
                <a href="/ExamSystem/scoremanager/Login.action" class="text-primary text-decoration-underline">
                    ログイン
                </a>
            </div>
            
            </div>
        </section>
    </c:param>
</c:import>