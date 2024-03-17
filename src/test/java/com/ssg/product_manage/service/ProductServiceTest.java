package com.ssg.product_manage.service;

import com.ssg.product_manage.domain.ProductVO;
import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.ProductDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
class ProductServiceTest {
    @Autowired
    private ProductService productService;

    @Test
     public void register() {
        ProductDTO productDTO = ProductDTO.builder()
                .pname("snack15")
                .price(2500)
                .quantity(22)
                .build();
        log.info(productDTO);
        productService.register(productDTO);
    }

    @Test
    void getList() {

    }

    @Test
    void getOne() {
        ProductDTO productDTO = productService.getOne(12L);
        log.info(productDTO);
    }

    @Test
    void remove() {
        productService.remove(16L);
    }

    @Test
    void modify() {
        ProductDTO productDTO = ProductDTO.builder()
                .pno(3L)
                .pname("sevicetest")
                .price(20000)
                .quantity(10)
                .build();

        productService.modify(productDTO);
    }
}