<%-- 学生一覧 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="/scoremanager/common/base.jsp">
    <c:param name="title">
        得点管理システム
    </c:param>
    
    <c:param name="scripts"></c:param>
    
    <c:param name="content">
    <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4">成績管理</h2>
        <form method="get">
            <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                <div class="col-4">
                   <label class="form-label" for="student-f1-select">入学年度</label>
                   <select class="form-select" id="student-f1-select" name="f1">
                      <option value="0">---------</option>
                      <c:forEach var="year" items="${ent_year_set }">
                         <option value="${year }"<c:if test="${year==f1 }">selected</c:if>>${year }</option>
                      </c:forEach>
                   </select>
                </div>
                <div class="col-4">
                    <label class="form-label" for="student-f2-select">クラス</label>
                    <select class="form-select" id="student-f2-select" name="f2">
                        <option value="0">-----------</option>
                        <c:forEach var="num" items="${class_num_set }">
                           <option value="${num }"<c:if test="${num==f2 }">selected</c:if>>${num }</option>
                        </c:forEach>
                    </select>
                </div>
				<div class="col-4">
				   <label class="form-label" for="student-f3-select">科目</label>
				   <select class="form-select" id="student-f3-select" name="f3">
				       <option value="0">-----------</option>
				       <c:forEach var="sub" items="${sub_name_set }">
				          <option value="${sub }"<c:if test="${sub==f3 }">selected</c:if>>${sub }</option>
				       </c:forEach>
				   </select>
				 </div>
				 <div class="col-4">
				   <label class="form-label" for="student-f4-select">回数</label>
				   <select class="form-select" id="student-f4-select" name="f4">
				       <option value="0">-----------</option>
				       <c:forEach var="no" items="${test_no_set }">
				          <option value="${no }"<c:if test="${no==f4 }">selected</c:if>>${no }</option>
				       </c:forEach>
				    </select>
				 </div>
				<div class="col-2 text-center">
                     <button class="btn btn-secondary" id="filter-button">検索</button>
                </div>
            </div>
            </form>
            
			<c:choose>
				<c:when test="${students.size()>0 }">
					<form action="TestRegistExecute.action" method="post">
						<table class="table table-hover">
							<tr>
								<th>入学年度</th>
								<th>クラス</th>
								<th>学籍番号</th>
								<th>氏名</th>
								<th class="text-center">点数</th>
							</tr>
							
							<c:forEach var="student" items="${students }">
								<tr>
									<td><input type="hidden" name="entYearStr" value="${student.entYear}">${student.entYear }</td>
									<td><input type="hidden" name="classNumStr" value="${student.classNum}">${student.classNum }</td>
									<td><input type="hidden" name="noStr" value="${student.no}">${student.no }</td>
									<td><input type="hidden" name="nameStr" value="${student.name}">${student.name }</td>
									<td class="text-center">
										<input type="text" name="pointList" value="${student.point }">
									</td>
								</tr>
							</c:forEach>
						</table>
						<div class="mt-3">
							<input type="submit" value="登録して終了">
						</div>
					</form>
				</c:when>
			</c:choose>
        </section>
    
    </c:param>
</c:import>