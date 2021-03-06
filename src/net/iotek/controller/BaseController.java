package net.iotek.controller;

import net.iotek.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


public class BaseController {
	public static final String LOGIN_USER = "shopping_login_user";

	protected Logger logger = LoggerFactory.getLogger(getClass());

	public User currentLoginUser() {

		ServletRequestAttributes requestAttributes = getServletRequestAttributes();
		User user = (User) requestAttributes.getAttribute(LOGIN_USER, RequestAttributes.SCOPE_SESSION);
		return user;
	}

	public Long currentLoginUserShopId() {

		User user = currentLoginUser();
		return user.getId();
	}

	public void setCurrentLoginUser(User user) {

		Assert.notNull(user);
		ServletRequestAttributes requestAttributes = getServletRequestAttributes();
		requestAttributes.setAttribute(LOGIN_USER, user, RequestAttributes.SCOPE_SESSION);
	}

	public void removeCurrentLoginUser() {

		ServletRequestAttributes requestAttributes = getServletRequestAttributes();
		requestAttributes.removeAttribute(LOGIN_USER, RequestAttributes.SCOPE_SESSION);
	}

	protected ServletRequestAttributes getServletRequestAttributes() {

		ServletRequestAttributes webRequest = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		return webRequest;
	}

}
