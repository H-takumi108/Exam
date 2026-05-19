<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>
    
    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-bold bg-secondary bg-opacity-10 py-2 px-4">成績管理</h2>
            
            <div style="
                background-color:#8fc9a8;
                padding:10px 0;
                text-align:center;
                margin-bottom:120px;
            ">
                登録が完了しました。
            </div>
            
            
            <div style="margin-top: 150px;">
                <a href="TestRegist.action" class="me-5">
                    戻る
                </a>
                <a href="TestList.action">
                    成績参照
                </a>
            </div>
            
        </section>
    </c:param>
</c:import>