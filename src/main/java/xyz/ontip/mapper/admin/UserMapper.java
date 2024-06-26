package xyz.ontip.mapper.admin;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xyz.ontip.pojo.dto.user.AccountInfoListDTO;
import xyz.ontip.pojo.dto.account.InsertAccountDTO;
import xyz.ontip.pojo.dto.account.ResetPasswordDTO;
import xyz.ontip.pojo.dto.user.SaveExcelUserInfoDTO;
import xyz.ontip.pojo.vo.requestVo.account.AccountInfoListParamVO;
import xyz.ontip.pojo.vo.requestVo.account.SearchAccountInfo;
import xyz.ontip.pojo.vo.requestVo.account.UpdateAccountVO;

import java.util.List;

@Mapper
@Repository("adminUserMapper")
public interface UserMapper {

    List<AccountInfoListDTO> getAccountInfoList(AccountInfoListParamVO accountInfoListParamVO);

    List<AccountInfoListDTO> getAccountInfoListAll();

    int batchDeleteUserByIds(Long[] ids);

    List<AccountInfoListDTO> searchUserInfoList(@Param("searchAccountInfo") SearchAccountInfo searchAccountInfo);

    AccountInfoListDTO getUserInfoById(Long uId);

    int updateAccountInfo(UpdateAccountVO updateAccountVO);

    int resetPasswordById(ResetPasswordDTO resetPasswordDTO);

    int insertUser(@Param("insertAccountDTO") InsertAccountDTO insertAccountDTO);

    int batchSaveUser(@Param("saveExcelUserInfoDTOS") List<SaveExcelUserInfoDTO> saveExcelUserInfoDTOS);
}
