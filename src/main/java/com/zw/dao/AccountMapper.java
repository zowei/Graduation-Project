package com.zw.dao;

import com.zw.bean.Account;

public interface AccountMapper {



    //自定义插入新用户
    int insertExample(String name,String password);
    //自定义修改密码
    int updateByExample(String name,String password);

    int deleteByPrimaryKey(String name);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(String name);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}