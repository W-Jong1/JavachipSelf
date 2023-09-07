package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.ProductDAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.PattachVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Repository
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> selectAllProduct(SearchVO searchVO) {
		return productDAO.selectAllProduct(searchVO);
	}
	@Override
	public int totalProduct(SearchVO searchVO) {
		return productDAO.totalProduct(searchVO);
	}
	@Override
	public List<ProductVO> selectProductType(String pType) {
		return productDAO.selectProductType(pType);
	}
	@Override
	public ProductVO selectOneProduct(int pNo) {
		return productDAO.selectOneProduct(pNo);
	}
	@Override
	public int insertProduct(ProductVO productVO) {
		return productDAO.insertProduct(productVO);
	}
	@Override
	public int inputProduct(ProductVO productVO) {
		return productDAO.inputProduct(productVO);
	}
	@Override
	public int outputProduct(ProductVO productVO) {
		return productDAO.outputProduct(productVO);
	}
	@Override
	public int updateProduct(ProductVO productVO) {
		return productDAO.updateProduct(productVO);
	}
	@Override
	public int deleteProduct(int pNo) {
		return productDAO.deleteProduct(pNo);
	}
	@Override
	public java.util.List<ProductVO> selectIndexProduct() {
		return productDAO.selectIndexProduct();
	}
	
	//관리자용 메소드
	//상품리스트(검색기능, 메인 페이지)
	@Override
	public java.util.List<ProductVO> List(AdminSearchVO AdminSearchVO) {
		return productDAO.List(AdminSearchVO);
	}
	//상품리스트(상품페이지)
	@Override
	public java.util.List<ProductVO> selectByAdminFromProduct(AdminSearchVO AdminSearchVO) {
		return productDAO.selectByAdminFromProduct(AdminSearchVO);
	}
	@Override
	public int productTotal(AdminSearchVO AdminSearchVO) {
		return productDAO.productTotal(AdminSearchVO);
	}
	@Override
	public ProductVO selectOneProductByAdmin(int pNo) {
		return productDAO.selectOneProductByAdmin(pNo);
	}
	@Override
	public int insertProductByAdmin(ProductVO productVO) 
	{
		return productDAO.insertProductByAdmin(productVO);
	}
	@Override
	public int insertAttach(PattachVO pattachVO) 
	{
		return productDAO.insertAttach(pattachVO);
	}
	@Override
	public int productDelete(int pNo)
	{
		return productDAO.productDelete(pNo);
	}
	@Override
	public int productUpdateByAdmin(ProductVO productVO) 
	{
		return productDAO.productUpdateByAdmin(productVO);
	}
	@Override
	public int pattchUpdateByAdmin(PattachVO pattachVO) {
		return productDAO.pattchUpdateByAdmin(pattachVO);
	}
	
}
