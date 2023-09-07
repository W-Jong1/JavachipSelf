package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AddressVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;

@Service
public interface AddressService {
	//메인 배송지 조회
	AddressVO addressSelect(int uNo);
	int addressSaved(AddressVO vo);
	
	//배송시 전달사항
	int updateComment(AddressVO addressVO);
	//추가 배송지 조회
	AddressVO addressSelectSub(int uNo);
	
	//주문자 정보와 동일
	UserVO SamePerson(int uNo);
	
	//배송지 저장/수정
	int updateAddress(AddressVO addressVO);
	
	int insertAddress(AddressVO addressVO);
	
	int countAdd(int uNo);
}
