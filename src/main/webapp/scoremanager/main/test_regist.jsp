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
        <section class="me-4">
        <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4">成績管理</h2>
        <form method="get">
            <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                
                <!-- 入学年度 -->
                <div class="col-4">
                   <label class="form-label" for="student-f1-select">入学年度</label>
                   <select class="form-select" id="student-f1-select" name="f1">
                      <option value="0">---------</option>
                      <c:forEach var="year" items="${ent_year_set }">
                         <option value="${year }"<c:if test="${year==f1 }">selected</c:if>>${year }</option>
                      </c:forEach>
                   </select>
                </div>
                
                
               <!-- クラス -->
                <div class="col-4">
                    <label class="form-label" for="student-f2-select">クラス</label>
                    <select class="form-select" id="student-f2-select" name="f2">
                        <option value="0">-----------</option>
                        <c:forEach var="num" items="${class_num_set }">
                           <option value="${num }"<c:if test="${num==f2 }">selected</c:if>>${num }</option>
                        </c:forEach>
                    </select>
                </div>
                
                
                <!-- 科目 -->
                <div class="col-4">
                    <label class="form-label" for="student-f3-select">科目</label>
                    <select class="form-select" id="student-f3-select" name="f3">
                        <option value="0">-----------</option>
                        <c:forEach var="sub" items="${subjectList }">
                           <option value="${sub.id }"<c:if test="${sub.id==f3 }">selected</c:if>>${num }</option>
                        </c:forEach>
                    </select>
                </div>
                
                <!-- 回数 -->
                <div class="col-4">
                    <label class="form-label" for="student-f4-select">回数</label>
                    <select class="form-select" id="student-f2-select" name="f4">
                        <option value="0">-----------</option>
                        <c:forEach var="num" items="${testCountList }">
                           <option value="${num }"<c:if test="${num==f4 }">selected</c:if>>${num }</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="col-2 text-center">
                     <button class="btn btn-secondary" id="filter-button">検索</button>
                </div>
                <div class="mt-2 text-warning">${errors.get("f1") }</div>
            </div>
            </form>
            
            <c:choose>
               <c:when test="${students.size()>0 }">
                  <div>検索結果：${students.size() }件</div>
                  <table class="table table-hover">
                     <tr>
                        <th>入学年度</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>クラス</th>
                        <th></th>
                        <th></th>
                     </tr>
                     <c:forEach var="student" items="${students }">
                        <tr>
                           <td>${student.entYear }</td>
                           <td>${student.no }</td>
                           <td>${student.name }</td>
                           <td>${student.classNum }</td>
                           <td class="text-center">
                               <c:choose>
                                  <c:when test="${student.isAttend() }">
                                     〇
                                  </c:when>
                                  <c:otherwise>
                                     ×
                                  </c:otherwise>
                              </c:choose>
                           </td>
                           <td><a href="StudentUpdate.action?no=${student.no }">変更</a></td>
                        </tr>
                     </c:forEach>
                  </table>
                </c:when>
                <c:otherwise>
                    <div>学生情報が存在しませんでした。</div>
                </c:otherwise>
            </c:choose>
        </section>
    
    </c:param>
</c:import>