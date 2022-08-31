<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
          integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Insert title here</title>
</head>
<body>

<my:navBar current="write"/>

<div class="container">
    <div class="row">
        <div class="col">
            <h1 style="margin-top: 30px;">글 작성</h1>

            <form action="/board/write" method="post">

                <div>
                    <label for="input2" class="from-label">이름</label>
                    <input class="form-control" type="text" name="boardName" required id="input2" />
                </div>

                <div>
                    <label for="input3" class="from-label">비밀번호</label>
                    <input class="form-control" type="text" name="password" id="input3" />
                </div>

                <div>
                    <label for="input1" class="from-label">제목</label>
                    <input class="form-control" type="text" name="title" required id="input1" />
                </div>

                <div>
                    <label for="textarea1" class="form-label">본문</label>
                    <textarea class="form-control" id="textarea1" name="content" rows="10" cols="30"></textarea>
                </div>

                <button class="btn btn-primary" style="margin-top: 10px;">등록</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>