package com.javachip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.PattachDAO;
import com.javachip.vo.PattachVO;

@Repository
public class PattachServiceImpl implements PattachService {
	@Autowired
	private PattachDAO pattachDAO;

	@Override
	public PattachVO selectPattach(int pNo) {
		return pattachDAO.selectPattach(pNo);
	}
	@Override
	public int insertPattach(PattachVO pattachVO) {
		return pattachDAO.insertPattach(pattachVO);
	}
	@Override
	public int deletePattach(int pNo) {
		return pattachDAO.deletePattach(pNo);
	}
	@Override
	public int insertAttach(PattachVO pattachVO) {
		return pattachDAO.updatePattach(pattachVO);
	}
}
