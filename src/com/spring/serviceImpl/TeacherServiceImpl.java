package com.spring.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.TeacherMapper;
import com.spring.model.Teacher;
import com.spring.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
	
	@Resource
	public TeacherMapper teacherMapper = null;

	@Override
	public List<Teacher> getAll() {
		// TODO Auto-generated method stub
		return this.teacherMapper.getAll();
	}

	@Override
	public Teacher selectBytno(String tno) {
		// TODO Auto-generated method stub
		return this.teacherMapper.selectBytno(tno);
	}

	@Override
	public int updateToimage(String tno, String timage) {
		// TODO Auto-generated method stub
		return this.teacherMapper.updateToimage(tno, timage);
	}

	@Override
	public int updateTmp(String tno, String tname, String tpwd) {
		// TODO Auto-generated method stub
		return this.teacherMapper.updateTmp(tno, tname, tpwd);
	}

	@Override
	public int deleteBytno(String tno) {
		// TODO Auto-generated method stub
		return this.teacherMapper.deleteBytno(tno);
	}

	@Override
	public int insertAll(String tno, String tpwd, String tname, String timage) {
		// TODO Auto-generated method stub
		return this.teacherMapper.insertAll(tno, tpwd, tname, timage);
	}

	@Override
	public int updatePassword(String tno, String tpwd) {
		// TODO Auto-generated method stub
		return this.teacherMapper.updatePassword(tno, tpwd);
	}

}
