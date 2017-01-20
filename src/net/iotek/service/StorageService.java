package net.iotek.service;

import net.iotek.entity.Storage;
import net.iotek.entity.result.StorageGood;

import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
public interface StorageService {

    /**
     * 往购物车添加商品
     * @param storage
     */
    void addGood(Storage storage);

    /**
     * 查询购物车是否已经存在指定商品
     * @param goodId
     * @param userId
     * @return
     */
    int findIsExist(Integer goodId,Long userId);

    /**
     * 更新购物车指定商品数量
     * @param goodId
     * @param userId
     */
    void updateGoodNum(Integer goodId,Long userId);

    /**
     * 查询用户购物车商品
     * @param userId
     * @return
     */
    List<StorageGood> showStorage(Long userId);

    /**
     * 删除购物车商品
     * @param Id
     */
    void delStorageGood(Integer Id);

    /**
     * 获取购物车商品数
     * @param userId
     * @return
     */
    int storageGoodNum(Long userId);

    /**
     * 根据Id查询内容
     * @param Id
     * @return
     */
    Storage findById(Integer Id);

}
