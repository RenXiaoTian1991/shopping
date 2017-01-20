package net.iotek.controller;

import net.iotek.entity.Good;
import net.iotek.entity.Orders;
import net.iotek.entity.Storage;
import net.iotek.entity.User;
import net.iotek.service.GoodService;
import net.iotek.service.OrderService;
import net.iotek.service.StorageService;
import net.iotek.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Controller
public class OrderController extends BaseController {

	@Resource
	private OrderService orderService;

	@Resource
	private GoodService goodService;

	@Resource
	private UserService userService;

	@Resource
	private StorageService storageService;

	@ResponseBody
	@RequestMapping("/create/storage/order")
	public Orders createStorageOrder(Integer storageId) {

		Storage storage = storageService.findById(storageId);
		if (storage != null) {
			Orders order = new Orders();
			Good good = goodService.findGoodById(storage.getGoodId());
			order.setGoodId(storage.getGoodId());
			order.setGoodName(good.getName());
			order.setPrice(good.getPrice());
			order.setGoodnum(storage.getGoodnum());
			User user = currentLoginUser();
			order.setUsername(user.getName());
			order.setAddress(user.getAddress());
			order.setPhone(user.getPhone());
			order.setUserId(user.getId());
			orderService.createOrder(order);

			storageService.delStorageGood(storageId);//删除购物车内容
			return orderService.findOrderByGoodIdAndUserId(order.getGoodId(), user.getId());
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("/create/order")
	public Orders createOrder(Orders order) {

		Good good = goodService.findGoodById(order.getGoodId());
		order.setGoodName(good.getName());
		order.setPrice(good.getPrice());
		User user = currentLoginUser();
		order.setUsername(user.getName());
		order.setAddress(user.getAddress());
		order.setPhone(user.getPhone());
		order.setUserId(user.getId());
		orderService.createOrder(order);
		return orderService.findOrderByGoodIdAndUserId(order.getGoodId(), user.getId());
	}

	@ResponseBody
	@RequestMapping("/order/pay")
	public String orderPay(Integer orderId) {

		User user = currentLoginUser();
		Orders orders = orderService.selectOrderById(orderId);
		if (orders != null) {
			if (user.getMoney() < orders.getAmount()) {
				return "nomoney";
			}
			boolean flag = orderService.orderPay(orders);
			if (flag) {
				user.setMoney(user.getMoney() - orders.getAmount());
				userService.updateUser(user);
				return "success";
			}
		}
		return "fail";
	}

	@ResponseBody
	@RequestMapping("/order/list")
	public List<Orders> selectOrderByStatus(Integer orderstatus) {

		return orderService.selectOrderByStatus(orderstatus, currentLoginUserShopId());
	}

	@ResponseBody
	@RequestMapping("/order/operation")
	public String editOrder(HttpServletRequest request) {

		String Id = request.getParameter("id");
		logger.debug("==============Id:{}", Id);
		orderService.updateOrderStatus(Integer.valueOf(Id));
		return "success";
	}

}
