package com.spring.dao;

import java.util.Map;

import com.spring.model.Comments;


public interface CommentsMapper {
    /*int deleteByPrimaryKey(String comment);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(String comment);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKey(Comments record);*/
	
	int updateBycomment(Map<String, Object> map);
	int insertComments(Map<String, Object> map);
	Comments selectBycomment(String comment);
}