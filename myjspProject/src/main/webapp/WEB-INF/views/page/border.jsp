
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body id="page">
	<div class="wrapper">
		<div class="container-fluid">
			<nav>
				<ol class="breadcrumb">
					<li><a href="/">Main</a></li>
					<li><a href="#">${page.get().title} Page</a></li>
				</ol>
			</nav>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Title : ${page.get().title}</h3>
				</div>
				<div class="panel-body">
					<p>작성일 : <span class="date-badge badge">${page.get().time}</span></p>
					${page.get().content}
					<div class="panel panel-default m-top30">
					  <div class="panel-heading">
					    <h3 class="panel-title">댓글</h3>
					  </div>
					  <div class="panel-body">
					    <textarea class="form-control commet-textarea" rows="5"></textarea>
					    <div class="text-right p-20">
					    	<button type="button" class="btn btn-success commet-btn">댓글달기</button>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".commet-btn").on('click',function(){
				let commentValue = $('.commet-textarea').val();
				console.log(commentValue);
			});
		});
	</script>
</body>
</html>
