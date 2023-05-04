package org.zerock.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.myapp.exception.ControllerException;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
//@AllArgsConstructor

@RequestMapping("/mypage/*")
@Controller
public class MypageController {
	
	// OrderList(주문 내역) 페이지 단순 진입
	@GetMapping("/orderList")
//	@GetMapping("/orderList/{id}")
	public String orderList() {
//	public String orderList(@PathVariable("id") String id, Model model) throws ControllerException {
		
		log.trace("orderList() invoked.");
//		log.trace("orderList({},{}) invoked.", id, model);
		
		return "mypage/OrderList";

	} // orderList()
	
	// OrderDetails(주문 상세 내역) 페이지 단순 진입
	@GetMapping("/orderDetails")
//	@GetMapping("/orderDetails/{id}")
	public String orderDetails() {
//	public String orderDetails(@PathVariable("id") String id, Model model) throws ControllerException {
		
		log.trace("orderDetails() invoked.");
//		log.trace("orderDetails({},{}) invoked.", id, model);

		return "mypage/OrderDetails";
		
	} // orderDetails()
	
} // end class
