package com.ssg.product_manage.mapper;

import com.ssg.product_manage.domain.ProductVO;
import com.ssg.product_manage.dto.PageRequestDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface ProductMapper {

    void insert(ProductVO productVO);
    ProductVO selectOne(Long pno);
    void delete(Long tno);
    void update(ProductVO productVO);
    List<ProductVO> selectList(PageRequestDTO pageRequestDTO);
    int getCount(PageRequestDTO pageRequestDTO);
}
