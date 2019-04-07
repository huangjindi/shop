package com.fh.shop.backend.controller.photo;

import com.fh.shop.backend.biz.photo.IPhotoService;
import com.fh.shop.backend.po.photo.Photo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("photo")
public class PhotoController {

    @Resource(name="photoService")
    private IPhotoService photoService;

    @RequestMapping("findPhotoList")
    public String findPhotoList(ModelMap photoMap,Photo photo){
        List<Photo> photoList=photoService.findPhotoList(photo);
        photoMap.put("photoList",photoList);
        return "photo/photoList";
    }
}
