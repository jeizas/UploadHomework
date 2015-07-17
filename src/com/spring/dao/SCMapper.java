package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.model.SC;

public interface SCMapper {
	public String selectAllbykey(Map<String, Object> map);
	public int updatebykey(SC sc);
	public int insertSelective(SC sc);
	public List<SC> selectBysnocno(String sno,String cno);
	public List<SC> getscFromsnocnoByPage(Map<String,Object> map);
	public List<SC> selectBysclasstimes(Map<String,Object> map);
	public List<SC> selectBycno(String cno);
	public List<SC> getscFromcnoByPage(Map<String,Object> map);
	public List<SC> getscFromsclasstimesByPage(Map<String,Object> map);
	public SC selectBysnocnosctimes(Map<String,Object> map);
	public int updateToscfile(Map<String, Object> map);
	public int updateTOallowlook(String cno,String sctimes);
	public int updateTolook(Map<String, Object> map);
}