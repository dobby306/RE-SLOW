package com.ssafy.reslow.domain.knowhow.dto;

import com.ssafy.reslow.domain.knowhow.entity.KnowhowContent;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class KnowhowContentDetail {
	Long order;
	Long contentNo;
	String image;
	String content;

	public static KnowhowContentDetail ofEntity(Long order, KnowhowContent knowhowContent) {
		return KnowhowContentDetail.builder()
			.order(order)
			.contentNo(knowhowContent.getNo())
			.image(knowhowContent.getImage())
			.content(knowhowContent.getContent())
			.build();
	}
}
