<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/scoremanager/common/base.jsp">

	<c:param name="title">得点管理システム</c:param>
	
	<c:param name="content">
	
		<section>
		
			<h2 class="h3 mb-4 bg-secondary bg-opacity-10 py-2 px4">
				学生情報更新
			</h2>
			
			<form action="StudentUpdateExecute.action" method="post">
				
				<div class="mb-3">
					<label class="from-label">入学年度</label>
					<p>${entYear}</p>
					<input type="hidden" name="entYearStr" value="${entYear}">
					
				</div>
				
				<div class="mb-3">
					<label class="from-label">学生番号</label>
					<p>${no}</p>
					<input type="hidden" name="noStr" value="${no}">
				</div>
				
				<div class="mb-3">
					<label class="form-label">氏名</label>
					<input type="text" name="nameStr" class="form-control" maxlength="30"
					placeholder="氏名を入力してください" value="${name }" required>
				</div>
				
				<div class="mb-3">
					<label class="form-label">クラス</label>
					<select name="classNumStr" class="form-select">
						<c:forEach var="classNum" items="${classList}">
							<option value="${classNum}">${classNum}</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="mb-4">
					<label class="form-label">在学中</label>
					<input type="checkbox" name="attendStr"
					<% if ("on".equals(session.getAttribute("attend"))) { %>
						checked="checked" 
					<%} %>>
				</div>
				
				<p><input type="submit" value="変更" class="btn btn-primary rounded-2 px-4"></p>
				
			</form>
			
			<a href="StudentList.action">戻る</a> <%-- 学生管理一覧に戻る --%>
		
		</section>
		
	</c:param>
	
</c:import>

