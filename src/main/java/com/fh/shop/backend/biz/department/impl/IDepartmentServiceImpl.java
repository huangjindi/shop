package com.fh.shop.backend.biz.department.impl;

import com.fh.shop.backend.biz.department.IDepartmentService;
import com.fh.shop.backend.mapper.department.IDepartmentMapper;
import com.fh.shop.backend.po.department.Department;
import com.fh.shop.backend.util.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentService")
public class IDepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private IDepartmentMapper departmentMapper;
    CacheManager instance = CacheManager.getInstance();
    @Override
    public List<Department> findDepartment() {
        List<Department> instanceList = (List<Department>) instance.getObj("departmentList");
        if(instanceList != null){
            return instanceList;
        }
        List<Department> departmentList = departmentMapper.findDepartment();
        instance.putObj("departmentList",departmentList);
        return departmentList;
    }

    @Override
    public void addDept(Department department) {
        instance.remove("departmentList");
        departmentMapper.addDept(department);
    }

    @Override
    public void deleteDept(Department department) {
        departmentMapper.deleteDept(department);
    }

    @Override
    public List<Department> selectDepartment(Department department) {
        return departmentMapper.selectDepartment(department);
    }

    @Override
    public void deleteAllDepartment(List<Integer> ids) {
        departmentMapper.deleteAllDepartment(ids);
    }

    @Override
    public void updateDept(Department department) {
        departmentMapper.updateDept(department);
    }

    @Override
    public List<Department> deptExcelOut(Department department) {
        return departmentMapper.deptExcelOut(department);
    }

    @Override
    public List<Department> queryDept(Department department) {
        return departmentMapper.queryDept(department);
    }
}
