package com.zw.dao;

import com.zw.bean.Enterprise;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnterpriseMapper {

    //根据name查询
    Enterprise selectByName(String name);
    List<Enterprise> selectAll();

    //query分页查询
    List<Enterprise> selectByExample(@Param("address")String address, @Param("name")String name, @Param("number")Integer number);




    int deleteByPrimaryKey(Integer id);

    int insert(Enterprise record);

    int insertSelective(Enterprise record);

    Enterprise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Enterprise record);

    int updateByPrimaryKey(Enterprise record);
}