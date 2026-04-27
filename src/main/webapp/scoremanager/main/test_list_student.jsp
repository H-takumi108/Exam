<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/scoremanager/common/base.jsp">
    <c:param name="title">
        得点管理システム
    </c:param>
    
    <c:param name="scripts"></c:param>
    
    <c:param name="content">
		<h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4">成績一覧（学生）</h2>
		
		<div class="row border mx-3 mb-3 p-3 rounded" id="filter">
				<form action="TestListSubjectExecute.action" method="post">
					<div class="row align-items-end mb-3">
						<div class="col-2 fw-bold text-center align-self-center">
							<label>科目情報</label>
						</div>
						<div class="col">
							<label class="form-label" for="student-f1-select">入学年度</label>
							<select class="form-select" id="student-f1-select" name="f1">
								<option value="0">---------</option>
								<c:forEach var="year" items="${ent_year_set }">
									<option value="${year }"<c:if test="${year==f1 }">selected</c:if>>${year }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col">
							<label class="form-label" for="student-f2-select">クラス</label>
							<select class="form-select" id="student-f2-select" name="f2">
								<option value="0">-----------</option>
								<c:forEach var="num" items="${class_num_set }">
									<option value="${num }"<c:if test="${num==f2 }">selected</c:if>>${num }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col">
							<label class="form-label" for="student-f3-select">科目</label>
							<select class="form-select" id="student-f3-select" name="f3">
							<option value="0">-----------</option>
								<c:forEach var="sub" items="${sub_name_set }">
									<option value="${sub }"<c:if test="${sub==f3 }">selected</c:if>>${sub }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2 text-end">
							<button class="btn btn-secondary" id="filter-button-1">検索</button>
						</div>
					</div>
				</form>
				
				<hr>
				
				<form action="TestListStudentExecute.action" method="post">
					<div class="row align-items-end">
						<div class="col-2 fw-bold text-center align-self-center">
							<label>学生情報</label>
						</div>
						<div class="col-4">
							<label class="form-label">学生番号</label>
							<input type="text" name="f4" class="form-control"
								maxlength="10"
								placeholder="学生番号を入力してください"
								value="${f4}"
								required>
						</div>
						<div class="col-2 text-end">
							<button class="btn btn-secondary" id="filter-button-2">検索</button>
						</div>
					</div>
				</form>
			</div>
            
		
		<c:choose>
			<p>氏名：${student.name }(${f4 })</p>
			<c:when test="${tlst.size()>0 }">
				<table class="table table-hover">
					<tr>
						<th>科目名</th>
						<th>科目コード</th>
						<th>回数</th>
						<th>点数</th>
					</tr>
					
					<c:forEach var="tlst" items="${tlst }">
						<tr>
							<td>${tlst.subjectName }</td>
							<td>${tlst.subjectCd }</td>
							<td>${tlst.num }</td>
							<td>${tlst.point }</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			
			<c:when test="${tlst.size() == 0}">
				<p>成績情報が存在しませんでした。</p>
			</c:when>
			
			<c:otherwise>
				<p class=text-info>科目情報を選択または学生情報を入力して検索ボタンをクリックしてください</p>
			</c:otherwise>
			
		</c:choose>
    
    </c:param>
</c:import>