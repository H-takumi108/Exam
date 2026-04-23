<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>


<c:import url="/scoremanager/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="content">
       <section>
           <h2 class="h3 mb-4 bg-secondary bg-opacity-10 py-2 px-4">
               学生情報登録
           </h2>
           <form action="StudentCreateExecute.action" method="post">
	           <div class="container" style="max-width:600px;">
	               
	               <!-- 入学年度 -->
	               <div class="mb-3">
	                   <label class="form-label">入学年度</label>
	                  <select name="entYearStr">
	    					<c:forEach var="year" items="${ent_year_set}">
	     			   		<option value="${year}">${year}</option>
	   					 </c:forEach>
						</select>
	               </div>
	               
	               <!-- 学生番号 -->
	               <div class="mb-3">
	                   <label class="form-label">学生番号</label>
	                   <input type="text" name="noStr" class="form-control"
	                          maxlength="10"
	                          placeholder="学生番号を入力してください"
	                          value="${no}"
	                          required>
	               </div>
	               
	               <!-- 氏名 -->
	               <div class="mb-3">
	                   <label class="form-label">氏名</label>
	                   <input type="text" name="nameStr" class="form-control"
	                          maxlength="30"
	                          placeholder="氏名を入力してください"
	                          value="${name }"
	                          required>
	               </div>
	               
	               <!-- クラス -->
	               <div class="mb-4">
	                   <label class="form-label">クラス</label>
	                   <select name="classNumStr">
	   						 <c:forEach var="classNum" items="${classList}">
	      					  <option value="${classNum}">${classNum}</option>
	   					 </c:forEach>
						</select>
	               </div>
	               
	               <div class="text-start">
	                    <input type="submit" value="登録して終了">
	               </div>
	               
               </form>
               
               <div class="mt-3">
                    <a href="StudentList.action">戻る</a>
               </div>
               
           </div>
       
       </section>
    
    
    </c:param>
</c:import>