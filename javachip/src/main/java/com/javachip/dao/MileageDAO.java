package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.MileageVO;

@Repository
public class MileageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.mileageMapper";
	
	public int plusMileage(MileageVO mileageVO) {
		return sqlSession.insert(namespace+".plusMileage", mileageVO);
	}
	public int minusMileage(MileageVO mileageVO) {
		return sqlSession.insert(namespace+".minusMileage", mileageVO);
	}
	public int selectTotalMileage(int uNo) {
		return sqlSession.selectOne(namespace+".selectTotalMileage", uNo);
	}
	public List<MileageVO> selectAllMileage(int uNo) {
		return sqlSession.selectList(namespace+".selectAllMileage", uNo);
	}
}
