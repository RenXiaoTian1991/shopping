package net.iotek.dao;

import net.iotek.entity.Orders;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Repository
public class OrderDao {

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public List<Orders> selectOrderByStatus(Map param){
        return sqlSessionTemplate.selectList("Orders.selectOrderByStatus",param);
    }

    public Orders selectOrderById(Integer id){
        return sqlSessionTemplate.selectOne("Orders.selectOrderById",id);
    }

    public void createOrder(Orders orders){
        sqlSessionTemplate.insert("Orders.createOrder",orders);
    }

    public Orders findOrderByGoodIdAndUserId(Map param){
        return sqlSessionTemplate.selectOne("Orders.findOrderByGoodIdAndUserId",param);
    }

    public void updateOrder(Orders orders){
        sqlSessionTemplate.update("Orders.updateOrder",orders);
    }

    public void updateOrderStatus(Integer Id){
        sqlSessionTemplate.update("Orders.updateOrderStatus",Id);
    }


}
