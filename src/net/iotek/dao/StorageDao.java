package net.iotek.dao;

import net.iotek.entity.Storage;
import net.iotek.entity.result.StorageGood;
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
public class StorageDao {

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public void addGood(Storage storage){
        sqlSessionTemplate.insert("Storage.addGood",storage);
    }

    public int findIsExist(Map param){
        return sqlSessionTemplate.selectOne("Storage.findIsExist",param);
    }
    public Storage findById(Integer Id){
        return sqlSessionTemplate.selectOne("Storage.findById",Id);
    }

    public void updateGoodNum(Map param){
        sqlSessionTemplate.update("Storage.updateGoodNum",param);
    }

    public List<StorageGood> showStorage(Long userId){
        return sqlSessionTemplate.selectList("Storage.showStorage",userId);
    }

    public void delStorageGood(Integer Id){
         sqlSessionTemplate.delete("Storage.delStorageGood",Id);
    }

    public int storageGoodNum(Long userId){
        return sqlSessionTemplate.selectOne("Storage.storageGoodNum",userId);
    }


}
