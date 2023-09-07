package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.MileageVO;

@Service
public interface MileageService {
	int plusMileage(MileageVO mileageVO);
	int minusMileage(MileageVO mileageVO);
	int selectTotalMileage(int uNo);
	List<MileageVO> selectAllMileage(int uNo);
}
