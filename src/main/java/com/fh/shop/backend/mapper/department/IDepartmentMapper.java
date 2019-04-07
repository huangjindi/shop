package com.fh.shop.backend.mapper.department;

import com.fh.shop.backend.po.department.Department;

import java.util.List;

public interface IDepartmentMapper {

    List<Department> findDepartment();

    void addDept(Department department);

    List<Department> selectDepartment(Department department);

    void deleteAllDepartment(List<Integer> ids);

    void deleteDept(Department department);

    Department selectDept(Department department);

    void updateDept(Department department);

    List<Department> deptExcelOut(Department department);

    List<Department> queryDept(Department department);
}
