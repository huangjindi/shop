package com.fh.shop.backend.biz.log.impl;

import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.mapper.log.ILogMapper;
import com.fh.shop.backend.po.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("logService")
public class LogServiceImpl implements ILogService {
    @Autowired
    private ILogMapper logMapper;
    @Override
    public void addLog(Log log) {
        logMapper.addLog(log);
    }

    @Override
    public List<Log> findLogList(Log log) {
        return logMapper.findLogList(log);
    }

    @Override
    public long totalCount(Log log) {
        return logMapper.totalCount(log);
    }

    @Override
    public List<Log> selectLogList(Log log) {
        return logMapper.selectLogList(log);
    }
}
