<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>
    
    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-bold bg-secondary bg-opacity-10 py-2 px-4">学生情報変更</h2>
            
            <div class="alert alert-success text-center custom-success">
                変更が完了しました。
            </div>
            
            
            <div class="mt-4">
                <a href="StudentList.action">
                    学生一覧
                </a>
            </div>
            
        </section>
    </c:param>
</c:import>