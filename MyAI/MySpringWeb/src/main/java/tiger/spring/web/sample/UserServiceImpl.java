package tiger.spring.web.sample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
public class UserServiceImpl implements UserService  {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Transactional
	public UserVo getUser(String userId){
		
		UserVo userVo = new UserVo();
		userVo.setUserId("james");
		userVo.setUserName("제임스");
		userVo.setUserPhone("01012345678");
		userVo.setUserEmail("test@sk.com");
		userVo.setUserPw("1234");
		logger.debug(userVo.toString());
		
		return userVo;
	}
}
