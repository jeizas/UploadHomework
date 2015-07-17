package com.spring.dao;

import java.util.List;
import com.spring.model.Course;

public interface CourseMapper {
	
	public List<Course> getAll();
	
	public Course selectBycno(String cno);
	
	public int insertAll(String cno,String cname,String csummary,String cimage);
	
	public int deleteBykey(String cno);
	
	public int updateToimage(String cno,String cimage);
	
	public int updateCMY(String cno,String cname,String csummary);
}