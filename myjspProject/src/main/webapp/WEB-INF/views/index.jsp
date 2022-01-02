
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>resources/js/index.js"></script>
</head>
<body>
<div class="site-wrapper">
    <div class="container-fluid">
        <header>
            <nav class="navigation-tag container-fluid">
                <div class="inner row">
                    <div class="col-md-3">

                    </div>
                    <div class="col-md-9">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" >글쓰기</button>
                    </div>
                </div>
            </nav>
        </header>
        <div class="container-fluid main-container m-top100 p-all30">
            <p>${data}</p>
            <p>${data.size}</p>
            <p>${data.totalPages}</p>
            <p>${data.number}</p>
            <p>${data.first}</p>
            <p>${data.last}</p>
            <c:forEach var="Border" items="${data.content}" varStatus="data" end="${data.size}" >
                <div class="panel panel-default" data-id="${Border.id}">
                    <div class="panel-heading clearfix">
                        <span class="pull-left badge m-r20">${data.index + 1}</span>
                        <span class="pull-left">${Border.title}</span>
                        <div class="pull-right">
                            <span class="badge">${Border.time}</span>
                            <button type="button" class="btn btn-danger">X</button>
                        </div>
                    </div>
                    <div class="panel-body">
                      ${Border.content}
                    </div>
                </div>
            </c:forEach>
            <nav class="pagination-wrapper">
                <ul class="pagination">
                    <c:if test="${!data.first}">
                        <li class="disabled"><a href="?page=${data.number-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    </c:if>
                    <c:forEach var="page" items="${data.content}" varStatus="data" end="${data.totalPages - 1}">
                        <li class="active"><a href="#">${data.index + 1} <span class="sr-only">1</span></a></li>
                    </c:forEach>
                    <c:if test="${!data.last}">
                        <li class="disabled"><a href="?page=${data.number+1}" aria-label="Previous"><span aria-hidden="true">&rarr;</span></a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
<%--    모달--%>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="form_wrap p-all30">
                    <div class="form-group mb100 clearfix">
                        <label for="inputEmail3" class="col-sm-2 control-label">제목 : </label>
                        <div class="col-sm-10">
                            <input type="email" name="title" class="form-control" id="inputEmail3" placeholder="제목">
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <label for="inputPassword3" class="col-sm-2 control-label">글쓰기 : </label>
                        <div class="col-sm-10 ">
                            <input type="text" name="content" class="form-control height-100" id="inputPassword3" placeholder="글쓰기">
                        </div>
                    </div>
                    <button type="button" class="handle-save btn btn-default">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
