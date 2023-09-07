package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.MileageDAO;
import com.javachip.vo.MileageVO;

@Repository
public class MileageServiceImple implements MileageService {
	
	@Autowired
	private MileageDAO mileageDAO;

	@Override
	public int plusMileage(MileageVO mileageVO) {
		return mileageDAO.plusMileage(mileageVO);
	}

	@Override
	public int minusMileage(MileageVO mileageVO) {
		return mileageDAO.minusMileage(mileageVO);
	}

	@Override
	public int selectTotalMileage(int uNo) {
		return mileageDAO.selectTotalMileage(uNo);
	}

	@Override
	public List<MileageVO> selectAllMileage(int uNo) {
		return mileageDAO.selectAllMileage(uNo);
	}
	
}
