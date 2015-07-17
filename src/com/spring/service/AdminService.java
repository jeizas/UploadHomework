package com.spring.service;

import java.util.List;

import com.spring.model.Admin;

public interface AdminService {
	List<Admin> getAll();
	int updateBykey(String ano,String apwd);
}
