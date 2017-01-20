package net.iotek.dao;

import net.iotek.entity.Comment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Repository
public class CommentDao {

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public void addComment(Comment comment){
        sqlSessionTemplate.insert("Comment.addComment",comment);
    }


}
