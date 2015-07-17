package com.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.StudentMapper;
import com.spring.model.Student;
import com.spring.service.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Resource
	private StudentMapper studentMapper;
	
	@Override
	public List<Student> getAll() {
		// TODO Auto-generated method stub
		return this.studentMapper.getAll();
	}

	@Override
	public Student selectBysno(String sno) {
		// TODO Auto-generated method stub
		return this.studentMapper.selectBysno(sno);
	}

	@Override
	public List<String> selectSclass() {
		// TODO Auto-generated method stub
		return this.studentMapper.selectSclass();
	}

	@Override
	public List<Student> selectBysclas() {
		// TODO Auto-generated method stub
		return this.studentMapper.selectBysclas();
	}

	@Override
	public int insertAll(String sno, String spwd, String sname, String smajor,
			String sgrade, String sclass) {
		// TODO Auto-generated method stub
		return this.studentMapper.insertAll(sno, spwd, sname, smajor, sgrade, sclass);
	}

	@Override
	public int deleteBykey(String sno) {
		// TODO Auto-generated method stub
		return this.studentMapper.deleteBykey(sno);
	}

	@Override
	public int updateBykey(String sno, String spwd, String sname,
			String smajor, String sgrade, String sclass) {
		// TODO Auto-generated method stub
		return this.studentMapper.updateBykey(sno, spwd, sname, smajor, sgrade, sclass);
	}

	@Override
	public List<Student> selectUnupload(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.studentMapper.selectUnupload(map);
	}

	@Override
	public List<Student> getstudentFromsnocnoByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.studentMapper.getstudentFromsnocnoByPage(map);
	}
}
