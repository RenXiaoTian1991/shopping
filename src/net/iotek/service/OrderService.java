package net.iotek.service;

import net.iotek.entity.Orders;

import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
public interface OrderService {

    /**
     * 根据订单状态查询订单
     * @return
     */
    List<Orders> selectOrderByStatus(Integer orderstatus,Long userId);

    /**
     * 创建订单
     * @param orders
     */
    void createOrder(Orders orders);

    /**
     * 删除订单
     * @param Id
     */
    void deleteOrder(Integer Id);

    /**
     * 根据商品Id和用户Id查询订单
     * @param goodId
     * @param userId
     * @return
     */
    Orders findOrderByGoodIdAndUserId(Integer goodId,Long userId);

    /**
     * 根据订单Id查询订单
     * @param id
     * @return
     */
    Orders selectOrderById(Integer id);

    /**
     * 订单付款
     * @param orders
     * @return
     */
    boolean orderPay(Orders orders);

    /**
     * 更新订单发货状态
     * @param Id
     */
    void updateOrderStatus(Integer Id);
}
