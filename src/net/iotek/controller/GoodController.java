package net.iotek.controller;

import net.iotek.entity.Good;
import net.iotek.service.GoodService;
import net.iotek.utils.UploadImages;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Controller
public class GoodController extends BaseController {

    @Resource
    private GoodService goodService;

    @RequestMapping("/good/show")
    public String goodShowList(Model model){
        model.addAttribute("goodList",goodService.findGoodOnline());
        return "goodList";
    }

    @RequestMapping("/good/list")
    public String findGoodList(Model model){
        model.addAttribute("goodList",goodService.findGoodList());
        return "goodManage";
    }

    @RequestMapping(value = "/good/addOrUpdate")
    public String operationGood(HttpServletRequest request,Good good, MultipartFile picFile){
        UploadImages uploadImages = new UploadImages();
        if (picFile!=null  && !picFile.isEmpty()){
            String path = request.getSession().getServletContext().getRealPath("/pictures");  //上传的路径
            String bigImg = uploadImages.upLoadImage(request, picFile, path);
            good.setPic(bigImg);
        }
        good.setCreatetime(new Timestamp(System.currentTimeMillis()));
        if (good.getId()!=null){
            goodService.updateGood(good);
        } else{
           goodService.addGood(good);
        }
        return "redirect:/good/list";
    }

    @RequestMapping("/good/delete")
    public String delGood(Integer Id){
        goodService.deleteGood(Id);
        return "redirect:/good/list";
    }

    @RequestMapping("/good/find")
    public String findGoodById(Integer Id,Model model){
        model.addAttribute("good",goodService.findGoodById(Id));
        return "goodManage";
    }

}
