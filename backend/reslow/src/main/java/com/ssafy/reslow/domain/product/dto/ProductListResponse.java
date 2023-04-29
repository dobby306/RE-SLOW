package com.ssafy.reslow.domain.product.dto;

import java.time.LocalDate;

import com.ssafy.reslow.domain.product.entity.Product;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ProductListResponse {

	private String title;
	private int price;
	private int status;
	private LocalDate date;
	private String image;

	public static ProductListResponse of(Product product, String image, int status) {
		return ProductListResponse.builder()
			.title(product.getTitle())
			.price(product.getPrice())
			.status(status)
			.date(product.getCreatedDate().toLocalDate())
			.image(image)
			.build();
	}
}