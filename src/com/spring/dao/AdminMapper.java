package com.spring.dao;

import java.util.List;

import com.spring.model.Admin;

public interface AdminMapper {
    List<Admin> getAll();
    int updateBykey(String ano,String apwd);
}