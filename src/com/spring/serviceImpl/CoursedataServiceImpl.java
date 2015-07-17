package com.spring.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.CoursedataMapper;
import com.spring.model.Coursedata;
import com.spring.service.CoursedataService;

@Service("coursedataService")
public class CoursedataServiceImpl implements CoursedataService{

	@Resource
	public CoursedataMapper coursedataMapper = null;

	@Override
	public int insert(Coursedata record) {
		// TODO Auto-generated method stub
		return this.coursedataMapper.insert(record);
	}

	@Override
	public List<Coursedata> selcetBycno(String cno) {
		// TODO Auto-generated method stub
		return this.coursedataMapper.selectBycno(cno);
	}

	@Override
	public List<Coursedata> selectAll() {
		// TODO Auto-generated method stub
		return this.coursedataMapper.selectAll();
	}

	@Override
	public int deleteBykey(String cno, String dname) {
		// TODO Auto-generated method stub
		return this.coursedataMapper.deleteBykey(cno, dname);
	}

	

}
