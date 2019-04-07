package com.fh.shop.backend.controller.log;

import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.common.ServerResponseDataTable;
import com.fh.shop.backend.po.log.Log;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("log")

public class LogController {
    @Resource(name="logService")
    private ILogService logService;

    @RequestMapping("toFindLogList")
    public String toFindLogList(){
        return "log/logList";
    }

    @RequestMapping("findLogList")
    public String findLogList(){
        return "log/logList";
    }

    @RequestMapping("selectLogList")
    @ResponseBody
    public ServerResponse selectLogList(Log log, Integer start, Integer length, Integer draw){
        log.setStartPos(start);
        log.setPageSize(length);
        long totalCount=logService.totalCount(log);
        List<Log> LogLsit=logService.selectLogList(log);
        ServerResponseDataTable serverResponseDataTable = ServerResponseDataTable.success(draw, totalCount, totalCount, LogLsit);
        return ServerResponse.success(serverResponseDataTable);
    }
}
