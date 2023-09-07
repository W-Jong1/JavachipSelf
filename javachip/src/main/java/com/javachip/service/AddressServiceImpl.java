package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.AddressDAO;
import com.javachip.vo.AddressVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;

@Repository
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressDAO addressDAO;
	
	//메인 배송지 조회
	@Override
	public AddressVO addressSelect(int uNo) {
		
		return addressDAO.addressSelect(uNo);
	}
	
	@Override
	public int addressSaved(AddressVO vo) {
		
		return addressDAO.addressSaved(vo);
	}

	@Override
	public int updateComment(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return addressDAO.updateComment(addressVO);
	}

	//추가 배송지 조회
	@Override
	public AddressVO addressSelectSub(int uNo) {
		// TODO Auto-generated method stub
		return addressDAO.addressSelectSub(uNo);
	}

	//주문자 정보와 동일
	@Override
	public UserVO SamePerson(int uNo) {
		// TODO Auto-generated method stub
		return addressDAO.SamePerson(uNo);
	}

	
	//배송지 /수정저장
	@Override
	public int updateAddress(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return addressDAO.updateAddress(addressVO);
	}

	@Override
	public int insertAddress(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return addressDAO.insertAddress(addressVO);
	}

	@Override
	public int countAdd(int uNo) {
		// TODO Auto-generated method stub
		return addressDAO.countAdd(uNo);
	}
}
