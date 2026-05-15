<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="w-100 d-flex justify-content-between align-items-end">

	<h1 class="m-0">得点管理システム</h1>

	<c:if test="${not empty sessionScope.user}">
		<div class="text-end">
			${sessionScope.user.name} 様　
			<a href="Logout.action"
			   class="text-decoration-underline">
				ログアウト
			</a>
		</div>
	</c:if>

</div>