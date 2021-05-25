package com.zw.service;


import com.zw.bean.Account;
import com.zw.dao.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {


    @Autowired
    AccountMapper accountMapper;

    //插入账户
    public void insertAccount(String name,String password){
        accountMapper.insertExample(name,password);
    }

    //校验用户名是否存在
    public boolean checkName(String name){
        return accountMapper.selectByPrimaryKey(name)==null?true:false;
    }
    //校验密码是否正确
    public Account selectByName(String name){
        return accountMapper.selectByPrimaryKey(name);
    }

    //保存用户修改的密码
    public void savePassword(String s,String psd){
        accountMapper.updateByExample(s,psd);
    }
}
