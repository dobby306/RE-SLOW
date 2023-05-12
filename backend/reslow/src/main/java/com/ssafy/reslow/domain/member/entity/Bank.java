package com.ssafy.reslow.domain.member.entity;

import java.util.Arrays;

import com.amazonaws.services.kms.model.NotFoundException;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Bank {
	한국은행("001"),
	산업은행("002"),
	기업은행("003"),
	국민은행("004"),
	외환은행("005"),
	수협은행("007"),
	수출입은행("008"),
	농협은행("011"),
	농협회원조합("012"),
	우리은행("020"),
	SC제일은행("023"),
	서울은행("026"),
	한국씨티은행("027"),
	대구은행("031"),
	부산은행("032"),
	광주은행("034"),
	제주은행("035"),
	전북은행("037"),
	경남은행("039"),
	새마을금고연합회("045"),
	신협중앙회("048"),
	상호저축은행("050"),
	기타외국계은행("051"),
	모건스탠리은행("052"),
	HSBC은행("054"),
	도이치은행("055"),
	알비에스피엘씨은행("056"),
	제이피모간체이스은행("057"),
	미즈호코퍼레이트은행("058"),
	미쓰비시도쿄UFJ은행("059"),
	BOA("060"),
	비엔피파리바은행("061"),
	중국공상은행("062"),
	중국은행("063"),
	산림조합("064"),
	대화은행("065"),
	우체국("071"),
	신용보증기금("076"),
	기술신용보증기금("077"),
	하나은행("081"),
	신한은행("088"),
	케이뱅크("089"),
	카카오뱅크("090"),
	토스뱅크("092"),
	한국주택금융공사("093"),
	서울보증보험("094"),
	경찰청("095"),
	금융결제원("099"),
	동양종합금융증권("209"),
	현대증권("218"),
	미래에셋증권("230"),
	대우증권("238"),
	삼성증권("240"),
	한국투자증권("243"),
	NH투자증권("247"),
	교보증권("261"),
	하이투자증권("262"),
	에이치엠씨투자증권("263"),
	키움증권("264"),
	이트레이드증권("265"),
	SK증권("266"),
	대신증권("267"),
	솔로몬투자증권("268"),
	한화증권("269"),
	하나대투증권("270"),
	신한금융투자("278"),
	동부증권("279"),
	유진투자증권("280"),
	메리츠증권("287"),
	엔에이치투자증권("289"),
	부국증권("290"),
	신영증권("291"),
	엘아이지투자증권("292");

	private final String value;

	public String value() {
		return value;
	}

	public static Bank ofValue(String value) {
		return Arrays.stream(Bank.values())
			.filter(v -> value.equals(v.getValue()))
			.findAny()
			.orElseThrow(
				() -> new NotFoundException(String.format("상태코드에 [%s]가 존재하지 않습니다.", value)));
	}
}