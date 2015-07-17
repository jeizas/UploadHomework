package com.spring.dao;

import java.util.List;

import com.spring.model.Coursedata;

public interface CoursedataMapper {
    int insert(Coursedata record);
    List<Coursedata> selectBycno(String cno);
    List<Coursedata> selectAll();
    int deleteBykey(String cno,String dname);
}