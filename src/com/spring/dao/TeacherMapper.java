package com.spring.dao;

import java.util.List;
import com.spring.model.Teacher;

public interface TeacherMapper {
	public List<Teacher> getAll();
	public Teacher selectBytno(String tno);
	public int updateToimage(String tno,String timage);
	public int updateTmp(String tno,String tname,String tpwd);
	public int deleteBytno(String tno);
	public int insertAll(String tno,String tpwd,String tname,String timage);
	public int updatePassword(String tno,String tpwd);
}