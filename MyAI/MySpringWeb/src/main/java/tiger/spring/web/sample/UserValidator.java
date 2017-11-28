package tiger.spring.web.sample;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "validation.userId.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "validation.userPw.required");
		UserVo userVo = (UserVo)target;
		if(userVo.getUserPw().length() < 6) {
			errors.rejectValue("password", "validation.userId.short");
		}
	}
}
