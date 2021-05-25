package com.zw.service;

import com.zw.bean.Enterprise;
import com.zw.dao.EnterpriseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EnterpriseService {
    @Autowired
    EnterpriseMapper enterpriseMapper;

    //分页查询
    public List<Enterprise> getAll(){
        return enterpriseMapper.selectAll();
    }



    //校验name是否重复
    public boolean checkName(String name){
        return enterpriseMapper.selectByName(name)==null?true:false;
    }
    //提交保存
    public void saveEnps(Enterprise enterprise){
        enterpriseMapper.insertSelective(enterprise);
    }
    //根据id查询
    public Enterprise selectById(Integer id){
        Enterprise enterprise = enterpriseMapper.selectByPrimaryKey(id);
        return enterprise;
    }
    //修改数据
    public void updateEnp(Enterprise enterprise){
        enterpriseMapper.updateByPrimaryKeySelective(enterprise);
    }
    //单个删除
    public void deleteById(Integer id){
        enterpriseMapper.deleteByPrimaryKey(id);
    }

    //批量删除
    public void delectAll(List<Integer> list){
        for (Integer id :list) {
            enterpriseMapper.deleteByPrimaryKey(id);
        }
    }


    //queryController的分页查询
    public List<Enterprise> getByExample(String name,String address,Integer number){
        return enterpriseMapper.selectByExample(address,name,number);
    }

}

