package com.spring.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.dao.SCMapper;
import com.spring.model.SC;
import com.spring.service.ScService;

@Service("scService")
public class ScServiceImpl implements ScService {
	
	@Resource
	public SCMapper scMapper = null;

	@Override
	public String selectAllbykey(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.selectAllbykey(map);
	}

	@Override
	public int updatebykey(SC sc) {
		// TODO Auto-generated method stub
		return this.scMapper.updatebykey(sc);
	}

	@Override
	public int insertSelective(SC sc) {
		// TODO Auto-generated method stub
		return this.scMapper.insertSelective(sc);
	}

	@Override
	public List<SC> selectBysnocno(String sno, String cno) {
		// TODO Auto-generated method stub
		return this.scMapper.selectBysnocno(sno, cno);
	}

	@Override
	public List<SC> getscFromsnocnoByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.getscFromsnocnoByPage(map);
	}

	@Override
	public List<SC> selectBysclasstimes(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.selectBysclasstimes(map);
	}

	@Override
	public List<SC> selectBycno(String cno) {
		// TODO Auto-generated method stub
		return this.scMapper.selectBycno(cno);
	}

	@Override
	public List<SC> getscFromcnoByPage(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.getscFromcnoByPage(map);
	}

	@Override
	public List<SC> getscFromsclasstimesByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.getscFromsclasstimesByPage(map);
	}

	@Override
	public SC selectBysnocnosctimes(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.selectBysnocnosctimes(map);
	}

	@Override
	public int updateToscfile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.updateToscfile(map);
	}

	@Override
	public int updateTOallowlook(String cno,String sctimes) {
		// TODO Auto-generated method stub
		return this.scMapper.updateTOallowlook(cno,sctimes);
	}

	@Override
	public int updateTolook(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.scMapper.updateTolook(map);
	}


}
