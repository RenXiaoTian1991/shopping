package net.iotek.service;

import net.iotek.entity.User;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/17.
 */
public interface UserService {

    /**
     * 用户登录
     * @param name 用户名
     * @param password 密码(未加密)
     * @return
     */
    User login(String name, String password);

    /**
     * 更改密码
     * @param user 用户信息
     */
    void updatePassword(User user);

    /**
     * 增加用户
     * @param name
     * @param password 密码(未加密)
     */
    boolean addUser(String name, String password);

    /**
     * 更新用户信息
     * @param user
     */
    void updateUser(User user);
}
