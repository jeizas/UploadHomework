package com.spring.service;

import java.util.List;

import com.spring.model.Coursedata;

public interface CoursedataService {
	int insert(Coursedata record);
	List<Coursedata> selcetBycno(String cno);
	List<Coursedata> selectAll();
	int deleteBykey(String cno,String dname);
}
