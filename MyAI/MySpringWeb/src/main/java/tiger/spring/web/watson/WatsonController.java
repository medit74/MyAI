package tiger.spring.web.watson;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WatsonController {
	
	private static final Logger logger = LoggerFactory.getLogger(WatsonController.class);
	
	@Autowired
	private WatsonService watsonService;
	
	@RequestMapping("/wcsMessage.do")
	public ModelAndView WcsMessage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		Object wcsContextObject = session.getAttribute("wcsContext"); 
		String wcsUserInput = request.getParameter("wcsUserInput");		

		Map<String, Object> wcsContext = new HashMap<String, Object>();
		if(wcsContextObject == null) {			
			wcsContext.put("ctx_casual_name", "고객");
		} else {
			wcsContext = (Map<String, Object>)wcsContextObject; 
		}
			
		if(wcsUserInput == null)
			return mav;
		
		// Watson Service
		WcsMessageVo wcsMessageVo = watsonService.callWcsMessages(wcsContext, wcsUserInput);
	    
	    // Response
	    session.setAttribute("wcsContext", wcsMessageVo.getWcsContext());
	    mav.addObject("wcsTextCon", wcsMessageVo.getWcsTextCon());
	    mav.addObject("resGenText", wcsMessageVo.getResGenText());
		
		return mav;
	}	

	@RequestMapping("/wcsContext.do")
	public ModelAndView WcsContext(HttpServletRequest request, HttpServletResponse response, HttpSession session) {	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		String ctxCasualName 			= request.getParameter("ctxCasualName");
		String ctxCasualMood 			= request.getParameter("ctxCasualMood");
		String ctxCasualDialogSubject 	= request.getParameter("ctxCasualDialogSubject");
		String ctxDataRemain			= request.getParameter("ctxDataRemain");
		String ctxDataGiftExpYn			= request.getParameter("ctxDataGiftExpYn");
		String ctxDataRequestExpYn		= request.getParameter("ctxDataRequestExpYn");
		String ctxDataRefillExpYn		= request.getParameter("ctxDataRefillExpYn");
		String ctxBillAmount			= request.getParameter("ctxBillAmount");
		String ctxBillAutopayYn			= request.getParameter("ctxBillAutopayYn");
		String ctxBillAutopayMethod		= request.getParameter("ctxBillAutopayMethod");
		String ctxMbrPointRemain		= request.getParameter("ctxMbrPointRemain");
		String ctxMbrRecommand			= request.getParameter("ctxMbrRecommand");
		String ctxMbrMovieRemain		= request.getParameter("ctxMbrMovieRemain");
		//String ctxRoamingNation			= request.getParameter("ctxRoamingNation");
		String ctxRoamingPreNation		= request.getParameter("ctxRoamingPreNation");
		String ctxRoamingCardExpYn		= request.getParameter("ctxRoamingCardExpYn");
		String ctxRoamingPreNationDh	= request.getParameter("ctxRoamingPreNationDh");
		String ctxBillMonth				= request.getParameter("ctxBillMonth");
		
		logger.debug(ctxCasualName 			      );
		logger.debug(ctxCasualMood 			      );
		logger.debug(ctxCasualDialogSubject 	  );
		logger.debug(ctxDataRemain			      );
		logger.debug(ctxDataGiftExpYn			  );
		logger.debug(ctxDataRequestExpYn		  );
		logger.debug(ctxDataRefillExpYn		      );
		logger.debug(ctxBillAmount		   		  );
		logger.debug(ctxBillAutopayYn			  );
		logger.debug(ctxBillAutopayMethod		  );
		logger.debug(ctxMbrPointRemain		      );
		logger.debug(ctxMbrRecommand			  );
		logger.debug(ctxMbrMovieRemain		      );
		//logger.debug(ctxRoamingNation			  );
		logger.debug(ctxRoamingPreNation		  );
		logger.debug(ctxRoamingCardExpYn		  );
		logger.debug(ctxRoamingPreNationDh	      );
		logger.debug(ctxBillMonth			      );
		
		Object wcsContextObject = session.getAttribute("wcsContext"); 		
		@SuppressWarnings("unchecked")
		Map<String, Object> wcsContext = wcsContextObject == null ? new HashMap<String, Object>() : (Map<String, Object>)wcsContextObject; 
		
		wcsContext.put("ctx_casual_name"			,ctxCasualName);
		wcsContext.put("ctx_casual_mood"			,ctxCasualMood);
		wcsContext.put("ctx_casual_dialog_subject"	,ctxCasualDialogSubject);
		wcsContext.put("ctx_data_remain"			,ctxDataRemain);
		wcsContext.put("ctx_data_gift_exp_yn"		,ctxDataGiftExpYn);
		wcsContext.put("ctx_data_request_exp_yn"	,ctxDataRequestExpYn);
		wcsContext.put("ctx_data_refill_exp_yn"		,ctxDataRefillExpYn);
		wcsContext.put("ctx_bill_amount"			,ctxBillAmount);
		wcsContext.put("ctx_bill_autopay_yn"		,ctxBillAutopayYn);
		wcsContext.put("ctx_bill_autopay_method"	,ctxBillAutopayMethod);
		wcsContext.put("ctx_mbr_point_remain"		,ctxMbrPointRemain);
		wcsContext.put("ctx_mbr_recommand"			,ctxMbrRecommand);
		wcsContext.put("ctx_mbr_movie_remain"		,ctxMbrMovieRemain);
		wcsContext.remove("ctx_roaming_nation");
		wcsContext.put("ctx_roaming_pre_nation"		,ctxRoamingPreNation);
		wcsContext.put("ctx_roaming_pre_nation_dh"	,ctxRoamingPreNationDh);
		wcsContext.put("ctx_roaming_card_exp_yn"	,ctxRoamingCardExpYn);
		wcsContext.put("ctx_bill_month"				,ctxBillMonth);
		
		// Watson Service
		WcsMessageVo wcsMessageVo = watsonService.callWcsMessages(wcsContext, "");
	    
	    // HttpResponse
	    session.setAttribute("wcsContext", wcsMessageVo.getWcsContext());
	    mav.addObject("resGenText", "Context 값을 변경하였습니다.(Server Message)");
		
		return mav;		
	}
	
	/*
	@RequestMapping(value="/clearSession.json", produces="application/json;charset=UTF-8")
	public ModelAndView ClearSession(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		session.invalidate();
		mav.addObject("result", "success");
		
		return mav;
	}
	*/
	
	@RequestMapping(value="/clearSession.do")
	public ModelAndView ClearSession(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		session.invalidate();
		mav.addObject("result", "success");
		
	    // Response
	    mav.addObject("resGenText", "Session이 Clear되었습니다. Context를 Setting후 이용해 주시기 바랍니다.(Server Message)");
		
		return mav;
	}	
	
	@RequestMapping("/aiDataRequest.do")
	public ModelAndView aiDataRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		String dataRequestSize 	= request.getParameter("dataRequestSize");
		String dataRequestPhone = request.getParameter("dataRequestPhone");
		
		// Data Request Processing Service (Need to implement)
	    
	    // Response
	    mav.addObject("resGenText", dataRequestPhone + "에게 " + dataRequestSize + "MB 조르기 메세지를 보냈습니다.(Server Message - Not Real)");
		
		return mav;
	}		
	
	@RequestMapping("/aiSendSms.do")
	public ModelAndView aiSendSms(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		String smsData 	= request.getParameter("smsData");
		String smsPhone = request.getParameter("smsPhone");
		
		// Data Request Processing Service (Need to implement)
	    
	    // Response
	    mav.addObject("resGenText", smsPhone + "번호로 문자를 성공적으로 전송하였습니다. (Server Message - Not Real)");
		
		return mav;
	}	
	
}

