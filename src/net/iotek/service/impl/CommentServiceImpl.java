package net.iotek.service.impl;

import net.iotek.dao.CommentDao;
import net.iotek.entity.Comment;
import net.iotek.service.CommnetService;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Service
public class CommentServiceImpl implements CommnetService {

    private CommentDao commentDao;

    @Override
    public void addComment(Comment comment) {
        comment.setCreatetime(new Timestamp(System.currentTimeMillis()));
        commentDao.addComment(comment);
    }
}
