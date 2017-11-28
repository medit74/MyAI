<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"    	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Spring &amp; Bootstrap Template </title>

    <!-- 부트스트랩 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=UIKw9Stu1BFOGNMWIEwg&submodules=geocoder"></script>
    
  </head>
  <body>
  <div class="container">
  	<div class="row">
      <h1 class="text-center">Hello My Bootstrap World</h1>
    </div>
    <div class="row">
      <div class="col-md-4">
        <h2 class="text-left">Dashboard</h2>
        <p><strong>${greeting} Welcome to visit this site!</strong></p>
        <h4><strong>Produce 101 최종 득표수</strong></h4>
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr class="success">
              <th>순위</th>
              <th>이름</th>
              <th>득표수</th>
            </tr>
          </thead>
		  <tr>         
            <th>1</th>
            <th>소미</th>
            <th><fmt:formatNumber value="858333" /></th>
		  </tr>
		  <tr>         
            <th>2</th>
            <th>세정</th>
            <th><fmt:formatNumber value="525352" /></th>
		  </tr>		
		  <tr>         
            <th>3</th>
            <th>유정</th>
            <th><fmt:formatNumber value="438778" /></th>
		  </tr>
		  <tr>         
            <th>4</th>
            <th>청하</th>
            <th><fmt:formatNumber value="403633" /></th>
		  </tr>	
		  <tr>         
            <th>5</th>
            <th>소혜</th>
            <th><fmt:formatNumber value="229732" /></th>
		  </tr>
		  <tr>         
            <th>6</th>
            <th>결경</th>
            <th><fmt:formatNumber value="218338" /></th>
		  </tr>		
		  <tr>         
            <th>7</th>
            <th>채연</th>
            <th><fmt:formatNumber value="215338" /></th>
		  </tr>
		  <tr>         
            <th>8</th>
            <th>도연</th>
            <th><fmt:formatNumber value="200069" /></th>
		  </tr>	
		  <tr>         
            <th>9</th>
            <th>미나</th>
            <th><fmt:formatNumber value="173762" /></th>
		  </tr>
		  <tr>         
            <th>10</th>
            <th>나영</th>
            <th><fmt:formatNumber value="138726" /></th>
		  </tr>		
		  <tr>         
            <th>11</th>
            <th>연정</th>
            <th><fmt:formatNumber value="136780" /></th>
		  </tr>		  		    
        </table>
      </div>
      <div class="col-md-8">
      <div class="col-md-12 bg-info">
        <h2 class="text-left">Login</h2>
        <div> 
          <form class="form-horizontal" method="post" action="loginProc.do" role="form" id="frm">
          <div class="form-group">
            <label for="UserId" class="col-md-3 control-label"><spring:message code="login.jsp.userId"/></label>
	        <div class="col-md-9">
	          <input class="form-control" type="text" name="userId" value="${userVo.userId}" placeholder="<spring:message code="login.jsp.userId"/>"><form:errors path="userVo.userId" cssClass="error"/>
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="UserPw" class="col-md-3 control-label"><spring:message code="login.jsp.userPw"/></label>
	        <div class="col-md-9">
	          <input class="form-control" type="password" name="userPw" placeholder="<spring:message code="login.jsp.userPw"/>"><form:errors path="userVo.userPw" cssClass="error"/>
	        </div>
	      </div>
	      <div class="form-group">
	        <div class="col-md-3"></div>
	        <div class="col-md-9">
 	        <input type="button" class="btn btn-primary btn-block" value="<spring:message code="login.jsp.submit"/>" onclick="login()">
 	        </div>
	      </div>
	      <div class="form-group">
	      	<div class="col-md-3"></div>
	      	<div class="col-md-9"><p class="text-danger">${message}</p></div>
   	      </div>
   	      </form>
   	    </div>
      </div>
      <div class="col-md-12 bg-warning">
        <h2 class="text-left">Artificial Intelligence</h2>
        <h6 class="text-right text-info">Powered by 인공지능사관학교</h6>
        <div> 
          <form class="form-horizontal" method="post" action="wcsMessage.do" role="form" id="frmWcsMessage">
          <div class="form-group">
            <label for="Input Text" class="col-md-3 control-label">고객입력</label>
	        <div class="col-md-9">
	          <input class="form-control" type="text" id="wcsUserInput" name="wcsUserInput" placeholder="원하시는 것을 말씀하세요">
	        </div>
	      </div>
          <div class="form-group">
            <label for="Output Text" class="col-md-3 control-label">인공지능</label>
	        <div class="col-md-9"><p class="text-primary">${resGenText}</p></div>
	      </div>	      
	      <div class="form-group">
	        <div class="col-md-3"></div>
	        <div class="col-md-9">
 	        <input type="button" class="btn btn-primary btn-block" value="Message 보내기" onclick="sendWcsMessage()">
 	        <input type="button" class="btn btn-primary btn-block" value="Context 변경" data-toggle="modal" data-target="#wcsContext">
 	        </div>
	      </div>
   	      </form>
   	    </div>
   	    <!-- Start : T끼리 데이터 선물 조르기 -->
		<div class="${wcsTextCon=='form:data.request'?'show':'hide'}"> 
          <form class="form-horizontal" method="post" action="aiDataRequest.do" role="form" id="frmAiDataRequest">
          <div class="form-group">
            <label for="Data Request Size" class="col-md-3 control-label">선물 받고 싶은 데이터</label>
	        <div class="col-md-9">
	        	<select class="form-control" name="dataRequestSize" title="선물 받고 싶은 데이터" id="data">
					<option value="" selected>-- 선택 --</option>
					<option value="1024">1GB</option>
					<option value="900">900MB</option>
			        <option value="800">800MB</option>
			        <option value="700">700MB</option>
			        <option value="600">600MB</option>
			        <option value="500">500MB</option>
			        <option value="400">400MB</option>
			        <option value="300">300MB</option>
			        <option value="200">200MB</option>
			        <option value="100">100MB</option>
				</select>
	        </div>
	      </div>
          <div class="form-group">
            <label for="Output Text" class="col-md-3 control-label">선물 조르기 할 전화번호</label>
	        <div class="col-md-9">
				<input class="form-control" type="text" name="dataRequestPhone" maxlength=11 placeholder="데이터 선물을 요청할 전화번호를 입력하세요">        
	        </div>
	      </div>	      
	      <div class="form-group">
	        <div class="col-md-3"></div>
	        <div class="col-md-9">
 	        <input type="button" class="btn btn-primary btn-block" value="조르기" onclick="aiDataRequest()">
 	        </div>
	      </div>
   	      </form>
   	    </div> 
   	    <!-- End : T끼리 데이터 선물 조르기 -->  	
   	    <!-- Start : Naver Maps Api -->
   	    <div class="${wcsTextCon=='maps:mbr.point.remain'?'show':'hide'}"> 
   	      <div id="map" style="width:100%;height:400px;">
   	      </div>
   	      <div>
   	      <br/>
   	      </div>
   	    </div>
   	    <script>
			var mapOptions = {
    			center: new naver.maps.LatLng(37.38495, 127.120514),
    			logoConrol: false,
    			scrollWheel: true,
    			zoom: 13
			};
			var map = new naver.maps.Map('map', mapOptions);
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(37.38495, 127.120514),
			    map: map
			});
		</script>
   	    <!-- End : Naver Maps Api -->
   	  </div>
   	  </div>  
    </div>   
  </div> 
  
  <!-- Watson Conversation Context Set Modal -->
  <div class="modal fade" id="wcsContext" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h2 class="modal-title">Watson Conversation Context Set</h2>
        </div>
        <form class="form-horizontal" method="post" action="wcsContext.do" role="form" id="frmWcsContext">
        <div class="modal-body">
          <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr class="success">
              <th>Context 이름</th>
              <th>Context 키</th>
              <th>Context 값</th>
            </tr>
          </thead>
		  <tr>         
            <th>고객명</th>
            <th>ctx_casual_name</th>
            <th><input class="form-control" type="text" name="ctxCasualName" value="${sessionScope.wcsContext.ctx_casual_name}" placeholder="고객명을 넣으세요"></th>
		  </tr>
		  <tr>         
            <th>분위기 *</th>
            <th>ctx_casual_mood</th>
            <th><input class="form-control" type="text" name="ctxCasualMood" value="${sessionScope.wcsContext.ctx_casual_mood}"></th>
		  </tr>
		  <tr>         
            <th>대화주제 *</th>
            <th>ctx_casual_dialog_subject</th>
            <th><input class="form-control" type="text" name="ctxCasualDialogSubject" value="${sessionScope.wcsContext.ctx_casual_dialog_subject}"></th>
		  </tr>
		  <tr>         
            <th>잔여량(MB)</th>
            <th>ctx_data_remain</th>
            <th><input class="form-control" type="text" name="ctxDataRemain" value="${sessionScope.wcsContext.ctx_data_remain}" placeholder="데이터 잔여량(MB)를 넣어세요"></th>
		  </tr>
		  <tr>         
            <th>선물 경험</th>
            <th>ctx_data_gift_exp_yn</th>
            <th><input class="form-control" type="text" name="ctxDataGiftExpYn" value="${sessionScope.wcsContext.ctx_data_gift_exp_yn}" ></th>
		  </tr>
		  <tr>         
            <th>조르기 경험</th>
            <th>ctx_data_request_exp_yn</th>
            <th><input class="form-control" type="text" name="ctxDataRequestExpYn" value="${sessionScope.wcsContext.ctx_data_request_exp_yn}" ></th>
		  </tr>
		  <tr>         
            <th>Refill 경험</th>
            <th>ctx_data_refill_exp_yn</th>
            <th><input class="form-control" type="text" name="ctxDataRefillExpYn" value="${sessionScope.wcsContext.ctx_data_refill_exp_yn}" ></th>
		  </tr>
		  <tr>         
            <th>잔여 멤버십 포인트</th>
            <th>ctx_mbr_point_remain</th>
            <th><input class="form-control" type="text" name="ctxMbrPointRemain" value="${sessionScope.wcsContext.ctx_mbr_point_remain}" placeholder="잔여 멤버십 포인트"></th>
		  </tr>
		  <tr>         
            <th>추천 멤버십</th>
            <th>ctx_mbr_recommand</th>
            <th><input class="form-control" type="text" name="ctxMbrRecommand" value="${sessionScope.wcsContext.ctx_mbr_recommand}" placeholder="추천 가맹점을 넣으세요"></th>
		  </tr>
		  <tr>         
            <th>잔여 무료 영화</th>
            <th>ctx_mbr_movie_remain</th>
            <th><input class="form-control" type="text" name="ctxMbrMovieRemain" value="${sessionScope.wcsContext.ctx_mbr_movie_remain}" placeholder="잔여 영화 회수를 넣으세요"></th>
		  </tr>
		  <tr>         
            <th>관심 로밍 국가 *</th>
            <th>ctx_roaming_nation</th>
            <th><input class="form-control" type="text" name="ctxRoamingNation" value="${sessionScope.wcsContext.ctx_roaming_nation}"></th>
		  </tr>
		  <tr>         
            <th>이전 로밍 국가</th>
            <th>ctx_roaming_pre_nation</th>
            <th><input class="form-control" type="text" name="ctxRoamingPreNation" value="${sessionScope.wcsContext.ctx_roaming_pre_nation}" placeholder="이전 로밍 국가명을 넣으세요"></th>
		  </tr>
		  <tr>         
            <th>이전 로밍 D.H. *</th>
            <th>ctx_roaming_pre_nation_dh</th>
            <th><input class="form-control" type="text" name="ctxRoamingPreNationDh" value="${sessionScope.wcsContext.ctx_roaming_pre_nation_dh}"></th>
		  </tr>		  
		  <tr>         
            <th>로밍 카드 경험</th>
            <th>ctx_roaming_card_exp_yn</th>
            <th><input class="form-control" type="text" name="ctxRoamingCardExpYn" value="${sessionScope.wcsContext.ctx_roaming_card_exp_yn}"></th>
		  </tr>
		  </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" onclick="sendWcsContext(false)">Save changes</button>
          <button type="button" class="btn btn-primary" onclick="sendWcsContext(true)">Initialize</button>
          <button type="button" class="btn" id="clearSession">Clear Session</button>
        </div>
        </form>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->  
  
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/startannyang.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() { 
    		$('input[name="wcsUserInput"]').focus(); 
    		
    		$('#clearSession').click(function() {
    			$.ajax({
    				type : "GET",
    				url : "./clearSession.json",
    				success : function(data) {    
    					alert("성공");
 			        }
    			}); 
    		});
    	});
    	function login() {
    		document.getElementById("frm").submit();
    	}
    	function sendWcsMessage() {
    		$("#frmWcsMessage").submit();
    	}
    	function sendWcsContext(initData) {
    		if(initData) {
    			$('input[name="ctxCasualName"]').val("고객");
    			$('input[name="ctxCasualMood"]').val("");
    			$('input[name="ctxCasualDialogSubject"]').val("");
    			$('input[name="ctxDataRemain"]').val("3072");
    			$('input[name="ctxDataGiftExpYn"]').val("N");
    			$('input[name="ctxDataRequestExpYn"]').val("N");
    			$('input[name="ctxDataRefillExpYn"]').val("N");
    			$('input[name="ctxMbrPointRemain"]').val("200000");
    			$('input[name="ctxMbrRecommand"]').val("");
    			$('input[name="ctxMbrMovieRemain"]').val("6");
    			// $('input[name="ctxRoamingNation"]').val("");
    			$('input[name="ctxRoamingPreNation"]').val("");
    			$('input[name="ctxRoamingCardExpYn"]').val("N");
    			$('input[name="ctxRoamingPreNationDh"]').val("N");
    		}
    		$('#frmWcsContext').submit();
    	}
    	function aiDataRequest() {
    		$('#frmAiDataRequest').submit();
    	}
	</script>    
    
  </body>
</html>