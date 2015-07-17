package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.Settask;

public interface SettaskService {
	
	List<Settask> getAll(String cno);	
	int updateBycomment(Map<String, Object> map);	
	Settask selectBycnosctimes(String cno,String sctimes);
	List<Settask> selectBycno(String cno);	
	String selectsctimeMax(String cno);	
	int insertAll(Map<String, Object> map);
	int updateBykey(Map<String, Object> map);
}
