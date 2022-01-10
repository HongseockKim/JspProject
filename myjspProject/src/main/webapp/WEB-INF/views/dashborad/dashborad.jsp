<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Dashborad</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- semantic- ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" ></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<!-- semantic-css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<script src="<%=request.getContextPath()%>/resources/js/dashborad.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dashboard.css">
</head>
<body>
	<div class="wrapper dashborad">
		<div class="container-fluid dashborad-area">
			<div class="row dashborad-main row">
			<div class="dashborad-header col-xs-12">
				<div class="col-xs-4 header-logo">
					<h1>Dash Borad</h1>
				</div>
				<div class="col-xs-8 dash-navigation">
					<button class="ui teal button registrationButton">글 등록<i class="checkmark icon"></i></button>
					<button class="ui teal button calendar-view">달력보기<i class="calendar alternate outline icon"></i></button>
				</div>
			</div>
			  <div class="col-xs-2 left-area">
			  	<ul class="list-group">
				  <li class="list-group-item">
				  	<a href="#" data-link="/"><i class="home icon"></i>Main</a>
				  </li>
				  <li class="list-group-item">Dapibus ac facilisis in<a href="#"></a></li>
				  <li class="list-group-item">Morbi leo risus<a href="#"></a></li>
				  <li class="list-group-item">Porta ac consectetur ac<a href="#"></a></li>
				  <li class="list-group-item">Vestibulum at eros<a href="#"></a></li>
				</ul>
			  </div>
			  <div class="col-xs-10 charjs-area-wrap">
				  <div class="col-xs-12 charjs-area">
				 	 <canvas id="myChart"></canvas>
				  </div>
				  <div class="col-xs-12 card-area">
				  <c:set var = "borderdata" value = "${borderData}"/>
				  	<c:choose >
					  	<c:when test="${not empty borderdata}">
							<c:forEach var="borderdata" items="${borderData}" varStatus="data">
								<div class="col-xs-3">
									<div class="ui card">
									  <div class="image">
									    <img src="https://source.unsplash.com/random/300x200">
									  </div>
									  <div class="content">
									    <a class="header">${borderdata.title}</a>
									    <div class="meta">
									      <span class="date">${borderdata.time}</span>
									    </div>
									    <div class="description">
									      ${borderdata.content}
									    </div>
									  </div>
									 <!--  <div class="extra content">
									    <a>
									      <i class="user icon"></i>
									      22 Friends
									    </a>
									  </div> -->
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p class="erroe-text">출력할 데이터가 없습니다.</p>
						</c:otherwise>
					</c:choose>
				  </div>
			  </div>
			</div>
		</div>


		<div class="ui modal calendar">
			 <i class="close icon"></i>
			 <div class="header">
			    달력
			  </div>
			  <div id="datepicker">

			  </div>
		</div>


		<div class="ui modal data-reg">
		  <i class="close icon"></i>
		  <div class="header">
		    글 등록
		  </div>
		  <div class="image content">
		    <div class="description">
		      <div class="ui header">
		      <div class="form-group">
			    	<label for="title">제목</label>
			    	<input id="title" type="text" class="form-control" placeholder="Text input" data-target=".title-alert">
			  	</div>
				<div class="form-group">
			    	<label for="content">내용</label>
			    	<textarea id="content" class="form-control" rows="5" data-target=".content-alert"></textarea>
			  	</div>

			  	<div class="checkbox">
				  <label>
				    <input id="check" type="checkbox" value="agree" data-target=".check">
				    등록 동의에 체크해주세요
				  </label>
				</div>
				<div class="ui error message hide">
					  <ul class="list">
						  <li class="hide title-alert">
							  <font style="vertical-align: inherit;">
							  	<font style="vertical-align: inherit;">제목을 입력해주세요</font>
							  </font>
						  </li>
						  <li class="hide content-alert">
							  <font style="vertical-align: inherit;">
							  	<font style="vertical-align: inherit;">내용을 입력해주세요</font>
							  </font>
						  </li>
						  <li class="hide content-alert check">
							  <font style="vertical-align: inherit;">
							  	<font style="vertical-align: inherit;">동의 하기에 체크해주세요</font>
							  </font>
						  </li>
					  </ul>
				  </div>
		      </div>
		    </div>
		  </div>
		  <div class="actions">
		    <div class="ui black deny button">
		      취소
		    </div>
		    <div class="ui positive right labeled icon button reg-btn submit">
		      등록하기
		      <i class="checkmark icon"></i>
		    </div>
		  </div>
		</div>
		<div class="ui active modal member-reg ">
			<div class="header">등록하기</div>
			<div class="container-fluid member-reg-wrap">
				<form class="form-horizontal member-reg">
				  <div class="form-group form-group-lg">
				    <label for="userId" class="col-sm-2 control-label" title="중복 확인을 해주세요">아이디</label>
				    <div class="col-sm-10">
				      <input id="userId" type="text" class="form-control" title="중복 확인을 해주세요" placeholder="ID">
				    </div>
				  </div>
				  <div class="form-group form-group-lg">
				    <label for="name" class="col-sm-2 control-label">이름</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="name" placeholder="name">
				    </div>
				  </div>
				  <div class="form-group form-group-lg">
				    <label for="email" class="col-sm-2 control-label">이메일</label>
				    <div class="col-sm-5">
				      <input type="email" class="form-control" id="email" placeholder="email">
				    </div>
				    <div class="col-sm-5">
					    <div class="ui dropdown">
						  <div class="text"></div>
						  <i class="dropdown icon"></i>
						</div>
					</div>
				</div>
				  <div class="form-group form-group-lg">
				    <label for="password" class="col-sm-2 control-label">비밀번호</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="password" placeholder="password">
				    </div>
				  </div>
				  <div class="form-group form-group-lg">
				    <label for="age" class="col-sm-2 control-label">나이</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="age" placeholder="age">
				    </div>
				  </div>
				  <div class="col-xs-12 member-reg-agree-wrap">
				  	<button type="button" class="btn btn-success member-reg-agree">등록하기</button>
				  </div>
			 </form>
			</div>
		</div>
	</div>
</body>
</html>