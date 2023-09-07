package com.javachip.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.PattachVO;

@Repository
public class PattachDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.pattachMapper";
	
	public PattachVO selectPattach(int pNo) {
		return sqlSession.selectOne(namespace+".selectPattach", pNo);
	}
	public int insertPattach(PattachVO pattachVO) {
		return sqlSession.insert(namespace+".insertPattach", pattachVO);
	}
	public int deletePattach(int pNo) {
		return sqlSession.delete(namespace+".deletePattach", pNo);
	}
	public int updatePattach(PattachVO pattachVO) {
		return sqlSession.update(namespace+".updatePattach", pattachVO);
	}
}
