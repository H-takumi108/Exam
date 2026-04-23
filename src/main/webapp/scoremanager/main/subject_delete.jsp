<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>


<c:import url="/scoremanager/common/base.jsp">
    <c:param name="title">得点管理システム</c:param>
    <c:param name="content">
       <section>
           <h2 class="h3 mb-4 bg-secondary bg-opacity-10 py-2 px-4">
               科目情報削除
           </h2>
           <p>「${name }(${cd })」を削除してもよろしいですか</p>
           <form action="SubjectDeleteExecute.action" method="post">
	           <div class="text-start" style="max-width:600px;">
	           	   <input type="hidden" name="cdStr" value="${cd }">
	           	   <input type="hidden" name="nameStr" value="${name }">
	               <div class="text-start">
	                    <input type="submit" value="削除" class="btn btn-danger">
	           </div>
	               
               </form>
               
               <div class="mt-5">
                    <a href="SubjectList.action">戻る</a>
               </div>
               
           </div>
       
       </section>
    
    </c:param>
</c:import>