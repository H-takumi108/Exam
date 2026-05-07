<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">ログイン</c:param>

    <c:param name="content">
        <jsp:include page="/scoremanager/login.jsp" />
    </c:param>

</c:import>