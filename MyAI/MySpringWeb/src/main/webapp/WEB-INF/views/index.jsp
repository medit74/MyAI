<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>Spring &amp; Bootstrap Template</title>

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
		<div class="jumbotron" style="padding-left:50px; padding-right:50px;">
			<h1 class="text-center">AI Assistant for T world</h1>
			<h4 class="text-right" style="color:#ff0000;">Powered by 인공지능사관학교</h4>
		</div>
		<div class="row">
			<div class="col-md-6" >
			
				<!-- User Interface -->
				<div class="row" style="padding-left:30px; padding-right:30px">
					<h2 class="text-left" style="text-decoration:underline">User Interface</h2>
					<div class="row">
						<form method="post" action="wcsMessage.do"	role="form" id="frmWcsMessage">
							<input type="hidden" name="wcsInputMethod" value="text">
							<div class="form-group">
								<label for="Input Text" class="control-label">고객입력</label>
								<input class="form-control" type="text" id="wcsUserInput" name="wcsUserInput" placeholder="원하시는 것을 말씀하세요">
							</div>
							<div class="form-group">
								<label for="Output Text" class="control-label">인공지능</label>
								<p><mark>${resGenText}</mark></p>
							</div>
							<div class="form-group ${param.wcsInputMethod=='speech'?'show':'hide'}">
								<label for="Output Text" class="control-label">음성인식</label>
								<p class="text-primary">${param.wcsUserInput}</p>
							</div>							
							<div class="form-group">
								<input type="button" class="btn btn-primary btn-block" value="Message 보내기" onclick="sendWcsMessage()"> 
							</div>
							<div class="form-group">
								<label for="Output Text" class="control-label">음성인식 상태</label>
								<p class="text-primary" id="isActivatedStt">On</p>
							</div>			
							<div class="form-group">
								<input type="button" class="btn btn-block btn-success" id="btnSttActivate" value="음성인식 비활성화하기" onclick="toggleStt()"> 
							</div>												
						</form>
					</div>
				</div>

				<!-- Supplementary Area -->
				<div class="row" style="padding-left:30px; padding-right:30px">
					<h2 class="text-left" style="text-decoration:underline">Supplementary Area</h2>
					<!-- Start : T끼리 데이터 선물 조르기 -->
					<div class="${wcsTextCon=='form:data.request'?'show':'hide'}">
						<h3 class="text-left">데이터 선물 조르기</h3>
						<form method="post"	action="aiDataRequest.do" role="form" id="frmAiDataRequest">
							<div class="form-group">
								<label for="Data Request Size" class="control-label">받고 싶은 데이터</label>
								<select class="form-control" name="dataRequestSize"	title="받고 싶은 데이터" id="data">
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
							<div class="form-group">
								<label for="Output Text" class="control-label">조르기 대상 전화번호</label>
								<input class="form-control" type="text" name="dataRequestPhone"	maxlength=11 placeholder="데이터 선물을 요청할 전화번호를 입력하세요">
							</div>
							<div class="form-group">
								<input type="button" class="btn btn-primary btn-block" value="조르기" onclick="aiDataRequest()">
							</div>
						</form>
					</div>
					<!-- End : T끼리 데이터 선물 조르기 -->
					<!-- Start : 청구요금테이블 -->
					<div class="${wcsTextCon=='table:bill.amount'?'show':'hide'}">
						<h3 class="text-left">최근 6개월 청구내역 보기</h3>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>청구 월</th>
									<th>청구금액</th>
									<th>미납금액</th>
									<th>납부방법</th>
								</tr>
							</thead>
							<tr>
								<th>8월</th>
								<th>77,820원</th>
								<th>0원</th>
								<th>카드자동납부</th>
							</tr>
							<tr>
								<th>7월</th>
								<th>77,820원</th>
								<th>0원</th>
								<th>카드자동납부</th>
							</tr>
							<tr>
								<th>6월</th>
								<th>77,820원</th>
								<th>0원</th>
								<th>카드자동납부</th>
							</tr>
							<tr>
								<th>5월</th>
								<th>77,210원</th>
								<th>0원</th>
								<th>카드자동납부</th>
							</tr>
							<tr>
								<th>4월</th>
								<th>75,210원</th>
								<th>0원</th>
								<th>카드자동납부</th>
							</tr>
							<tr>
								<th>3월</th>
								<th>75,210원</th>
								<th>0원</th>
								<th>카드자동납부</th>
							</tr>
						</table>
					</div>
					<!-- End : 청구요금테이블 -->					
					<!-- Start : Naver Maps Api -->
					<div class="${wcsTextCon=='maps:mbr.point.remain'?'show':'hide'}">
						<h3 class="text-left">가맹점 위치</h3>
						<div id="map" style="width: 100%; height: 400px;"></div>
						<div>
							<br />
						</div>
					</div>
					<script>
						var mapOptions = {
							center : new naver.maps.LatLng(37.38495, 127.120514),
							logoConrol : false,
							scrollWheel : true,
							zoom : 13
						};
						var map = new naver.maps.Map('map', mapOptions);
						var marker = new naver.maps.Marker({
							position : new naver.maps.LatLng(37.38495,
									127.120514),
							map : map
						});
					</script>
					<!-- End : Naver Maps Api -->
					<!-- Start : 문자보내기 -->
					<div class="${wcsTextCon=='form:sms.send'?'show':'hide'}">
						<h3 class="text-left">문자보내기</h3>
						<form method="post"	action="aiSendSms.do" role="form" id="frmAiSendSms">
							<div class="form-group">
								<label for="Data Request Size" class="control-label">내용</label>
								<textarea class="form-control" cols="40" rows="10" id="smsData" name="smsData" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="form-group">
								<label for="Output Text" class="control-label">수신 전화번호</label>
								<input class="form-control" type="text" name="smsPhone" maxlength=11 placeholder="문자 수신 전화번호를 입력하세요">
							</div>
							<div class="form-group">
								<input type="button" class="btn btn-primary btn-block" value="무료 문자 보내기" onclick="aiSendSms()">
							</div>
						</form>
					</div>
					<!-- End : T끼리 데이터 선물 조르기 -->
				</div>
				
				<!-- Marketing Area -->
				<div class="row" style="padding-left:30px; padding-right:30px">
					<h2 class="text-left" style="text-decoration:underline">Marketing Area (based on Dialog)</h2>
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject=='DATA'?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=2&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000409&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/data_ad.jpg" class="img-responsive img-rounded"></a>
					</div>
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject=='MBR'?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=1&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000435&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/mbr_ad.jpg" class="img-responsive img-rounded"></a>
					</div>
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject=='ROAM'?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=2&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000401&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/roam_ad.jpg" class="img-responsive img-rounded"></a>
					</div>
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject=='BILL'?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=3&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000312&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/bill_ad.jpg" class="img-responsive img-rounded"></a>
					</div>
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject=='PLAN'?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=1&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000431&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/plan_ad.jpg" class="img-responsive img-rounded"></a>
					</div>
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject=='DEVICE'?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=1&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000385&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/device_ad.jpg" class="img-responsive img-rounded"></a>
					</div>			
					<div class="${sessionScope.wcsContext.ctx_casual_dialog_subject==''?'show':'hide'}">
						<a href="http://tevent.tworld.co.kr/eventservlet.do?PR_NM=&GUBUN=START&GIFT_FLAG=&SHOWGUBUN=thumbnail&LoginFlag=Y&PR_NM_DISP=&serviceId=S_EVEN0011&CURR_PAGE=2&COMMAND=DETAIL2&LIST_CNT=10&PR_NUM=TW000000395&viewId=V_EVEN0033&userIdntId=6333de0c110cdad40114ae05745322b420030623092113&twd_param=2970BFE40D8C99046D82D18AA424A47D4C1E347B268EFCBF55FC60055210A3AC79E2C40EB2BFE4558D3D6C484492DA62F9D98F9722CBCCD40566CFADB012E506FB7360AB45AAD2550566796FB3B7109B838B07AD6416AFC56B6F82D448DCAADE06DA511777D5A077B720734D008E9537D81938233D6064483DBD879B739C863F7169C654E7686F8F26B0F35FC2B65438547BACE3E07143BD79FBE77B145A1D1AA03B263AC4BE884B4E1D082E081761D86B04465E0CCADE4E938E5F3D6DEBD48C50A43DF9F7E20B8CED9415960F1FF0D5470FAB1DAADD6513DB6F2E6DD518DC8513D965B5BE2E021EA9111788A07D3BDACD495BAFC60D1860" target="_blank">
						<img src="./img/ad/default_ad.jpg" class="img-responsive img-rounded"></a>
					</div>									
				</div>
			</div>
			<div class="col-md-6">
				<div class="row" style="padding-left:30px; padding-right:30px">
					<h2 class="text-left" style="text-decoration:underline">Watson Context Table</h2>
					<div>
						<form class="form-horizontal" method="post" action="wcsContext.do" role="form" id="frmWcsContext">
							<h4>Server-Driven Context</h4>
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
									<th><input class="form-control" type="text"	name="ctxCasualName" value="${sessionScope.wcsContext.ctx_casual_name}"	placeholder="고객명을 넣으세요"></th>
								</tr>
								<tr>
									<th>잔여량(MB)</th>
									<th>ctx_data_remain</th>
									<th><input class="form-control" type="text"	name="ctxDataRemain" value="${sessionScope.wcsContext.ctx_data_remain}"
										placeholder="데이터 잔여량(MB)를 넣어세요"></th>
								</tr>
								<tr>
									<th>선물 경험</th>
									<th>ctx_data_gift_exp_yn</th>
									<th><input class="form-control" type="text"	name="ctxDataGiftExpYn"	value="${sessionScope.wcsContext.ctx_data_gift_exp_yn}"></th>
								</tr>
								<tr>
									<th>조르기 경험</th>
									<th>ctx_data_request_exp_yn</th>
									<th><input class="form-control" type="text"	name="ctxDataRequestExpYn" value="${sessionScope.wcsContext.ctx_data_request_exp_yn}"></th>
								</tr>
								<tr>
									<th>Refill 경험</th>
									<th>ctx_data_refill_exp_yn</th>
									<th><input class="form-control" type="text"	name="ctxDataRefillExpYn" value="${sessionScope.wcsContext.ctx_data_refill_exp_yn}"></th>
								</tr>
								<tr>
									<th>청구요금</th>
									<th>ctx_bill_amount</th>
									<th><input class="form-control" type="text"	name="ctxBillAmount" value="${sessionScope.wcsContext.ctx_bill_amount}" placeholder="청구요금"></th>
								</tr>				
								<tr>
									<th>자동납부</th>
									<th>ctx_bill_autopay_yn</th>
									<th><input class="form-control" type="text"	name="ctxBillAutopayYn" value="${sessionScope.wcsContext.ctx_bill_autopay_yn}"></th>
								</tr>
								<tr>
									<th>납부방법</th>
									<th>ctx_bill_autopay_method</th>
									<th><input class="form-control" type="text"	name="ctxBillAutopayMethod" value="${sessionScope.wcsContext.ctx_bill_autopay_method}" placeholder="자동 납부 방법을 넣으세요"></th>
								</tr>																				
								<tr>
									<th>잔여 멤버십 포인트</th>
									<th>ctx_mbr_point_remain</th>
									<th><input class="form-control" type="text"	name="ctxMbrPointRemain" value="${sessionScope.wcsContext.ctx_mbr_point_remain}" placeholder="잔여 멤버십 포인트"></th>
								</tr>
								<tr>
									<th>추천 멤버십</th>
									<th>ctx_mbr_recommand</th>
									<th><input class="form-control" type="text"	name="ctxMbrRecommand" value="${sessionScope.wcsContext.ctx_mbr_recommand}"	placeholder="추천 가맹점을 넣으세요"></th>
								</tr>
								<tr>
									<th>잔여 무료 영화</th>
									<th>ctx_mbr_movie_remain</th>
									<th><input class="form-control" type="text"	name="ctxMbrMovieRemain" value="${sessionScope.wcsContext.ctx_mbr_movie_remain}" placeholder="잔여 영화 회수를 넣으세요"></th>
								</tr>
								<tr>
									<th>이전 로밍 국가</th>
									<th>ctx_roaming_pre_nation</th>
									<th><input class="form-control" type="text"	name="ctxRoamingPreNation" value="${sessionScope.wcsContext.ctx_roaming_pre_nation}" placeholder="이전 로밍 국가명을 넣으세요"></th>
								</tr>
								<tr>
									<th>로밍 카드 경험</th>
									<th>ctx_roaming_card_exp_yn</th>
									<th><input class="form-control" type="text"	name="ctxRoamingCardExpYn" value="${sessionScope.wcsContext.ctx_roaming_card_exp_yn}"></th>
								</tr>
							</table>
							<h4>Watson-Driven Context</h4>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="success">
										<th>Context 이름</th>
										<th>Context 키</th>
										<th>Context 값</th>
									</tr>
								</thead>
								<tr>
									<th>분위기 *</th>
									<th>ctx_casual_mood</th>
									<th><input class="form-control" type="text"	name="ctxCasualMood" value="${sessionScope.wcsContext.ctx_casual_mood}"></th>
								</tr>
								<tr>
									<th>대화주제 *</th>
									<th>ctx_casual_dialog_subject</th>
									<th><input class="form-control" type="text"	name="ctxCasualDialogSubject" value="${sessionScope.wcsContext.ctx_casual_dialog_subject}"></th>
								</tr>
								<tr>
									<th>청구월 *</th>
									<th>ctx_bill_month</th>
									<th><input class="form-control" type="text"	name="ctxBillMonth" value="${sessionScope.wcsContext.ctx_bill_month}" readonly></th>
								</tr>
								<tr>
									<th>관심 로밍 국가 *</th>
									<th>ctx_roaming_nation</th>
									<th><input class="form-control" type="text"	name="ctxRoamingNation"	value="${sessionScope.wcsContext.ctx_roaming_nation}" readonly></th>
								</tr>
								<tr>
									<th>이전 로밍 D.H. *</th>
									<th>ctx_roaming_pre_nation_dh</th>
									<th><input class="form-control" type="text"	name="ctxRoamingPreNationDh" value="${sessionScope.wcsContext.ctx_roaming_pre_nation_dh}"></th>
								</tr>
							</table>							
							<button type="button" class="btn btn-primary" onclick="sendWcsContext(false)">Save changes</button>
							<button type="button" class="btn btn-primary" onclick="sendWcsContext(true)">Initialize</button>
							<a href="./clearSession.do"><button type="button" class="btn" id="clearSession">Clear Session</button></a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<footer style="padding-top:20px; padding-bottom:20px;">
		<div class="container">All Contents copyright&#169; 2017 인공지능사관학교</div>
	</footer>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('input[name="wcsUserInput"]').focus();
			/*
			$('#clearSession').click(function() {
				$.ajax({
					type : "GET",
					url : "./clearSession.json",
					success : function(data) {
						alert("성공");
					}
				});
			});
			*/
			// Annyang Speech Recognition
			annyang.setLanguage("ko");
		    annyang.start({autoRestart: true, continuous: false})
		    var recognition = annyang.getSpeechRecognizer();
		    var final_transcript = '' ;
		    recognition.interimResults = true;
		    recognition.onresult = function(event){
		        var interim_transcript = ' ';
		        final_transcript='';
		        for(var i =event.resultIndex; i<event.results.length; ++i){
		            console.log(i);
		            if(event.results[i].isFinal){
		                final_transcript+=event.results[i][0].transcript;
		                console.log("final_transcript=" +final_transcript);
		                console.log("confidence=" + event.results[i][0].confidence);
		            }else{
		                interim_transcript+=event.results[i][0].transcript;
		                console.log("interim_transcript="+interim_transcript);
		            }
		        }
		        console.log('interim='+interim_transcript+ '|final='+final_transcript);
		        
		        // 호출 Page Processing
	        <c:if test="${wcsTextCon=='form:sms.send'}">
		        $('#smsData').val($('#smsData').val()+final_transcript);
	        </c:if>
	        <c:if test="${wcsTextCon!='form:sms.send'}">
		        $('#wcsUserInput').val(final_transcript);
		        $('input[name="wcsInputMethod"]').val("speech");
		        if(final_transcript != "")
		        	$("#frmWcsMessage").submit();
	        </c:if>
		    };
			//annyang.abort();	
			
			// 채팅상담 (message 정의)
			$('#goLink5-1').on("click", function(e) {
				e.preventDefault();
				var url="http://shop.tworld.co.kr/handler/SmartGuide-LiveChatCheck";
				window.open(url, "", "scrollbars=yes, resize=yes, width=650, height-700");
			});
			
		});
		
		function sendWcsMessage() {
			$("#frmWcsMessage").submit();
		}
		
		function sendWcsContext(initData) {
			if (initData) {
				$('input[name="ctxCasualName"]').val("고객");
				$('input[name="ctxCasualMood"]').val("");
				$('input[name="ctxCasualDialogSubject"]').val("");
				$('input[name="ctxDataRemain"]').val("3072");
				$('input[name="ctxDataGiftExpYn"]').val("Y");
				$('input[name="ctxDataRequestExpYn"]').val("Y");
				$('input[name="ctxDataRefillExpYn"]').val("Y");
				// $('input[name="ctxBillMonth"]').val("8");
				$('input[name="ctxBillAutopayYn"]').val("Y");
				$('input[name="ctxBillAutopayMethod"]').val("체크/신용카드");
				$('input[name="ctxBillAmount"]').val("69300");
				$('input[name="ctxMbrPointRemain"]').val("200000");
				$('input[name="ctxMbrRecommand"]').val("파리바게뜨");
				$('input[name="ctxMbrMovieRemain"]').val("6");
				// $('input[name="ctxRoamingNation"]').val("");
				$('input[name="ctxRoamingPreNation"]').val("영국");
				$('input[name="ctxRoamingCardExpYn"]').val("N");
				$('input[name="ctxRoamingPreNationDh"]').val("N");
				$('input[name="ctxBillMonth"]').val("");
			}
			$('input[name="wcsInputMethod"]').val("text");
			$('#frmWcsContext').submit();
		}
		
		function aiDataRequest() {
			$('#frmAiDataRequest').submit();
		}
		
		function aiSendSms() {
			$('#frmAiSendSms').submit();
		}		
		
		function toggleStt() {
			if($('#isActivatedStt').text() == 'On') {
				annyang.abort();
				$('#isActivatedStt').text("Off")
				$('#btnSttActivate').removeClass("btn-success");
			} else {
				/* 음성인식 재활성화 중지
				*/
			}
			$('input[name="wcsUserInput"]').focus();
		}
	</script>

</body>
</html>