package com.hrtxn.flchappinessmall.pojo.pojoVo;

import lombok.Data;

import java.io.Serializable;

/**
 * Description:获取用户各角色总人数 <描述>
 * Author: zhouchuanyu
 * Date:2018-10-08 17:47
 */
@Data
public class UserCountVo implements Serializable {

    private Integer userRole;

    private Integer userCount;

}
