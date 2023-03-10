package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Address;
import com.doptori.entity.Crop;

@Mapper
public interface AddressMapper {

	public List<Address> gugunList();

	public List<Address> dongList();

	public List<Address> fulladdress(int fdm1_ad_num);

	public List<Address> gugunmodelList();

	public List<Address> dongmodelList();

	public List<Crop> CropList();

	
	
}
