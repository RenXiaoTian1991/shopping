package net.iotek.controller;

import net.iotek.entity.User;
import net.iotek.service.StorageService;
import net.iotek.service.UserService;
import net.iotek.utils.UploadImages;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/17.
 */
@Controller
public class UserController extends BaseController {

	@Resource
	private UserService userService;

	@Resource
	private StorageService storageService;

	@RequestMapping("/register")
	public String register(String username, String password) {

		boolean result = userService.addUser(username, password);
		if (result) {
			User user = userService.login(username, password);
			setCurrentLoginUser(user);
			return "redirect:/index";
		}
		return "redirect:/login";
	}

	@RequestMapping("/tologin")
	public String tologin(String username, String password) {

		User user = userService.login(username, password);
		if (user != null) {
			setCurrentLoginUser(user);
			return "redirect:/index";
		}
		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login() {

		return "login";
	}

	@RequestMapping("/index")
	public String index(Model model) {

		if (currentLoginUser() != null) {
			model.addAttribute("user", currentLoginUser());
			model.addAttribute("storageNum", storageService.storageGoodNum(currentLoginUserShopId()));
			return "index";
		}
		return "redirect:/login";
	}

	@RequestMapping("/logout")
	public String logout() {

		removeCurrentLoginUser();
		return "redirect:/login";
	}

	@ResponseBody
	@RequestMapping("/password/update")
	public String updatePassword(String oldpwd, String password) {

		User user = currentLoginUser();
		if (user != null && StringUtils.isNotBlank(oldpwd) && StringUtils.isNotBlank(password)) {
			if (DigestUtils.md5Hex(oldpwd).equals(user.getPassword())) {
				user.setPassword(DigestUtils.md5Hex(password));
				userService.updatePassword(user);
				return "success";
			}
			return "wrong";
		}
		return "fail";
	}

	@RequestMapping("/updateUser")
	public String updateUser(HttpServletRequest request, User user, MultipartFile logofile) {

		UploadImages uploadImages = new UploadImages();
		if (logofile != null && !logofile.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("/pictures");  //上传的路径
			String bigImg = uploadImages.upLoadImage(request, logofile, path);
			user.setLogo(bigImg);
		}
		userService.updateUser(user);
		removeCurrentLoginUser();
		setCurrentLoginUser(user);
		return "redirect:/index";
	}

}
