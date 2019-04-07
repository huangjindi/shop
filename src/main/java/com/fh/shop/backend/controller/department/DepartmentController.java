package com.fh.shop.backend.controller.department;

import com.fh.shop.backend.biz.department.IDepartmentService;
import com.fh.shop.backend.biz.user.IUserService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.department.Department;
import com.fh.shop.backend.po.user.User;
import com.fh.shop.backend.util.FileUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("department")
public class DepartmentController {

    @Resource(name = "departmentService")
    private IDepartmentService departmentService;
    @Resource
    private IUserService userService;

    @RequestMapping("toDepartmentJsp")
    public String toDepartmentJsp() {
        return "department/department";
    }

    @RequestMapping("findDepartment")
    @ResponseBody
    public List findDepartment() {
        List ztreeList = new ArrayList();
        List<Department> departmentList = departmentService.findDepartment();
        for (Department department : departmentList) {
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("id", department.getId());
            dataMap.put("name", department.getDeptName());
            dataMap.put("pId", department.getFatherId());
            dataMap.put("remark", department.getRemark());
            ztreeList.add(dataMap);
        }
        return ztreeList;
    }

    @RequestMapping("addDept")
    @ResponseBody
    public ServerResponse addDept(Department department) {
        departmentService.addDept(department);
        return ServerResponse.success(department.getId());
    }

    @RequestMapping("deleteDept")
    @ResponseBody
    public ServerResponse deleteDept(@RequestParam("ids[]") List<Integer> ids) {
        departmentService.deleteAllDepartment(ids);
        return ServerResponse.success();
    }

    @RequestMapping("updateDept")
    @ResponseBody
    public ServerResponse updateDept(Department department) {
        departmentService.updateDept(department);
        return ServerResponse.success();
    }


    @RequestMapping("deptExcelOut")
    @ResponseBody
    public void deptExcelOut(Department department, HttpServletResponse response) {

        List<Department> departmentList = departmentService.deptExcelOut(department);
        //创建工作薄
        XSSFWorkbook workbook = new XSSFWorkbook();
        //如果等于0条数据，直接导出
        if (departmentList.size() == 0) {
            List<Department> departmentInfoList = departmentService.queryDept(department);
            String[] headerName = {"用户名", "真实姓名", "部门", "性别", "生日", "薪资"};
            for (Department departmentInfo : departmentInfoList) {
                //创建sheet页
                XSSFSheet sheet = workbook.createSheet(departmentInfo.getDeptName());
                //创建标题行
                XSSFRow titleRow = sheet.createRow(0);
                for (int i = 0; i < headerName.length; i++) {
                    XSSFCell titleCell = titleRow.createCell(0 + i);
                    titleCell.setCellValue(headerName[i]);
                }
                List<User> userList = userService.excelOutUser(departmentInfo);
                SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
                for (int i = 0; i < userList.size(); i++) {
                    User userInfo = userList.get(i);
                    //创建内容行
                    XSSFRow contentRow = sheet.createRow(1 + i);
                    XSSFCell userNameCell = contentRow.createCell(0);
                    userNameCell.setCellValue(userInfo.getUserName());
                    XSSFCell realNameCell = contentRow.createCell(1);
                    realNameCell.setCellValue(userInfo.getRealName());
                    XSSFCell deptNameCell = contentRow.createCell(2);
                    deptNameCell.setCellValue(userInfo.getDepartment().getDeptName());
                    XSSFCell userSexCell = contentRow.createCell(3);
                    userSexCell.setCellValue(userInfo.getUserSex());
                    XSSFCell birthdayCell = contentRow.createCell(4);
                    birthdayCell.setCellValue(sim.format(userInfo.getBirthday()));
                    XSSFCell userPayCell = contentRow.createCell(5);
                    userPayCell.setCellValue(userInfo.getUserPay());
                }
            }
            FileUtil.excelDownload(workbook, response);
        }
        //如果大于0，则创建多个sheet页
        /*for (Department departmentInfo : departmentList) {


        }*/
        /*if (departmentList.size()>0) {
            List<Integer> childList = new ArrayList<>();
            for (int i = 0; i < departmentList.size(); i++) {
                findChilds(departmentList.get(i), childList);

            }
            for (Integer aaa : childList) {
                System.out.println(aaa);
            }

        }

    }


    public  void findChilds(Department dept, List<Integer> childList) {
        List<Department> list = departmentService.deptExcelOut(dept);
        for (int i = 0; i < list.size(); i++) {
            childList.add(list.get(i).getId());
            findChilds(list.get(i), childList);
        }
    }*/
    }
}
