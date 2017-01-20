package net.iotek.dao;

import net.iotek.entity.Good;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Repository
public class GoodDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Good> goodList() {

		return sqlSessionTemplate.selectList("Good.goodList");
	}

	public List<Good> findGoodOnline() {

		return sqlSessionTemplate.selectList("Good.findGoodOnline");
	}

	public void addGood(Good good) {

		sqlSessionTemplate.insert("Good.addGood", good);
	}

	public void deleteGood(Integer id) {

		sqlSessionTemplate.delete("Good.deleteGood", id);
	}

	public void updateGood(Good good) {

		sqlSessionTemplate.update("Good.updateGood", good);
	}

	public Good findGoodById(Integer Id) {

		return sqlSessionTemplate.selectOne("Good.findGoodById", Id);
	}
}
