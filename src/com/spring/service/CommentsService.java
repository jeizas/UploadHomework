package com.spring.service;

import java.util.Map;

import com.spring.model.Comments;

public interface CommentsService {
	int updateBycomment(Map<String, Object> map);
	int insertComments(Map<String, Object> map);
	Comments selectBycomment(String comment);
}
