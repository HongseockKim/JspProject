<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>youtube</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<header>
			<nav>
				<ul class="flex-wrap">
					<li class='p-all20 fb-20'><a href='/' class='btn btn-primary'
						role='button'>메인으로</a></li>
					<li class=" low clearfix serach-tag">
						<div class="col-lg-9">
							<div class="input-group">
								<input type="text" class="form-control input-lg search-input"
									placeholder="Search for..."> <span
									class="input-group-btn">
									<button class="btn btn-danger input-lg search-btn"
										type="button">검색</button>
								</span>
							</div>
						</div>
					</li>
				</ul>
			</nav>
		</header>
		<div class="content-con container-fluid">
			<div class="row clearfix" id="main-item-area"></div>
		</div>

		<!-- modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
		      </div>
		      <div class="modal-body">
		      <!-- iframe-tag append area -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			"url": "https://youtube.googleapis.com/youtube/v3/search?key=AIzaSyAWIZ0UIDhPa516MtBksU0uBb4cdaTvNrs&part=snippet&maxResults=45&q=&type=video&order=date&key=AIzaSyAWIZ0UIDhPa516MtBksU0uBb4cdaTvNrs",
			"method": "GET",
			"timeout": 0,
		}).done(function (response) {
			console.log(response)
			var content = "";
			let videoIdValue = '';
				$(response.items).each(function(idx,item){
					content += "<div class='item col-xs-6 col-md-2' data-id='"+ item.id.videoId + "'>";
					content += "<div class='item-wrap'>";
					content += "<div class='thumbnail'>";

					content += "<img style=width:"+item.snippet.thumbnails.high.width+" src="+item.snippet.thumbnails.high.url+" alt='eqweqweqwe'>";
					content += "<div class='caption'>";
					content += "<h3 class='text-left ellipsis '>"+ item.snippet.title +"</h3>";
					content += "<p><a href='#' class='btn btn-primary video-detail-btn' role='button' data-toggle='modal' data-target='#myModal'>영상보기</a></p>";

					content += "</div>"
					content += "</div>"
					content += "</div>"
					content += "</div>";
				})
					$('#main-item-area').append(content);
				videoDetail();

		})
		.fail(function(erroer){
			console.log(erroer)
			if(erroer){
				$('#main-item-area').append(`<div class="alert alert-danger alert-dismissible fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button><h4 id="oh-snap!-you-got-an-error!">데이터 초과!<a class="anchorjs-link" href="#oh-snap!-you-got-an-error!"><span class="anchorjs-icon"></span></a></h4><p>하루 사용량을 다 사용 하셨습니다!!!</p><p><button type="button" class="btn btn-danger" onclick="location.href = '/'")>메인으로</button></p></div>`)
			}
		})

		// serach

		$('.search-btn').on('click',function(){
			let searchValue = $('.search-input').val();
			console.log(searchValue);
			$.ajax({
				"url": "https://youtube.googleapis.com/youtube/v3/search?key=AIzaSyAWIZ0UIDhPa516MtBksU0uBb4cdaTvNrs&part=snippet&maxResults=45&q="+searchValue+"&type=video&order=date",
				"method": "GET",
				"timeout": 0,
			}).done(function (response) {
				console.log(response)
				$('#main-item-area div').remove();
				var content = "";
					console.log(response);
					$(response.items).each(function(idx,item){
						content += "<div class='item col-xs-6 col-md-2' data-id='"+ item.id.videoId + "'>";
						content += "<div class='item-wrap'>";
						content += "<div class='thumbnail'>";

						content += "<img style=width:"+item.snippet.thumbnails.high.width+" src="+item.snippet.thumbnails.high.url+" alt='eqweqweqwe'>";
						content += "<div class='caption'>";
						content += "<h3 class='text-left ellipsis '>"+ item.snippet.title +"</h3>";
						content += "<p><a href='#' class='btn btn-primary video-detail-btn' role='button'>영상보기</a></p>";

						content += "</div>"
						content += "</div>"
						content += "</div>"
						content += "</div>";
					});
						$('#main-item-area').append(content);
					videoDetail();
			});
		});

		// videoDetail

		function videoDetail (videoId) {
			console.log("실행");
			$('.video-detail-btn').on('click',function(e){
				e.preventDefault();
				let videoId = $(this).parents('.item').data("id");
				$('#myModal').removeClass('fade');
				$('#myModal').addClass('fade in');
				console.log("클릭");
				console.log(videoId)
				$('.wrapper .modal iframe').remove();
				let modalContent = "";
				modalContent += "<iframe type='text/html' width='100%' height='100%' src='https://www.youtube.com/embed/"+videoId+"' frameborder='0'></iframe>";

				$('.wrapper .modal .modal-body').append(modalContent);
				$('#myModal .close').on('click',function(){
					console.log('클릭');
					$('.wrapper .modal iframe').remove();
				});
			});

		}

	});

	</script>
</body>
</html>