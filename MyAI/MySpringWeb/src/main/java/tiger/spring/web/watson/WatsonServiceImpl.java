package tiger.spring.web.watson;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibm.watson.developer_cloud.conversation.v1.ConversationService;
import com.ibm.watson.developer_cloud.conversation.v1.model.Entity;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageRequest;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;

import tiger.spring.web.common.CalendarUtil;

@Service("watsonService")
public class WatsonServiceImpl implements WatsonService  {
	
	private static final Logger logger = LoggerFactory.getLogger(WatsonServiceImpl.class);
	
	private final String USERNAME 	= "7373c88a-43fe-4f6d-84a3-a30bfbc73fe7";
	private final String PASSWORD 	= "hSHhIhqx3Ig2";
	private final String ENDPOINT 	= "https://gateway.aibril-watson.kr/assistant/api";
	private final String WORKSPACEID= "4e5609c6-265e-4c32-81c4-c5fcc585a911";	   
	
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private WatsonDao watsonDao;
	
	@Transactional
	public WcsMessageVo callWcsMessages(Map<String, Object> wcsContext,  String wcsUserInput) {
		
		// Watson Service
	    ConversationService service = new ConversationService(ConversationService.VERSION_DATE_2017_02_03);
	    service.setUsernameAndPassword(this.USERNAME, this.PASSWORD);
	    service.setEndPoint(this.ENDPOINT);

	    // MessageRequest
	    MessageRequest  messageRequest  = new MessageRequest.Builder().context(wcsContext).inputText(wcsUserInput).build();
	    
	    // Call Watson Service
	    MessageResponse messageResponse = service.message(this.WORKSPACEID, messageRequest).execute();
	    System.out.println(messageRequest);
	    System.out.println(messageResponse);
	    
	    // MessageResponse
	    WcsMessageVo wcsMessageVo = new WcsMessageVo();
	    wcsMessageVo.setWcsContext	(messageResponse.getContext());
	    wcsMessageVo.setWcsEntity	(messageResponse.getEntities());
	    wcsMessageVo.setWcsIntent	(messageResponse.getIntents());
	    wcsMessageVo.setWcsInput	(messageResponse.getInput());
	    wcsMessageVo.setWcsOutput	(messageResponse.getOutput());
	    wcsMessageVo.setWcsInputText(messageResponse.getInputText());
	    wcsMessageVo.setWcsText		(messageResponse.getText());
	    wcsMessageVo.setWcsTextCon	(messageResponse.getTextConcatenated(" ")); 												// Output Meesage from Watson Response
	    wcsMessageVo.setResGenText  (this.replaceText(messageResponse.getTextConcatenated(" "), messageResponse.getContext(), messageResponse.getEntities())); // Output Message by Reponse generator
	    
	    logger.debug(wcsMessageVo.toString());
	    watsonDao.collectUtterance(wcsMessageVo);
	    
		return wcsMessageVo;
	}
	
	// Response Generator
	private String replaceText(String wcsTextCon, Map<String, Object> wcsContext, List<Entity> wcsEntity) {
		
		logger.debug(wcsTextCon);
		logger.debug(wcsContext.toString());
		
		String replacedText = wcsTextCon;

		// Response Generator
		if(wcsTextCon.startsWith("replace:") || wcsTextCon.startsWith("form:") || wcsTextCon.startsWith("maps:") || wcsTextCon.startsWith("table:") ||
		   wcsTextCon.startsWith("forward:")) {
			String messageCode = "";
			if(wcsTextCon.startsWith("replace:") || wcsTextCon.startsWith("forward:"))
				messageCode = wcsTextCon.substring(8);
			if(wcsTextCon.startsWith("form:") || wcsTextCon.startsWith("maps:"))
				messageCode = wcsTextCon.substring(5);
			if(wcsTextCon.startsWith("table:"))
				messageCode = wcsTextCon.substring(6);			
			
			// Response Generator Pre-Process
			if(messageCode.equals("bill.amount")) {
				System.out.println(wcsEntity);
				String billMonthEntity = "";
				for(int i= 0; i<wcsEntity.size(); i++) {
					if(wcsEntity.get(i).getEntity().equals("월")) {
						billMonthEntity = wcsEntity.get(i).getValue();
						break;
					}
				}
				if("전월".equals(billMonthEntity)) {
					wcsContext.put("ctx_bill_month", CalendarUtil.getMonth()-1);
				} else if("전전월".equals(billMonthEntity)) {
					wcsContext.put("ctx_bill_month", CalendarUtil.getMonth()-2);
				} else {
					wcsContext.put("ctx_bill_month", CalendarUtil.getMonth());
				}
			} 		
			
			// Generate Message
			replacedText = messageSource.getMessage(messageCode, this.fillMessage(messageCode, wcsContext), Locale.getDefault());
			
			// // Response Generator Post-Process
			if(messageCode.equals("roam.product.redirect")) {
				if("N".equals(wcsContext.get("ctx_roaming_card_exp_yn")))
					replacedText += messageSource.getMessage("roam.product.addon", this.fillMessage(messageCode, wcsContext), Locale.getDefault());
			}
				
			logger.debug("서버에서 메세지 변경 : {}", replacedText);
		}
		
		return replacedText;
	}
	
	private String[] fillMessage(String messageCode, Map<String, Object> wcsContext) {
		String[] args = null;
		
		switch(messageCode) {
		    case "casual.greeting" :
				args = new String[2];
				args[0] = (String)wcsContext.get("ctx_casual_name");
				args[1] = CalendarUtil.getDay() + " " + CalendarUtil.getHourFrame(); 
				break;		
		    case "casual.aboutme" :
				args = new String[1];
				args[0] = (String)wcsContext.get("ctx_casual_name");
				break;						
		    case "bill.amount" :
				args = new String[2];
				args[0] = wcsContext.get("ctx_bill_month").toString();
				args[1] = (String)wcsContext.get("ctx_bill_amount");
				break;		
		    case "bill.autopay1" :
				args = new String[2];
				args[0] = (String)wcsContext.get("ctx_casual_name");
				args[1] = (String)wcsContext.get("ctx_bill_autopay_method");
				break;	
		    case "bill.autopay2" :
				args = new String[1];
				args[0] = (String)wcsContext.get("ctx_casual_name");
				break;					
		    case "mbr.point.remain" :
				args = new String[3];
				args[0] = (String)wcsContext.get("ctx_casual_name");
				args[1] = (String)wcsContext.get("ctx_mbr_point_remain");
				args[2] = (String)wcsContext.get("ctx_mbr_recommand");
				break;				
			case "roam.service.redirect1" :
				args = new String[2];
				args[0] = (String)wcsContext.get("ctx_roaming_pre_nation");
				args[1] = (String)wcsContext.get("ctx_roaming_nation"); 
				break;		
			case "roam.service.redirect2" :
				args = new String[1];
				args[0] = (String)wcsContext.get("ctx_roaming_nation"); 
				break;
			case "roam.card.redirect1" :
				args = new String[1];
				args[0] = (String)wcsContext.get("ctx_roaming_pre_nation"); 
				break;				
			default : 
				break;
		}
		return args;
	}
}
