package net.iotek.service.impl;

import net.iotek.dao.OrderDao;
import net.iotek.entity.Orders;
import net.iotek.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    private static long orderNum = 0l;
    private static String date;

    /**
     * 生成订单编号
     * @return
     */
    public static synchronized String getOrderNo() {
        String str = new SimpleDateFormat("yyMMddHHmm").format(new Date());
        if (date == null || !date.equals(str)) {
            date = str;
            orderNum = 0l;
        }
        orderNum++;
        long orderNo = Long.parseLong((date)) * 10000;
        orderNo += orderNum;
        return orderNo + "";
    }

    @Override
    public List<Orders> selectOrderByStatus(Integer orderstatus,Long userId) {
        Map<String,Object> param=new HashMap();
        param.put("orderstatus",orderstatus);
        param.put("userId",userId);
        return orderDao.selectOrderByStatus(param);
    }

    @Override
    public void createOrder(Orders orders) {
        if (orders.getGoodnum()==null){
            orders.setGoodnum(1);
        }
        orders.setAmount(orders.getPrice()*orders.getGoodnum());
        orders.setOrderstatus(1);
        orders.setGoodstatus(0);
        orders.setOrdersn(getOrderNo());
        orders.setCreatetime(new Timestamp(System.currentTimeMillis()));
        orderDao.createOrder(orders);
    }

    @Override
    public void deleteOrder(Integer Id) {

    }

    @Override
    public Orders findOrderByGoodIdAndUserId(Integer goodId, Long userId) {
        Map<String,Object> param=new HashMap();
        param.put("goodId",goodId);
        param.put("userId",userId);
        return orderDao.findOrderByGoodIdAndUserId(param);
    }

    @Override
    public Orders selectOrderById(Integer id) {
        return orderDao.selectOrderById(id);
    }

    @Override
    public boolean orderPay(Orders orders) {
        orders.setOrderstatus(2);
        orders.setPaytime(new Timestamp(System.currentTimeMillis()));
        orderDao.updateOrder(orders);
        return true;
    }

    @Override
    public void updateOrderStatus(Integer Id) {
        orderDao.updateOrderStatus(Id);
    }
}
