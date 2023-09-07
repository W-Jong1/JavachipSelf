package com.javachip.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.PattachVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.productMapper";
	
	public List<ProductVO> selectAllProduct(SearchVO searchVO) {
		return sqlSession.selectList(namespace+".selectAllProduct", searchVO);
	}	
	public int totalProduct(SearchVO searchVO) {
		return sqlSession.selectOne(namespace+".totalProduct", searchVO);
	}
	public List<ProductVO> selectProductType(String pType) {
		return sqlSession.selectList(namespace+".selectProductType", pType);
	}	
	public ProductVO selectOneProduct(int pNo) {
		return sqlSession.selectOne(namespace+".selectOneProduct", pNo);
	}	
	public int insertProduct(ProductVO productVO) {
		return sqlSession.insert(namespace+".insertProduct", productVO);
	}	
	public int inputProduct(ProductVO productVO) {
		return sqlSession.update(namespace+".inputProduct", productVO);
	}	
	public int outputProduct(ProductVO productVO) {
		return sqlSession.update(namespace+".outputProduct", productVO);
	}	
	public int updateProduct(ProductVO productVO) {
		return sqlSession.update(namespace+".updateProduct", productVO);
	}	
	public int deleteProduct(int pNo) {
		return sqlSession.delete(namespace+".deleteProduct", pNo);
	}
	public List<ProductVO> selectIndexProduct() {
		return sqlSession.selectList(namespace+".selectIndexProduct");
	}
	
	// 관리자용 메소드
	// 관리자용 검색기능(메인)
	public List<ProductVO> List(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList(namespace+".selectByAdmin", AdminSearchVO);
	}
	//// 관리자용 검색기능(상품 페이지)
	public List<ProductVO> selectByAdminFromProduct(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList(namespace+".selectByAdminFromProduct", AdminSearchVO);
	}
	// 관리자 상품 목록 전체 갯수(페이징)
	public int productTotal(AdminSearchVO AdminSearchVO)
	{
		int value = 0;
		value = sqlSession.selectOne(namespace+".productTotal", AdminSearchVO);
		return value;
	}
	//상품 상세
	public ProductVO selectOneProductByAdmin(int pNo)
	{
		return sqlSession.selectOne(namespace+".selectOneProductByAdmin", pNo);
	}
	//상품 인서트
	public int insertProductByAdmin(ProductVO productVO)
	{
		return sqlSession.insert(namespace+".insertProductByAdmin", productVO);
	}
	//상품 사진 인서트
	public int insertAttach(PattachVO pattachVO)
	{
		return sqlSession.insert(namespace+".insertAttach", pattachVO);
	}
	//상품 삭제
	public int productDelete(int pNo) {
		return sqlSession.update(namespace+".productDelete", pNo);
	}
	//상품 업데이트
	public int productUpdateByAdmin(ProductVO productVO)
	{
		return sqlSession.update(namespace+".productUpdateByAdmin", productVO);
	}
	//상품 사진 업데이트
	public int pattchUpdateByAdmin(PattachVO pattachVO)
	{
		return sqlSession.update(namespace+".pattchUpdateByAdmin", pattachVO);
	}
	
}
