package com.ssafy.reslow.domain.coupon.service;

import static com.ssafy.reslow.global.exception.ErrorCode.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.SliceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.reslow.domain.coupon.dto.CouponCreateRequest;
import com.ssafy.reslow.domain.coupon.dto.CouponListResponse;
import com.ssafy.reslow.domain.coupon.dto.IssuedCouponListResponse;
import com.ssafy.reslow.domain.coupon.entity.Coupon;
import com.ssafy.reslow.domain.coupon.entity.IssuedCoupon;
import com.ssafy.reslow.domain.coupon.repository.CouponRepository;
import com.ssafy.reslow.domain.coupon.repository.IssuedCouponRepository;
import com.ssafy.reslow.domain.manager.entity.Manager;
import com.ssafy.reslow.domain.manager.repository.ManagerRepository;
import com.ssafy.reslow.domain.member.entity.Member;
import com.ssafy.reslow.domain.member.repository.MemberRepository;
import com.ssafy.reslow.global.exception.CustomException;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CouponService {

	private final CouponRepository couponRepository;
	private final ManagerRepository managerRepository;
	private final MemberRepository memberRepository;
	private final IssuedCouponRepository issuedCouponRepository;

	public Slice<CouponListResponse> getAllValidCoupons(Pageable pageable) {
		LocalDateTime now = LocalDateTime.now();
		Slice<Coupon> coupons = couponRepository.findByStartDateGreaterThanEqualAndEndDateLessThanEqual(now, now,
			pageable);
		List<CouponListResponse> couponListResponses = coupons.getContent()
			.stream()
			.map(CouponListResponse::of)
			.collect(Collectors.toList());
		return new SliceImpl<>(couponListResponses, pageable, coupons.hasNext());
	}

	public Slice<IssuedCouponListResponse> getMyValidCoupons(Long memberNo, Pageable pageable) {
		Member member = memberRepository.findById(memberNo).orElseThrow(() -> new CustomException(MEMBER_NOT_FOUND));

		LocalDateTime now = LocalDateTime.now();
		Slice<IssuedCoupon> coupons = issuedCouponRepository.findMyValidCoupon(memberNo, now, pageable);
		List<IssuedCouponListResponse> couponListResponses = coupons.getContent()
			.stream()
			.map(IssuedCouponListResponse::of)
			.collect(Collectors.toList());
		return new SliceImpl<>(couponListResponses, pageable, coupons.hasNext());
	}

	public Map<String, Long> createCoupon(Long managerNo, CouponCreateRequest couponCreateRequest) {
		Manager manager = managerRepository.findById(managerNo).orElseThrow(() -> new CustomException(FORBIDDEN));
		Coupon coupon = Coupon.of(couponCreateRequest);
		Coupon createdCoupon = couponRepository.save(coupon);

		Map<String, Long> map = new HashMap<>();
		map.put("couponNo", createdCoupon.getNo());
		return map;
	}

	public Map<String, Long> deleteCoupon(Long managerNo, Long couponNo) {
		Manager manager = managerRepository.findById(managerNo).orElseThrow(() -> new CustomException(FORBIDDEN));
		couponRepository.deleteById(couponNo);

		Map<String, Long> map = new HashMap<>();
		map.put("couponNo", couponNo);
		return map;
	}

}
