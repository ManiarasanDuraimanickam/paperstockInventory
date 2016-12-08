package com.utech.mapper;

import java.sql.ResultSet;

import com.utech.model.PSIDatavo;

public interface ResponseMapper {

	void getAllStockDetails(ResultSet resultSet, PSIDatavo datavo);

}
