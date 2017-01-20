package net.iotek.service.impl;

import net.iotek.dao.StorageDao;
import net.iotek.entity.Storage;
import net.iotek.entity.result.StorageGood;
import net.iotek.service.StorageService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Service
public class StorageServiceImpl implements StorageService {

    @Resource
    private StorageDao storageDao;

    @Override
    public void addGood(Storage storage) {
        storage.setCreatetime(new Timestamp(System.currentTimeMillis()));
        storageDao.addGood(storage);
    }

    @Override
    public int findIsExist(Integer goodId, Long userId) {
        Map<String,Object> param=new HashedMap();
        param.put("goodId",goodId);
        param.put("userId",userId);
        return storageDao.findIsExist(param);
    }

    @Override
    public void updateGoodNum(Integer goodId, Long userId) {
        Map<String,Object> param=new HashedMap();
        param.put("goodId",goodId);
        param.put("userId",userId);
        storageDao.updateGoodNum(param);
    }

    @Override
    public List<StorageGood> showStorage(Long userId) {
        return storageDao.showStorage(userId);
    }

    @Override
    public void delStorageGood(Integer Id) {
        storageDao.delStorageGood(Id);
    }

    @Override
    public int storageGoodNum(Long userId) {
        return storageDao.storageGoodNum(userId);
    }

    @Override
    public Storage findById(Integer Id) {
        return storageDao.findById(Id);
    }
}
