package tiger.spring.web.sample;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private MessageSource messageSource ;
	@Autowired
	private LocaleResolver localeResolver;
    @Autowired
	protected Validator validator;
	


	@RequestMapping("/loginProc.do")
	public ModelAndView loginProc(@ModelAttribute("userVo") @Valid UserVo reqUserVo, BindingResult bindingResult, HttpServletRequest request, HttpSession session) {
		logger.debug("커맨드객체를 이용하여 구현");
		ModelAndView mav = new ModelAndView("index");
		String message = "";

		// Validation
		if(bindingResult.hasErrors()) {
			logger.info("Validation Error");
			return mav;
		} 
		
		UserVo resUserVo = userService.getUser(reqUserVo.getUserId());
		if(resUserVo == null) {
			message = messageSource.getMessage("login.fail.message", new Object[]{"id"}, localeResolver.resolveLocale(request));
			mav.addObject("message",message);
		} else {
			if(reqUserVo.getUserPw().equals(resUserVo.getUserPw())) {
				mav.setViewName("redirect:/userMain.do");
				mav.addObject("userVo", resUserVo);
				session.setAttribute("userVo", resUserVo);
			} else {
				message = messageSource.getMessage("login.fail.message", new Object[]{"pw"}, localeResolver.resolveLocale(request));
				mav.addObject("message",message);
			}
		}
		logger.debug(mav.toString());
		return mav;
	}	
	
	@RequestMapping("/userMain.do")
	public ModelAndView userMain(HttpSession session) {
		ModelAndView mav = new ModelAndView("userMain");
		
		UserVo userVo = userService.getUser(((UserVo)session.getAttribute("userVo")).getUserId());
		mav.addObject("userVo", userVo);
		logger.debug(mav.toString());
		
		return mav;
	}
	
	@RequestMapping("/{userId}")
	public ModelAndView getUser(@PathVariable String userId) {
		
		UserVo userVo = userService.getUser(userId);
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("xmlData",userVo); 
		
		ModelAndView mav = new ModelAndView("oxmView", model);
		logger.debug(mav.toString());
		
		return mav;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		dataBinder.setValidator(this.validator);
	}

}
