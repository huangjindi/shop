package com.fh.shop.backend.biz.photo;

import com.fh.shop.backend.po.photo.Photo;

import java.util.List;

public interface IPhotoService {
    void addPhoto(List<Photo> photoList);

    List<Photo> findPhotoList(Photo photo);

    Photo selectPhoto(Integer splitId);

    void deletePhoto(List listIds);
}
