package com.spring.service;

import java.util.List;

import com.spring.model.Teacher;

public interface TeacherService {
	List<Teacher> getAll();
	Teacher selectBytno(String tno);
	int updateToimage(String tno,String timage);
	int updateTmp(String tno,String tname,String tpwd);
	int deleteBytno(String tno);
	int insertAll(String tno,String tpwd,String tname,String timage);
	int updatePassword(String tno,String tpwd);
}
