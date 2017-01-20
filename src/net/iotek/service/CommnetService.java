package net.iotek.service;

import net.iotek.entity.Comment;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
public interface CommnetService {

    /**
     * 增加评论
     * @param comment
     */
    void addComment(Comment comment);
}
