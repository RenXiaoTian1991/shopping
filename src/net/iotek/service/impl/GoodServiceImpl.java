package net.iotek.service.impl;

import net.iotek.dao.GoodDao;
import net.iotek.entity.Good;
import net.iotek.service.GoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Service
public class GoodServiceImpl implements GoodService {

    @Resource
    private GoodDao goodDao;

    @Override
    public List<Good> findGoodList() {
        return goodDao.goodList();
    }

    @Override
    public List<Good> findGoodOnline() {
        return goodDao.findGoodOnline();
    }

    @Override
    public void addGood(Good good) {
        goodDao.addGood(good);
    }

    @Override
    public void deleteGood(Integer id) {
        goodDao.deleteGood(id);
    }

    @Override
    public void updateGood(Good good) {
        goodDao.updateGood(good);
    }

    @Override
    public Good findGoodById(Integer Id) {
        return goodDao.findGoodById(Id);
    }
}
