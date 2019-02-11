package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.MuenMapper;
import com.hrtxn.flchappinessmall.pojo.pojoVo.MenuVo;
import com.hrtxn.flchappinessmall.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:封润
 * Date:2018-11-04 下午 4:36
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)//事物默认隔离级别,回滚:任何异常都会回滚
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MuenMapper muenMapper;

    /**
     * 获取全部菜单url 根据等级封装完成
     * @return
     */
    @Override
    public List<MenuVo> getMenuAll() {
        List<MenuVo> menuVoList = muenMapper.selectMenuAll();
        return menuVoList;
    }
}
