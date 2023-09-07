package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.PattachVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Service
public interface ProductService {
	List<ProductVO> selectAllProduct(SearchVO searchVO);
	int totalProduct(SearchVO searchVO);
	List<ProductVO> selectProductType(String pType);
	ProductVO selectOneProduct(int pNo);
	int insertProduct(ProductVO productVO);
	int inputProduct(ProductVO productVO);
	int outputProduct(ProductVO productVO);
	int updateProduct(ProductVO productVO);
	int deleteProduct(int pNo);
	List<ProductVO> selectIndexProduct();
	
	//관리자 메소드
	//관리자용 상품 리스트(검색기능,메인 페이지)
	List<ProductVO> List(AdminSearchVO AdminSearchVO);
	//관리자용 상품 리스트(상품페이지)
	List<ProductVO> selectByAdminFromProduct(AdminSearchVO AdminSearchVO);
	//상픔 전체 목록 갯수(페이징)
	int productTotal(AdminSearchVO AdminSearchVO);
	//상품 상세
	ProductVO selectOneProductByAdmin(int pNo);
	//상품 등록(인서트)
	int insertProductByAdmin(ProductVO productVO);
	//상품 사진 인서트
	int insertAttach(PattachVO pattachVO);
	//상품 삭제
	int productDelete(int pNo);
	//상품 업뎃
	int productUpdateByAdmin(ProductVO productVO);
	//사진 업뎃
	int pattchUpdateByAdmin(PattachVO pattachVO);
}
