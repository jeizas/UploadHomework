package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.model.Student;

public interface StudentMapper {
	
    List<Student> getAll();/*查询全部信息*/   
    Student selectBysno(String sno);   
    List<String> selectSclass();    
    List<Student> selectBysclas();   
    int insertAll(String sno,String spwd,String sname,String smajor,String sgrade,String sclass);    
    int deleteBykey(String sno);  
    int updateBykey(String sno,String spwd,String sname,String smajor,String sgrade,String sclass);
    List<Student> selectUnupload(Map<String, Object> map);
    List<Student> getstudentFromsnocnoByPage(Map<String, Object> map);
}