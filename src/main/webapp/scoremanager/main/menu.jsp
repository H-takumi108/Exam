<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/scoremanager/common/base.jsp">

    <c:param name="title">得点管理システム</c:param>

    <c:param name="content">
        <section>
            <h2 class="h3 mb-3 fw-bold bg-secondary bg-opacity-10 py-2 px-4">メニュー</h2>

            <div class="row justify-content-center text-center px-4 fs-3 my-3 g-4">

                <!-- 学生管理 -->
                <div class="col-md-4 col-6">
                    <div class="d-flex align-items-center justify-content-center rounded shadow"
                         style="height: 7rem; background-color: #dbb;">
                         
                        <a href="StudentList.action" class="text-primary fs-5 text-decoration-underline">学生管理</a>
                    </div>
                </div>

                <!-- 成績管理 -->
                <div class="col-md-4 col-6">
                    <div class="d-flex flex-column align-items-center justify-content-center rounded shadow"
                         style="height: 7rem; background-color: #bdb;">
                        <div class="fs-5">成績管理</div>
                        <a href="TestRegist.action" class="fs-5 text-decoration-underline">成績登録</a>
                        <a href="TestList.action" class="fs-5 text-decoration-underline">成績参照</a>
                    </div>
                </div>

                <!-- 科目管理 -->
                <div class="col-md-4 col-6">
                    <div class="d-flex align-items-center justify-content-center rounded shadow"
                         style="height: 7rem; background-color: #bbd;">
                        <a href="SubjectList.action" class="text-primary fs-5 text-decoration-underline">科目管理</a>
                    </div>
                </div>

            </div>
        </section>
    </c:param>

</c:import>