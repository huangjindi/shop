package com.fh.shop.backend.biz.department;

import com.fh.shop.backend.po.department.Department;

import java.util.List;

public interface IDepartmentService {
    List<Department> findDepartment();

    void addDept(Department department);

    void deleteDept(Department department);

    List<Department> selectDepartment(Department department);

    void deleteAllDepartment(List<Integer> ids);

    void updateDept(Department department);

    List<Department> deptExcelOut(Department department);

    List<Department> queryDept(Department department);
}
