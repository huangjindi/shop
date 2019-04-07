package com.fh.shop.backend.controller.area;

import com.fh.shop.backend.biz.area.IAreaService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.area.Area;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("area")
public class AreaController {

    @Resource(name="areaService")
    private IAreaService areaService;

    @RequestMapping("toAreaList")
    public String toAreaList(){
        return "area/areaList";
    }

    @RequestMapping("areaZtree")
    @ResponseBody
    public List<Area> areaZtree(){
        List<Area> areaList = areaService.queryAreaList();
        return areaList;
    }

    @RequestMapping("addArea")
    @ResponseBody
    public ServerResponse addArea(Area area){
        areaService.addArea(area);
        return ServerResponse.success(area.getId());
    }

    @RequestMapping("deleteArea")
    @ResponseBody
    public ServerResponse deleteArea(@RequestParam("ids[]") List<Integer> ids){
        areaService.deleteArea(ids);
        return ServerResponse.success();
    }

    @RequestMapping("updateArea")
    @ResponseBody
    public ServerResponse updateArea(Area area){
        areaService.updateArea(area);
        return ServerResponse.success();
    }
}
