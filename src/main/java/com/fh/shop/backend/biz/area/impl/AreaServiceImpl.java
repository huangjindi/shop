package com.fh.shop.backend.biz.area.impl;

import com.fh.shop.backend.biz.area.IAreaService;
import com.fh.shop.backend.mapper.area.IAreaMapper;
import com.fh.shop.backend.po.area.Area;
import com.fh.shop.backend.util.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("areaService")
public class AreaServiceImpl implements IAreaService {

    @Autowired
    private IAreaMapper areaMapper;

    CacheManager instance = CacheManager.getInstance();
    @Override
    public List<Area> queryAreaList() {
        List<Area> areaInfoList = (List<Area>) instance.getObj("areaList");
        if(areaInfoList !=null){
            return areaInfoList;
        }
        List<Area> areaList = areaMapper.queryAreaList();
        instance.putObj("areaList",areaList);
        return areaList;
    }

    @Override
    public void deleteArea(List<Integer> ids) {
        instance.remove("areaList");
        areaMapper.deleteArea(ids);
    }

    @Override
    public void addArea(Area area) {
        instance.remove("areaList");
        areaMapper.addArea(area);
    }

    @Override
    public void updateArea(Area area) {
        instance.remove("areaList");
        areaMapper.updateArea(area);
    }
}
