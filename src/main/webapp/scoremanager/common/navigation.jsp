<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty sessionScope.user}">
	<aside id="sidebar" class="p-3">
	
		<nav>
			<ul class="list-unstyled">
				<li class="mb-3">
				    <a href="Menu.action" class="text-decoration-underline">
				        メニュー
				    </a>
				</li>
				<li class="mb-3">
				    <a href="StudentList.action" class="text-decoration-underline">
				        学生管理
				    </a>
				</li>
			
				<li class="mb-3">
				    <div class="fw-bold mb-1">
				       成績管理
				    </div>
				    
					<ul class="list-unstyled ms-3">
						<li class="mb-2">
						    <a href="TestRegist.action" class="text-decoration-underline">
						        成績登録
						    </a>
						</li>
						
						<li>
						    <a href="TestList.action" class="text-decoration-underline">
						        成績参照
						    </a>
						</li>
					</ul>
				</li>
			
			<li>
			    <a href="SubjectList.action" class="text-decoration-underline">
			        科目管理
			    </a>
		    </li>
			</ul>
		</nav>
		    
	</aside>
</c:if>