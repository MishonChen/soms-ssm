package xyz.ontip.service.impl.admin;

import cn.hutool.core.date.DateUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.ontip.mapper.admin.UserMapper;
import xyz.ontip.pojo.dto.AccountInfoListDto;
import xyz.ontip.pojo.vo.requestVo.AccountInfoListParamVO;
import xyz.ontip.pojo.vo.responesVo.AccountInfoListVO;
import xyz.ontip.service.admin.UserService;

import java.util.ArrayList;
import java.util.List;

@Service("AdminUserMapper")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<AccountInfoListVO> getAccountInfoList(AccountInfoListParamVO accountInfoListParamVO) {
        try {
            List<AccountInfoListDto> accountInfoList = userMapper.getAccountInfoList(accountInfoListParamVO);
            List<AccountInfoListVO> accountInfoListVOS = new ArrayList<>();
            for (int i = 0; i < accountInfoList.size(); i++) {
                AccountInfoListVO accountInfoListVO = new AccountInfoListVO();
                BeanUtils.copyProperties(accountInfoList.get(i), accountInfoListVO);
                accountInfoListVO.setRegisterTime(DateUtil.format(accountInfoList.get(i).getRegisterTime(), "yyyy-MM-dd"));
                switch (accountInfoList.get(i).getRole()) {
                    case "admin"->
                        accountInfoListVO.setRole("管理员");
                    default ->
                        accountInfoListVO.setRole("普通用户");
                }
                accountInfoListVOS.add(accountInfoListVO);
            }
            return accountInfoListVOS;
        } catch (Exception e) {
            throw new RuntimeException("发生异常，请联系管理员");
        }

    }
}