<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>


<c:import url="/scoremanager/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="content">
       <section>
           <h2 class="h3 mb-4 bg-secondary bg-opacity-10 py-2 px-4">
               科目情報登録
           </h2>
           <form action="SubjectCreateExecute.action" method="post">
	           <div class="container" style="max-width:600px;">
	               
	               <!-- 学生番号 -->
	               <div class="mb-3">
	                   <label class="form-label">科目コード</label>
	                   <input type="text" name="㏅" class="form-control"
	                          maxlength="10"
	                          placeholder="科目コードを入力してください"
	                          value="${no}"
	                          required>
	               </div>
	               
	               <!-- 氏名 -->
	               <div class="mb-3">
	                   <label class="form-label">科目名</label>
	                   <input type="text" name="name" class="form-control"
	                          maxlength="30"
	                          placeholder="科目名を入力してください"
	                          value="${name }"
	                          required>
	               </div>
	               
	               <div class="text-start">
	                    <input type="submit" value="登録">
	               </div>
	               
               </form>
               
               <div class="mt-3">
                    <a href="SubjectList.action">戻る</a>
               </div>
               
           </div>
       
       </section>
    
    
    </c:param>
</c:import>