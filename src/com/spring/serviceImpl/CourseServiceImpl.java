package com.spring.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.CourseMapper;
import com.spring.model.Course;
import com.spring.service.CourseService;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Resource
	CourseMapper courseMapper = null;

	@Override
	public List<Course> getAll() {
		// TODO Auto-generated method stub
		return this.courseMapper.getAll();
	}

	@Override
	public Course selectBycno(String cno) {
		// TODO Auto-generated method stub
		return this.courseMapper.selectBycno(cno);
	}

	@Override
	public int insertAll(String cno, String cname, String csummary,
			String cimage) {
		// TODO Auto-generated method stub
		return this.courseMapper.insertAll(cno, cname, csummary, cimage);
	}

	@Override
	public int deleteBykey(String cno) {
		// TODO Auto-generated method stub
		return this.courseMapper.deleteBykey(cno);
	}

	@Override
	public int updateToimage(String cno, String cimage) {
		// TODO Auto-generated method stub
		return this.courseMapper.updateToimage(cno, cimage);
	}

	@Override
	public int updateCMY(String cno, String cname, String csummary) {
		// TODO Auto-generated method stub
		return this.courseMapper.updateCMY(cno, cname, csummary);
	}

}
