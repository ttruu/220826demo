<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
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
    <script>
        $(document).ready(function () {

            /*            $("#edit-button1").click(function() {

                            $("#input1").removeAttr("readonly");
                            $("#textarea1").removeAttr("readonly");
                            $("#modify-submit1").removeClass("d-none");
                            $("#delete-submit1").removeClass("d-none");
                    });*/


            $("#delete-submit1").click(function (e) {
                e.preventDefault();

                if (confirm("삭제하시겠습니까?")) {
                    let form1 = $("#form1");
                    let actionAttr = "${appRoot}/board/delete";
                    form1.attr("action", actionAttr);
                    form1.submit();
                }
            });

        });
    </script>
    <title>Insert title here</title>
</head>
<body>

<my:navBar/>
<div class="container">
    <div class="row">
        <div class="col">

            <c:url value="/board/modify" var="modifyUrl">
                <c:param name="id" value="${board.id }"></c:param>
            </c:url>

            <c:if test="${not empty message }">
                <div class="alert alert-primary">
                        ${message }
                </div>
            </c:if>
            <h3 style="margin-top: 30px;">${board.id }번째 게시물

                <c:choose>
                    <c:when test="${board.password eq null}">
                        <button type="button" class="btn btn-secondary" onclick="location.href='${modifyUrl }'">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal" data-bs-whatever="@mdo">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                    </c:otherwise>
                </c:choose>

            </h3>
            <%----%>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="form1" action="/board/modify" method="post">
                                <input type="hidden" name="id" value="${board.id }"/>
                                <div class="mb-3">
                                    <label for="password1" class="col-form-label">비밀번호:</label>
                                    <input type="text" class="form-control" name="password1" id="password1">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button id="edit-button1" type="submit" class="btn btn-primary">확인</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <%----%>

            <!-- 게시물 보기-->
            <div>
                <label class="form-label" for="input2">이름</label>
                <input class="form-control" type="text" name="boardName" required
                       id="input2" value="${board.boardName }" readonly/>
            </div>

            <div>
                <label class="form-label" for="input3">비밀번호</label>
                <input class="form-control" type="text" name="password"
                       id="input3" value="${board.password }" readonly/>
            </div>

            <div>
                <label class="form-label" for="input1">제목</label>
                <input class="form-control" type="text" name="title" required
                       id="input1" value="${board.title }" readonly/>
            </div>

            <div>
                <label for="textarea1" class="form-label">본문</label>
                <textarea class="form-control" name="content" id="textarea1"
                          rows="10" cols="30" readonly>${board.content }</textarea>
            </div>

            <div>
                <label class="form-label">작성일</label>
                <input class="form-control" type="date" value="<fmt:formatDate value="${board.inserted}" pattern="yyyy-MM-dd"/>" readonly/>
            </div>
        </div>
    </div>
</div>
</body>
</html>