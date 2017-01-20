package net.iotek.dao;

import net.iotek.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/17.
 */
@Repository
public class UserDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public User selectUser(User user) {

		return sqlSessionTemplate.selectOne("User.selectUser", user);
	}

	public void updatePassword(User user) {

		sqlSessionTemplate.update("User.updatePassword", user);
	}

	public void addUser(User user) {

		sqlSessionTemplate.insert("User.addUser", user);
	}

	public void updateUser(User user) {

		sqlSessionTemplate.update("User.updateUser", user);
	}

}
