<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="current" %>

<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/write" var="writeUrl"></c:url>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${listUrl }">
            <i class="fa-solid fa-house"></i>
        </a>

        <!-- 버튼 추가 -->
        <button class="navbar-toggler"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link ${current == 'list' ? 'active' : '' }"
                       href="${listUrl}">목록보기</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${current == 'write' ? 'active' : '' }"
                       href="${writeUrl}">글쓰기</a>
                </li>

            </ul>

            <%--    <select id="dataPerPage">
                    <option value="10">10개씩 보기</option>
                    <option value="15">15개씩 보기</option>
                    <option value="20">20개씩 보기</option>
                </select>--%>

            <!-- 검색 기능 구현 -->

            <form action="${listUrl }" class="float-start">
                <div class="input-group">
                    <select name="search" id="searchVerify" class="form-select"
                            style="flex: 0 0 130px; text-align:center;">
                        <option value="all"${param.type != 'title' && param.type != 'content' ? 'selected' : '' } >전체
                        </option>
                        <option value="title"${param.type == 'title' ? 'selected' : '' }>제목</option>
                        <option value="content"${param.type == 'content' ? 'selected' : '' }>본문</option>
                    </select>

                    <input id="searchInput" class="form-control me-2" name="searchInput" type="search"
                           placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="button">검색</button>
                </div>
            </form>


        </div>
    </div>
</nav>

