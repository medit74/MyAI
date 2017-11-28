package tiger.spring.web.watson;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("watsonDao")
public class WatsonDaoImpl implements WatsonDao  {
	
	private static final Logger logger = LoggerFactory.getLogger(WatsonDaoImpl.class);
	
	public void collectUtterance(WcsMessageVo wcsMessageVo) {
		if(wcsMessageVo.getWcsIntent() != null && wcsMessageVo.getWcsIntent().size() > 0) {
			logger.info(wcsMessageVo.getWcsInputText()+","+wcsMessageVo.getWcsIntent().get(0).getIntent());
		}
	}
	
}
