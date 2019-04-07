/**
 * <pre>项目名称:shop_admin_v1
 * 文件名称:ProductController.java
 * 包名:com.fh.shop.backend.controller.product
 * 创建日期:2018年12月23日下午8:11:51
 * Copyright (c) 2018, 1328055490@qq.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.controller.product;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.biz.brand.IBrandService;
import com.fh.shop.backend.biz.photo.IPhotoService;
import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.common.FileInfo;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.common.ServerResponseDataTable;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.po.brand.Brand;
import com.fh.shop.backend.po.photo.Photo;
import com.fh.shop.backend.po.product.Product;
import com.fh.shop.backend.util.FileUtil;
import com.fh.shop.backend.util.SystemContent;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>项目名称：shop_admin_v1
 * 类名称：ProductController
 * 类描述：
 * 创建人：黄锦迪 1328055490@qq.com
 * 创建时间：2018年12月23日 下午8:11:51
 * 修改人：黄锦迪 1328055490@qq.com
 * 修改时间：2018年12月23日 下午8:11:51
 * 修改备注：
 * @version </pre>
 */
//<bean id="productController" class="com.fh.shop.backend.controller.product.ProductController"></bean>
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Resource(name = "productService")
    private IProductService productService;
    @Resource(name = "brandService")
    private IBrandService brandService;
    @Resource(name = "photoService")
    private IPhotoService photoService;

    @RequestMapping("toList")
    public String toList() {
        return "product/productList";
    }

    /**
     * <pre>toAdd(跳转到添加页面)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月24日 下午9:04:09
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月24日 下午9:04:09
     * 修改备注：
     * @return</pre>
     */
    @RequestMapping("toAdd")
    public String toAdd(ModelMap brandNameMap) {
        return "product/addProduct";
    }

    /**
     * <pre>addProduct(产品添加)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月24日 下午9:04:25
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月24日 下午9:04:25
     * 修改备注：
     * @param product
     * @return</pre>
     */
    @LogAnnotation("产品添加")
    @RequestMapping("addProduct")
    @ResponseBody
    public ServerResponse addProduct(Product product) {
        return productService.addProduct(product);
    }

    /**
     * <pre>queryProductList(产品查询)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月24日 下午9:14:43
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月24日 下午9:14:43
     * 修改备注：
     * @return</pre>
     */
    @RequestMapping("queryProductList")
    public String queryProductList(ModelMap dataMap, Product product, Integer flag) {
        //计算总条数
        Long totalCount = productService.countProduct(product);
        //设置总条数
        product.setTotalCount(totalCount);
        //设置分页信息
        product.calculatePage();
        //获取分页列表
        List<Product> dataList = productService.queryProductList(product);
        dataMap.put("page", product);
        dataMap.put("dataList", dataList);
        if (flag != null) {
            return "product/productTable";
        } else {
            return "product/productList";
        }
    }

    /**
     * <pre>deleteProduct(产品删除)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月25日 下午2:46:47
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月25日 下午2:46:47
     * 修改备注：
     * @return</pre>
     */
    @LogAnnotation("产品删除")
    @RequestMapping("deleteProduct")
    @ResponseBody
    public ServerResponse deleteProduct(@RequestParam(value = "id", required = true) Integer id, HttpServletResponse response) {
        productService.deleteProduct(id);
        return ServerResponse.success();
    }

    /**
     * <pre>updateProduct(修改回显)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月25日 下午3:34:43
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月25日 下午3:34:43
     * 修改备注：
     * @param id
     * @return</pre>
     */
    @RequestMapping("toUpdateProduct")
    public String toUpdateProduct(ModelMap productMap, Photo photo, Integer id) {
        Product product = productService.toUpdateProduct(id);
        List<Photo> photoList = photoService.findPhotoList(photo);
        productMap.put("product", product);
        productMap.put("photoList", photoList);
        return "product/updateProduct";
    }

    /**
     * <pre>updateProduct(产品修改)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月25日 下午4:01:42
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月25日 下午4:01:42
     * 修改备注：
     * @param product
     * @return</pre>
     */
    @LogAnnotation("产品修改")
    @RequestMapping("updateProduct")
    public String updateProduct(@RequestParam("photo") MultipartFile[] photo, @RequestParam MultipartFile productImg, Product product, HttpServletRequest request) throws IOException {
        String realPath = getRootPath(request);
        FileInfo fileInfo = converFileInfo(photo, productImg);
        productService.updateProduct(fileInfo, product, realPath);
        return "redirect:queryProductList.jhtml";
    }


    /**
     * <pre>deleteAll(批量删除)
     * 创建人：黄锦迪 1328055490@qq.com
     * 创建时间：2018年12月26日 下午9:28:27
     * 修改人：黄锦迪 1328055490@qq.com
     * 修改时间：2018年12月26日 下午9:28:27
     * 修改备注：
     * @param ids
     * @return</pre>
     */
    @LogAnnotation("产品批量删除")
    @RequestMapping("deleteAll")
    @ResponseBody
    public ServerResponse deleteAll(String ids) {
        productService.deleteAll(ids);
        return ServerResponse.success();
    }

    @RequestMapping("excelOut")
    public void excelOut(Product product, HttpServletResponse response) {
        Brand brand = new Brand();
        if (product.getBrand().getId() != -1) {
            brand.setId(product.getBrand().getId());
        }
        //查询产品的全部数据
        List<Brand> brandList = brandService.findBrandList(brand);
        //创建工作薄
        XSSFWorkbook workbook = new XSSFWorkbook();
        //创建sheet页
        createSheet(product, brandList, workbook);
        //下载
        FileUtil.excelDownload(workbook, response);
    }

    private void createSheet(Product product, List<Brand> brandList, XSSFWorkbook workbook) {
        for (int i = 0; i < brandList.size(); i++) {
            Brand brandInfo = brandList.get(i);
            //循环这个list
            product.getBrand().setId(brandInfo.getId());
            List<Product> productList = productService.productList(product);
            XSSFSheet sheet = workbook.createSheet(brandInfo.getBrandName() + "【" + productList.size() + "】");
            //设置大标题样式
            XSSFCellStyle cellStyle = buildTitleStyle(workbook);
            //创建标题
            createHeader(sheet, cellStyle);
            //创建内容
            createBody(productList, sheet);
        }
    }

    private XSSFCellStyle buildTitleStyle(XSSFWorkbook workbook) {
        XSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 26);
        font.setColor(HSSFColor.RED.index);
        cellStyle.setFont(font);
        cellStyle.setFillForegroundColor(HSSFColor.BLUE.index);
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        return cellStyle;
    }

    private void createHeader(XSSFSheet sheet, XSSFCellStyle cellStyle) {
        XSSFRow titleRow = sheet.createRow(2);
        XSSFCell ctitleCell = titleRow.createCell(8);
        ctitleCell.setCellValue("商品列表");
        CellRangeAddress cellRangeAddress = new CellRangeAddress(2, 4, 8, 12);
        sheet.addMergedRegion(cellRangeAddress);
        ctitleCell.setCellStyle(cellStyle);
        String[] headerName = {"商品", "价格", "品牌", "创建时间", "修改时间"};
        //创建头（标题）
        XSSFRow rowTitle = sheet.createRow(5 + 0);
        for (int i = 0; i < headerName.length; i++) {
            XSSFCell cell0 = rowTitle.createCell(8 + i);
            cell0.setCellValue(headerName[i]);
        }
    }

    private void createBody(List<Product> productList, XSSFSheet sheet) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int rowNum = 6;
        int columnIndex = 7;
        for (int j = 0; j < productList.size(); j++) {
            //得到产品Javabean
            Product productInfo = productList.get(j);
            //创建行
            XSSFRow row = sheet.createRow(j + rowNum);
            //创建产品名单元格
            XSSFCell productName = row.createCell(columnIndex + 1);
            productName.setCellValue(productInfo.getProductName());
            //创建产品价格单元格
            XSSFCell productPrice = row.createCell(columnIndex + 2);
            productPrice.setCellValue(productInfo.getProductPrice());
            //创建产品品牌单元格
            XSSFCell brandName = row.createCell(columnIndex + 3);
            brandName.setCellValue(productInfo.getBrand().getBrandName());
            //创建产品创建时间单元格
            XSSFCell createTime = row.createCell(columnIndex + 4);
            createTime.setCellValue(sdf.format(productInfo.getCreateTime()));
            //创建产品修改时间单元格
            XSSFCell updateTime = row.createCell(columnIndex + 5);
            updateTime.setCellValue(sdf.format(productInfo.getUpdateTime()));
        }
    }

    @RequestMapping("list")
    @ResponseBody
    public ServerResponse list(Product product, Integer start, Integer length, Integer draw, HttpServletRequest request) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        String orderColumn = parameterMap.get("order[0][column]")[0];
        String orderDir = parameterMap.get("order[0][dir]")[0];
        if (parameterMap.get("order[0][dir]")[0] != "" && parameterMap.get("columns[" + orderColumn + "][data]") != null) {
            String columnsSData = parameterMap.get("columns[" + orderColumn + "][data]")[0];
            Map<Object, String> fieldMap = new HashMap<>();
            fieldMap.put(columnsSData, "price");
            fieldMap.put(columnsSData, "createTime");
            fieldMap.put(columnsSData, "updateTime");
            product.setSort(orderDir);
            product.setField(fieldMap.get(columnsSData));
        }

        product.setPageSize(length);
        product.setStartPos(start);
        //计算总条数
        Long totalCount = productService.countProduct(product);
        //获取分页列表
        List<Product> dataList = productService.queryProductList(product);
        ServerResponseDataTable serverResponseDataTable = ServerResponseDataTable.success(draw, totalCount, totalCount, dataList);
        return ServerResponse.success(serverResponseDataTable);
    }

    @RequestMapping("todepartment")
    public String todepartment() {
        return "department/department";
    }

}

