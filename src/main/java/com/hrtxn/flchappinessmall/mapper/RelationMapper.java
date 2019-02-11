package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Relation;

import java.util.List;

/**
 * Author:封润
 * Date:2018-11-05 上午 10:30
 * Description:<描述>
 */
public interface RelationMapper {

    /**
     * 根据Role(角色)Id 删除 权限组
     * @param roleId
     */
    void delectRelationByRoleId(Integer roleId);

    /**
     * 添加权限组
     * @param menuId
     */
    void addRelation(List<Relation> menuId);
}
