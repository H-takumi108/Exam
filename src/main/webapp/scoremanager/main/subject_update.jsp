<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>


<c:import url="/scoremanager/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="content">
       <section>
           <h2 class="h3 mb-4 bg-secondary bg-opacity-10 py-2 px-4">
               科目情報登録
           </h2>
           <form action="SubjectUpdateExecute.action" method="post">
	           <div class="container" style="max-width:600px;">
	           	<%-- hidden --%>
	               <input type="hidden" name="cdStr" value="${cd}">
	               <!-- 学生番号 -->
	               <div class="mb-3">
	                   <label class="form-label">科目コード</label>
	                   <p>${cd }</p>
	               </div>
	               
	               <!-- 氏名 -->
	               <div class="mb-3">
	                   <label class="form-label">科目名</label>
	                   <input type="text" name="nameStr" class="form-control"
	                          maxlength="30"
	                          placeholder="科目名を入力してください"
	                          value="${name }"
	                          required>
	               </div>
	               
	               <div class="text-start">
	                    <input type="submit" value="変更">
	               </div>
	               
               </form>
               
               <div class="mt-3">
                    <a href="SubjectList.action">戻る</a>
               </div>
               
           </div>
       
       </section>
    
    </c:param>
</c:import>