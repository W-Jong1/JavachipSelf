package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.RefundVO;

@Repository
public class RefundDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.refundMapper";
	
	public List<RefundVO> selectRefund(AdminSearchVO adminSearchVO)
	{
		return sqlSession.selectList(namespace+".selectRefund", adminSearchVO);
	}
	
	public int RefundTotal(AdminSearchVO adminSearchVO)
	{
		int value = 0;
		value = sqlSession.selectOne(namespace+".RefundTotal", adminSearchVO);
		return value;
	}

}
