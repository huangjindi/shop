package com.fh.shop.backend.mapper.log;

import com.fh.shop.backend.po.log.Log;

import java.util.List;

public interface ILogMapper {
    public void addLog(Log log);

    List<Log> findLogList(Log log);

    long totalCount(Log log);

    List<Log> selectLogList(Log log);
}
