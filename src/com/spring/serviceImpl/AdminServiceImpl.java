package com.spring.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.AdminMapper;
import com.spring.model.Admin;
import com.spring.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource
	AdminMapper adminMpper = null;
	
	@Override
	public List<Admin> getAll() {
		// TODO Auto-generated method stub
		return this.adminMpper.getAll();
	}

	@Override
	public int updateBykey(String ano, String apwd) {
		// TODO Auto-generated method stub
		return this.adminMpper.updateBykey(ano, apwd);
	}

}
