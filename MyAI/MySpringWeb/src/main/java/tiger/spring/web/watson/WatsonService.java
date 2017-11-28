package tiger.spring.web.watson;

import java.util.Map;

public interface WatsonService {
	
	public WcsMessageVo callWcsMessages(Map<String, Object> wcsContext,  String wcsUserInput);
	
}
