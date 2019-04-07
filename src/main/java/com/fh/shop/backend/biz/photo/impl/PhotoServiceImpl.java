package com.fh.shop.backend.biz.photo.impl;

import com.fh.shop.backend.biz.photo.IPhotoService;
import com.fh.shop.backend.mapper.photo.IPhotoMapper;
import com.fh.shop.backend.po.photo.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("photoService")
public class PhotoServiceImpl implements IPhotoService {

    @Autowired
    private IPhotoMapper photoMapper;

    @Override
    public void addPhoto(List<Photo> photoList) {
        photoMapper.addPhoto(photoList);
    }

    @Override
    public List<Photo> findPhotoList(Photo photo) {
        return photoMapper.findPhotoList(photo);
    }

    @Override
    public Photo selectPhoto(Integer splitId) {
        return photoMapper.selectPhoto(splitId);
    }

    @Override
    public void deletePhoto(List listIds) {
        photoMapper.deletePhoto(listIds);
    }
}
