package com.ssg.product_manage.service;

import com.ssg.product_manage.domain.ProductVO;
import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.PageResponseDTO;
import com.ssg.product_manage.dto.ProductDTO;

public interface ProductService {

    void register(ProductDTO productDTO);

    PageResponseDTO<ProductDTO> getList(PageRequestDTO pageRequestDTO);

    ProductDTO getOne(Long pno);

    void remove(Long pno);

    void modify(ProductDTO productDTO);
}
