package net.iotek.controller;

import net.iotek.entity.Storage;
import net.iotek.entity.result.StorageGood;
import net.iotek.service.StorageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * desc:
 * author:happy-sc
 * date:2016/8/21.
 */
@Controller
public class StorageController extends BaseController {

    @Resource
    private StorageService storageService;

    @RequestMapping("/storage/list")
    public String storageList(Model model){
        List<StorageGood> result=storageService.showStorage(currentLoginUserShopId());
        model.addAttribute("storagegood",result);
        return "storage";
    }

    @ResponseBody
    @RequestMapping("/addGoodToStorage")
    public String addGoodToStorage(Integer goodId){
        Long userId=currentLoginUserShopId();
        int count=storageService.findIsExist(goodId,userId);
        if (count>0){
            storageService.updateGoodNum(goodId,userId);
        }else {
            Storage storage=new Storage();
            storage.setGoodId(goodId);
            storage.setGoodnum(1);
            storage.setUserId(userId);
            storageService.addGood(storage);
        }
        return "success";
    }

    @RequestMapping("/storage/del")
    public String delStorageGood(Integer Id){
        storageService.delStorageGood(Id);
        return "redirect:/storage/list";
    }
    
}
