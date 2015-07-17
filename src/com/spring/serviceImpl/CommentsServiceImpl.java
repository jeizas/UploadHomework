package com.spring.serviceImpl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.CommentsMapper;
import com.spring.model.Comments;
import com.spring.service.CommentsService;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
	
	@Resource
	public CommentsMapper commentsMapper = null;

	@Override
	public int updateBycomment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.commentsMapper.updateBycomment(map);
	}

	@Override
	public int insertComments(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.commentsMapper.insertComments(map);
	}

	@Override
	public Comments selectBycomment(String comment) {
		// TODO Auto-generated method stub
		return this.commentsMapper.selectBycomment(comment);
	}

}
