<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>
    
    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-bold bg-secondary bg-opacity-10 py-2 px-4">科目情削除</h2>
            
            <div class="alert alert-success text-center custom-success">
                削除が完了しました。
            </div>
            
            
            <div class="mt-4">
                <a href="SubjectList.action">
                    科目一覧
                </a>
            </div>
            
        </section>
    </c:param>
</c:import>