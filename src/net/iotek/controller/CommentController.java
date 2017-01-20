package net.iotek.controller;

import net.iotek.entity.Comment;
import net.iotek.service.CommnetService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Controller
public class CommentController extends BaseController {

    @Resource
    private CommnetService commnetService;

    @ResponseBody
    @RequestMapping("/good/comment")
    public String addComment(Comment comment){
        comment.setUserid(currentLoginUserShopId());
        commnetService.addComment(comment);
        return "success";
    }

}
