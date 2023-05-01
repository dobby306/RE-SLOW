package com.ssafy.reslow.domain.product.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ssafy.reslow.domain.member.entity.Member;
import com.ssafy.reslow.domain.order.entity.OrderStatus;
import com.ssafy.reslow.domain.product.dto.ProductListProjection;
import com.ssafy.reslow.domain.product.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	Slice<Product> findByMemberAndOrder_StatusOrOrderIsNull(Member member, OrderStatus status, Pageable pageable);

	Slice<Product> findByMemberAndOrder_StatusIsGreaterThanEqual(Member member, OrderStatus status, Pageable pageable);

	Slice<Product> findByMemberAndOrder_Status(Member member, OrderStatus status, Pageable pageable);

	Slice<ProductListProjection> findByMemberIsNotAndCategoryAndKeyword(String keyword, Long category,
		Pageable pageable);

	List<Product> findByIdIn(List<Long> pkList);
}
