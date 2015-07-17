package com.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.SettaskMapper;
import com.spring.model.Settask;
import com.spring.service.SettaskService;

@Service("settaskService")
public class SettaskServiceImpl implements SettaskService {
	
	@Resource
	public SettaskMapper settaskMapper = null;

	@Override
	public List<Settask> getAll(String cno) {
		// TODO Auto-generated method stub
		return this.settaskMapper.getAll(cno);
	}

	@Override
	public int updateBycomment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.settaskMapper.updateBycomment(map);
	}

	@Override
	public Settask selectBycnosctimes(String cno, String sctimes) {
		// TODO Auto-generated method stub
		return this.settaskMapper.selectBycnosctimes(cno, sctimes);
	}

	@Override
	public List<Settask> selectBycno(String cno) {
		// TODO Auto-generated method stub
		return this.settaskMapper.selectBycno(cno);
	}

	@Override
	public String selectsctimeMax(String cno) {
		// TODO Auto-generated method stub
		return this.settaskMapper.selectsctimeMax(cno);
	}

	@Override
	public int insertAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.settaskMapper.insertAll(map);
	}

	@Override
	public int updateBykey(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.settaskMapper.updateBykey(map);
	}

}
