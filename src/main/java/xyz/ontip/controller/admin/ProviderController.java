package xyz.ontip.controller.admin;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.ontip.annotation.RequirePermission;
import xyz.ontip.pojo.ResultEntity;
import xyz.ontip.pojo.entity.Provider;
import xyz.ontip.pojo.vo.requestVo.provider.InsertSupplierVO;
import xyz.ontip.pojo.vo.requestVo.provider.ProviderParamVO;
import xyz.ontip.pojo.vo.requestVo.provider.SearchProviderVO;
import xyz.ontip.pojo.vo.requestVo.provider.UpdateSupplierVO;
import xyz.ontip.service.admin.ProviderService;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Slf4j
@RestController
@RequirePermission(value = {"admin"})
@RequestMapping("/api/admin/provider")
public class ProviderController {


    @Resource
    private ProviderService providerService;


    @PostMapping("/info/all")
    public ResultEntity<?> getProviderInfoList() {
        try {
            List<Provider> providers = providerService.getAllProvider();
            return ResultEntity.success(providers);
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

    @GetMapping("/info/{id}")
    public ResultEntity<?> getSupplierInfoById(@PathVariable Long id) {
        Provider provider = providerService.getSupplierInfoById(id);
        return ResultEntity.success(provider);
    }

    @PostMapping("/info/page")
    public ResultEntity<?> getSupplierListByPage(@RequestBody ProviderParamVO providerParamVO) {
        try {
            List<Provider> providers = providerService.getSupplierListByPage(providerParamVO);
            return ResultEntity.success(providers);
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

    @PostMapping("/search/info")
    public ResultEntity<?> SearchSupplierList(@RequestBody SearchProviderVO searchProviderVO) {
        try {
            List<Provider> providers = providerService.SearchSupplierList(searchProviderVO);
            return ResultEntity.success(providers);
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

    @PostMapping("/insert")
    public ResultEntity<?> insertSupplier(@RequestBody InsertSupplierVO insertSupplierVO) {
        try {
            providerService.insertSupplier(insertSupplierVO);
            return ResultEntity.success();
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

    @PostMapping("/delete")
    public ResultEntity<?> deleteSupplier(@RequestBody Long[] pIds) {
        try {
            providerService.deleteSupplier(pIds);
            return ResultEntity.success();
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

    @PostMapping("/update")
    public ResultEntity<?> updateSupplier(@RequestBody UpdateSupplierVO updateSupplierVO) {
        try {
            providerService.updateSupplier(updateSupplierVO);
            return ResultEntity.success();
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

    @PostMapping("/export/excel")
    public void exportExcelUserInfo(HttpServletResponse response) {
        ExcelWriter writer = ExcelUtil.getWriter();
        List<Provider> providers = providerService.getAllProvider();
        writer.write(providers, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");

        // 使用URL编码处理文件名
        String fileName = "供应商信息.xlsx";
        String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
        response.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
        try (ServletOutputStream out = response.getOutputStream()) {
            writer.flush(out, true);
        } catch (IOException e) {
            log.warn("将用户信息导出到 Excel 时出错: {}", e.getMessage(), e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            writer.close();
        }
    }

    @PostMapping("save/excel")
    public ResultEntity<?> saveExcelUserInfo(@RequestParam("file") MultipartFile file) {
        try (InputStream inputStream = file.getInputStream()) {
            ExcelReader reader = ExcelUtil.getReader(inputStream);
            List<InsertSupplierVO> maps = reader.readAll(InsertSupplierVO.class);
            providerService.batchInsertSupplier(maps);
            return ResultEntity.success();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (RuntimeException e) {
            return ResultEntity.serverError();
        }
    }

}
