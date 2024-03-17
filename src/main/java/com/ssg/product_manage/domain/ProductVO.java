package com.ssg.product_manage.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ProductVO {
    private long pno;
    private String pname;
    private int price;
    private int quantity;
}
