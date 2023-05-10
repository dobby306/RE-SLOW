package com.ssafy.reslow.domain.notice.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

import com.ssafy.reslow.domain.coupon.entity.Coupon;
import com.ssafy.reslow.domain.member.entity.Member;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "NOTICE_TB")
public class Notice {
	@Id
	@GeneratedValue
	@Column(name = "NOTICE_PK")
	private Long no;

	@Column(name = "CONTENT")
	private String content;

	@Column(name = "NOTICE_DT", updatable = false)
	@CreatedDate
	private LocalDateTime alertTime;

	@Column(name = "NOTICE_TYPE")
	private String type;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_PK")
	private Member member;
}