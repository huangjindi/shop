package com.fh.shop.backend.common;

import java.io.Serializable;
import java.util.List;

public class ServerResponseDataTable implements Serializable {

    private int draw;
    private long recordsTotal;
    private long recordsFiltered;
    private List data;

    private ServerResponseDataTable (int draw, long recordsTotal, long recordsFiltered, List data){
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
    }

    public static ServerResponseDataTable success(int draw, long recordsTotal, long recordsFiltered, List data){
        return new ServerResponseDataTable(draw, recordsTotal, recordsFiltered, data);
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}
