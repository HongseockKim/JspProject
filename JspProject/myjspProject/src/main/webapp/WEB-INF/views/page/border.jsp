
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="panel-body" data-id="${page.get().id}">
					<p>작성일 : <span class="date-badge badge">${page.get().time}</span></p>
					<div class="content-container">
						${page.get().content}
					</div>
					<div class="modify-container hidden">
						<textarea class="modify-text form-control" rows="5">${page.get().content}</textarea>
					</div>
					<div class="panel panel-default m-top30">
					  <div class="panel-heading">
					    <h3 class="panel-title">댓글</h3>
					  </div>
					  <div class="panel-body">
					    <textarea class="form-control commet-textarea" rows="5"></textarea>
					   <div class="comment-area m-top30">
					  	<ul class="list-group">
					  	<c:forEach var="comments" items="${comment}" varStatus="comment">
					  		<li data-comment-id="${comments.id}" class="comment-list list-group-item clearfix">
						  		<span class="comment pull-left">${comments.comments}</span>
						  		<div class="label-tag pull-right text-right">
						  			<span class="label label-primary">${comments.time}</span>						  			
						  		</div>						  		
						  		<button type="button" class="close delete-comment-btn" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					  		</li>
					  	</c:forEach>
						</ul>
					   </div>
					    <div class="text-right p-20">
							<button type="button" class="btn btn-success modify-btn">수정</button>
							<button type="button" class="btn btn-success modify-save-btn hidden">저장하기</button>
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
				let borderId = $('.panel-body').data('id');
				console.log(commentValue);
				console.log(borderId);

				$.ajax({
					"url": "/page/border/comment",
					"method": "POST",
					"timeout": 0,
					"headers": {
						"Content-Type": "application/json",
					},
					"data":JSON.stringify({
						borderId: borderId,
						comments: commentValue
					})
				})
				.done(function(response){
					console.log(response);
					location.reload();
				})

			});


			// modify
			$('.modify-btn').on('click',function(){
				$(this).addClass('hidden');
				$('.commet-btn').addClass('hidden');
				$('.content-container').addClass('hidden');
				$('.modify-container').removeClass('hidden');
				$('.modify-container').addClass('show');
				$('.modify-save-btn').removeClass('hidden');
				$('.modify-save-btn').addClass('show');
			});
			$('.modify-save-btn').on('click',function(){
				let modifyText = $('.modify-text').val();
				let modifyContentId = $('.panel-body').data('id');
				console.log(modifyText);
				console.log(modifyContentId);

				$.ajax({
					"url": "/page/border/update",
					"method": "POST",
					"timeout": 0,
					"headers": {
						"Content-Type": "application/json",
					},
					"data":JSON.stringify({
						id: modifyContentId,
						content: modifyText
					})
				})
				.done(function(response){
					console.log(response);
					$('.panel-body').append('<div class="alert-tag alert alert-success" role="alert">저장되었습니다.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>')
					setTimeout(function(){
						$('.close').trigger('click');
						location.href= '/'
					},600);

					$('.close').on('click',function(){
						location.href= "/"
					});
				})
			});
			
			// delete commnet
			$('.delete-comment-btn').on('click',function(){
				let commentId = $(this).parents('.comment-list').data('comment-id');
				console.log(commentId);
				
				
				$.ajax({
					"url": "/page/border/commnet/delete",
					"method": "POST",
					"timeout": 0,
					"headers": {
						"Content-Type": "application/json",
					},
					"data":JSON.stringify({
						id: commentId
					})
				})
				.done(function(response){
					console.log(response);
					$('.panel-body').append('<div class="alert-tag alert alert-danger" role="alert">삭제되었습니다..<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>')
					setTimeout(function(){
						location.reload();	
					},600);
				})
			});

		});
	</script>
</body>
</html>
