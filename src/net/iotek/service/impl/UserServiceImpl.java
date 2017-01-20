package net.iotek.service.impl;

import net.iotek.dao.UserDao;
import net.iotek.entity.User;
import net.iotek.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/17.
 */

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public User login(String name, String password) {
        User user=new User();
        user.setName(name);
        user.setPassword(DigestUtils.md5Hex(password));
        return userDao.selectUser(user);
    }

    @Override
    public void updatePassword(User user) {
        userDao.updatePassword(user);
    }

    @Override
    public boolean addUser(String name, String password) {
        if (StringUtils.isNotBlank(name) && StringUtils.isNotBlank(password)){
            User user=new User();
            user.setName(name);
            user.setPassword(DigestUtils.md5Hex(password));
            user.setCreatetime(new Timestamp(System.currentTimeMillis()));
            userDao.addUser(user);
            return true;
        }
        return false;
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

}
