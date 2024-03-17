package com.ssg.product_manage.mapper;

import com.ssg.product_manage.domain.ProductVO;
import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.ProductDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.swing.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
class ProductMapperTest {

    @Autowired(required = false)
    private ProductMapper productMapper;

    @Test
    void insert() {
        ProductVO productVO = ProductVO.builder()
                .pname("snack")
                .price(1800)
                .quantity(3)
                .build();
        productMapper.insert(productVO);
    }

    @Test
    void selectOne() {
        ProductVO productVO = productMapper.selectOne(1L);
        log.info(productVO);
    }

    @Test
    void delete() {
        productMapper.delete(1L);
    }

    @Test
    void update() {
        ProductVO productVO = ProductVO.builder()
                .pno(1L)
                .pname("updateSnackName")
                .price(2000)
                .quantity(10)
                .build();
        productMapper.update(productVO);
    }

    @Test
    void selectList() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .build();
        List<ProductVO> productDTOList = productMapper.selectList(pageRequestDTO);
        productDTOList.forEach(vo -> log.info(vo));
    }

}