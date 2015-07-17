package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.model.Student;

public interface StudentService {
	
	public List<Student> getAll();	
	public Student selectBysno(String sno);	
	public  List<String> selectSclass();	
	public List<Student> selectBysclas();	
	public int insertAll(String sno,String spwd,String sname,String smajor,String sgrade,String sclass);	
	int deleteBykey(String sno);	
	int updateBykey(String sno,String spwd,String sname,String smajor,String sgrade,String sclass);
	List<Student> selectUnupload(Map<String, Object> map);
	List<Student> getstudentFromsnocnoByPage(Map<String, Object> map);
}
