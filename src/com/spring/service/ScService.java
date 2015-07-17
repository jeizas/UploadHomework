package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.SC;

public interface ScService {	
	String selectAllbykey(Map<String,Object> map);
	int updatebykey(SC sc);
	int insertSelective(SC sc);
	List<SC> selectBysnocno(String sno,String cno);
	List<SC> getscFromsnocnoByPage(Map<String,Object> map);
	List<SC> selectBysclasstimes(Map<String,Object> map);
	List<SC> selectBycno(String cno);
	List<SC> getscFromcnoByPage(Map<String,Object> map);
	List<SC> getscFromsclasstimesByPage(Map<String,Object> map);
	SC selectBysnocnosctimes(Map<String,Object> map);
	int updateToscfile(Map<String, Object> map);
	int updateTOallowlook(String cno,String sctimes);
	int updateTolook(Map<String, Object> map);
}
