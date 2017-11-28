package tiger.spring.web.common;

import java.util.Calendar;

public class CalendarUtil {

	public static String getDay() {
		int 	dayInt 	= Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
		String 	dayStr	= "";
		switch (dayInt) {
	    case 1:
	    	dayStr = "일요일";
	        break;
	    case 2:
	    	dayStr = "월요일";
	        break;
	    case 3:
	    	dayStr = "화요일";
	        break;
	    case 4:
	    	dayStr = "수요일";
	        break;
	    case 5:
	    	dayStr = "목요일";
	        break;
	    case 6:
	    	dayStr = "금요일";
	        break;
	    case 7:
	    	dayStr = "토요일";
	        break;
		}
		return dayStr;
	}
		
	public static String getHourFrame() {
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		if(hour < 6) {
			return "새벽";
		} else if(hour >= 6 && hour <12) {
			return "오전";
		} else if(hour >= 12 && hour<18) {
			return "오후";
		} else if(hour >= 18) {
			return "저녁";
		} 
		return ""; 
	}		
	
	public static int getMonth() {
		return Calendar.getInstance().get(Calendar.MONTH)+1;
	}
}
