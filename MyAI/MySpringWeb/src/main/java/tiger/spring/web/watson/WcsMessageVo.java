package tiger.spring.web.watson;

import java.util.List;
import java.util.Map;

import com.ibm.watson.developer_cloud.conversation.v1.model.Entity;
import com.ibm.watson.developer_cloud.conversation.v1.model.Intent;

public class WcsMessageVo {
	
	private Map<String, Object> wcsContext;
	private List<Entity>		wcsEntity;
	private List<Intent>		wcsIntent;
	private Map<String, Object> wcsInput;
	private Map<String, Object> wcsOutput;
	private String				wcsInputText;
	private List<String>		wcsText;
	private String				wcsTextCon;
	private String 				resGenText;	// Reponse Generator Text
	
	public Map<String, Object> getWcsContext() {
		return wcsContext;
	}
	public void setWcsContext(Map<String, Object> wcsContext) {
		this.wcsContext = wcsContext;
	}
	public List<Entity> getWcsEntity() {
		return wcsEntity;
	}
	public void setWcsEntity(List<Entity> wcsEntity) {
		this.wcsEntity = wcsEntity;
	}
	public List<Intent> getWcsIntent() {
		return wcsIntent;
	}
	public void setWcsIntent(List<Intent> wcsIntent) {
		this.wcsIntent = wcsIntent;
	}
	public Map<String, Object> getWcsInput() {
		return wcsInput;
	}
	public void setWcsInput(Map<String, Object> wcsInput) {
		this.wcsInput = wcsInput;
	}
	public Map<String, Object> getWcsOutput() {
		return wcsOutput;
	}
	public void setWcsOutput(Map<String, Object> wcsOutput) {
		this.wcsOutput = wcsOutput;
	}
	public String getWcsInputText() {
		return wcsInputText;
	}
	public void setWcsInputText(String wcsInputText) {
		this.wcsInputText = wcsInputText;
	}
	public List<String> getWcsText() {
		return wcsText;
	}
	public void setWcsText(List<String> wcsText) {
		this.wcsText = wcsText;
	}
	public String getWcsTextCon() {
		return wcsTextCon;
	}
	public void setWcsTextCon(String wcsTextCon) {
		this.wcsTextCon = wcsTextCon;
	}
	public String getResGenText() {
		return resGenText;
	}
	public void setResGenText(String resGenText) {
		this.resGenText = resGenText;
	}
	@Override
	public String toString() {
		return "WcsMessageVo [wcsContext=" + wcsContext + ", wcsInput=" + wcsInput + ", wcsOutput=" + wcsOutput
				+ ", wcsInputText=" + wcsInputText + ", wcsText=" + wcsText + ", wcsTextCon=" + wcsTextCon
				+ ", resGenText=" + resGenText + "]";
	}
}
