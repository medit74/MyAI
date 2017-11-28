package tiger.spring.web.sample;

import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping("/index.do")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("greeting", getGreeting());
		logger.debug(mav.toString());		
		return mav;
	}	
	
	@RequestMapping("/hello.do")
	public ModelAndView hello() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hello");
		mav.addObject("greeting", getGreeting());
		logger.debug(mav.toString());
		return mav;
	}
	
	private String getGreeting() {
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		if(hour >= 6 && hour <=10) {
			return "좋은 아침입니다.";
		} else if(hour >= 12 && hour<=15) {
			return "점심 식사 하셨어요";
		} else if(hour >= 18 && hour<=22) {
			return "좋은 밤 되세요";
		} 
		return "안녕하세요"; 
	}
}
