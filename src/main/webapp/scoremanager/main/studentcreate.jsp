<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>
    <c:param name="content">
       <section>
           <h2 class="h3 mb-4 bg-secondary bg-opacity-10 py-2 px-4">
               学生情報登録
           </h2>
           
           <div class="container" style="max-width:600px;">
               
               <!-- 入学年度 -->
               <div class="mb-3">
                   <label class="form-label">入学年度</label>
                   <select class="form-select" name="ent_year">
                       <c:forEach var="y" items="${yearList}">
                           <option value="${y}">${y}</option>
                       </c:forEach>
                   </select>
               </div>
               
               <!-- 学生番号 -->
               <div class="mb-3">
                   <label class="form-label">学生番号</label>
                   <input type="text" name="no" class="form-control"
                          maxlength="10"
                          placeholder="学生番号を入力してください"
                          value="${no}"
                          required>
               </div>
               
               <!-- 氏名 -->
               <div class="mb-3">
                   <label class="form-label">氏名</label>
                   <input type="text" class="form-control"
                          maxlength="30"
                          placeholder="氏名を入力してください"
                          value="${name }"
                          required>
               </div>
               
               <!-- クラス -->
               <div class="mb-4">
                   <label class="form-label">クラス</label>
                   <select name="class_num" class="form-select">
                       <c:forEach var="c" items="${classList}">
                           <option value="${c}">${c}</option>
                       </c:forEach>
                   </select>
               </div>
               
           </div>
       
       </section>
    
    
    </c:param>
