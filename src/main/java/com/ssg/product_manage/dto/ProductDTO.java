package com.ssg.product_manage.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDTO {
    private int pno;
    private String pname;
    private int price;
    private int quantity;
}
