package net.iotek.service;

import net.iotek.entity.Good;

import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
public interface GoodService {
    /**
     * 查询所有商品
     * @return
     */
    List<Good> findGoodList();

    /**
     * 查询所有上架商品
     * @return
     */
    List<Good> findGoodOnline();

    /**
     * 添加商品
     * @param good
     */
    void addGood(Good good);

    /**
     * 删除商品
     * @param id
     */
    void deleteGood(Integer id);

    /**
     * 更新商品
     * @param good
     */
    void updateGood(Good good);

    /**
     * 根据商品Id查询商品
     * @param Id
     * @return
     */
    Good findGoodById(Integer Id);

}
