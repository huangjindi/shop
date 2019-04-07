package com.fh.shop.backend.mapper.area;

import com.fh.shop.backend.po.area.Area;

import java.util.List;

public interface IAreaMapper {
    List<Area> queryAreaList();

    void deleteArea(List<Integer> ids);

    void addArea(Area area);

    void updateArea(Area area);
}
