package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AddressVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;

@Repository
public class AddressDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.addressMapper";
	
	//메인배송지 조회
    public AddressVO addressSelect(int uNo) {
        return sqlSession.selectOne(namespace+".addressSelect", uNo);
    }
	
	public int addressSaved(AddressVO vo) {
		return sqlSession.insert(namespace+".addressSaved", vo);
	}
	
	//배송시 전달사항
	public int updateComment(AddressVO addressVO)
	{
		return sqlSession.update(namespace+".updateComment", addressVO);
	}
	
	//추가배송지 조회
	public AddressVO addressSelectSub(int uNo)
	{
		return sqlSession.selectOne(namespace+".addressSelectSub", uNo);
	}
	
	//주문자 정보와 동일
	public UserVO SamePerson(int uNo) {
		return sqlSession.selectOne(namespace+".SamePerson", uNo);
	}
	
	//배송지 저장,수정
	public int updateAddress(AddressVO addressVO) {
		return sqlSession.update(namespace+".updateAddress", addressVO);
	}
	public int insertAddress(AddressVO addressVO) {
		return sqlSession.insert(namespace+".insertAddress", addressVO);
	}
	public int countAdd(int uNo) {
		return sqlSession.selectOne(namespace+".countAdd", uNo);
	}
}
