package com.utech.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;

public interface ResponseMapper {

	List<PSIStockDetail> getAllStockDetails(ResultSet resultSet, PSIDatavo datavo) throws SQLException;

}
