<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
          integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <title>Insert title here</title>
</head>
<body>
<my:navBar current="list"/>


<div class="container">
    <div class="row">
        <div class="col">

            <c:if test="${not empty message }">
                <div class="alert alert-primary">
                        ${message }
                </div>
            </c:if>

            <table style="margin-top: 30px;" class="table table-striped">
                <thead>
                <tr>
                    <th>
                        <i class="fa-solid fa-hashtag"></i>
                    </th>
                    <th>title</th>
                    <th>
                        <i class="fa-solid fa-calendar"></i>
                    </th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${boardList }" var="board">
                    <tr>
                        <td>${board.id }</td>
                        <td>

                            <c:url value="/board/get" var="getUrl">
                                <c:param name="id" value="${board.id }"></c:param>
                            </c:url>

                            <a href="${getUrl }">
                                <c:out value="${board.title }"/>
                            </a>
                        </td>

                        <td><fmt:formatDate value="${board.inserted}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- pagination -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pg.startPage > pg.pageBlock }">
                        <li class="page-item">
                            <a class="page-link"
                               href="list?currentPage=${pg.startPage-pg.pageBlock}"
                               aria-label="Previous" id="page_btn"> <span
                                    aria-hidden="true">&laquo;</span>
                            </a></li>
                    </c:if>
                    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
                        <li class="page-item">
                            <a class="page-link"
                               href="list?currentPage=${i}"
                               id="page_btn">${i}</a></li>
                    </c:forEach>
                    <c:if test="${pg.endPage < pg.totalPage }">
                        <li class="page-item">
                            <a class="page-link"
                               href="list?currentPage=${pg.startPage+pg.pageBlock}"
                               aria-label="Next" id="page_btn"> <span
                                    aria-hidden="true">&raquo;</span>
                            </a></li>
                    </c:if>
                </ul>
            </nav>
            <!-- pagination end-->
        </div>
    </div>
</div>
</body>
</html>