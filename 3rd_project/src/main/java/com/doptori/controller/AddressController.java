package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Address;
import com.doptori.mapper.AddressMapper;

@RestController
public class AddressController {

	@Autowired
	private AddressMapper mapper;
	
	@GetMapping("/ad_gugun.do")
	public List<Address> gugunList() {
		List<Address> list = mapper.gugunList();
		
		return list;
	}
	
	@GetMapping("/ad_dong.do")
	public List<Address> dongList() {
		List<Address> list = mapper.dongList();		
		return list;
	}
	
	@GetMapping("/fulladdress.do/{fdm1_ad_num}")
	public List<Address> fulladdress(@PathVariable("fdm1_ad_num")int fdm1_ad_num) {
		List<Address> list = mapper.fulladdress(fdm1_ad_num);
		System.out.println(list);
		return list;
	}
	
	
}
