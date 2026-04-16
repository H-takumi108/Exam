<%-- メニューJSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/base.jsp">
    <c:param name="title">
        得点管理システム
    </c:param>
    
    <c:param name="scripts"></c:param>
    
    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4">メニュー</h2>
            <div class="row justify-content-center text-center px-4 fs-3 my-5 g-4">
            
               <%-- 学生管理 --%>
               <div class="col-md-3 col-6">
                   <div class="d-flex align-items-center justify-content-center rounded shadow"
                   style="height: 10rem; background-color: #dbb;">
                   <a href="StudentList.action" class="text-dark fw-bold fs-3 text-decoration-none">学生管理</a>
                   </div>
               </div>
                
               <%-- 成績管理 --%>
               <div class="col-md-3 col-6">
                   <div class="d-flex flex-column align-items-center justify-content-center rounded shadow"
                        style="height: 10rem; background-color: #bdb;">
                   
                       <div class="fw-bold mb-2">成績管理</div>
                       
                        <a href="TestRegist.action" class="fs-5 text-decoration-none">成績登録</a>
                        <a href="TestList.action" class="fs-5 text-decoration-none">成績参照</a>
                      
                   </div>
              </div>
              <%-- 科目管理 --%>
              <div class="col-md-3 col-6">
                 <div class="d-flex align-items-center justify-content-center rounded shadow"
                  style="height: 10rem; background-color: #bbd;">
                  <a href="SubjectList.action" class="text-dark fw-bold fs-3 text-decoration-none">科目管理</a>
                  </div>
              </div>
              
              <%-- クラス管理 --%>
              <div class="col-md-3 col-6">
                 <div class="d-flex align-items-center justify-content-center rounded shadow"
                  style="height: 10rem; background-color: #ddb;">
                  <a href="ClassList.action" class="text-dark fw-bold fs-3 text-decoration-none">クラス管理</a>
                 </div>
              </div>
           </div>
           <a href="Logout.action">ログアウト</a> <%-- 仮置き --%>
         </section>
    </c:param>
</c:import>