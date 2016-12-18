package com.utech.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.PaperDetail;

public class ResponseMapperImpl implements ResponseMapper {

	@Override
	public List<PSIStockDetail> getAllStockDetails(ResultSet rs, PSIDatavo datavo) throws SQLException {
		List<PSIStockDetail> stockDetails = new ArrayList<>();
		PSIStockDetail stockDetail = null;
		while (rs.next()) {
			int index = -1;
			String millname = rs.getString("millname");
			index = getSearchedIndex(stockDetails, millname);
			if (index > -1) {
				PaperDetail detail = new PaperDetail();
				detail.setGsm(rs.getString("gsm"));
				detail.setGrade(rs.getString("grade"));
				detail.setSize(rs.getString("size"));
				detail.setStock(rs.getDouble("stock"));
				stockDetails.get(index).getPaperDetail().add(detail);
			} else {
				stockDetail = new PSIStockDetail();
				stockDetail.setMillname(millname);
				stockDetail.setAddress(rs.getString("address"));
				stockDetail.setContactNum(rs.getString("phone"));
				stockDetail.setMailId(rs.getString("mailid"));
				stockDetail.setEntryDate(getParsedDate(rs.getTimestamp("createdon")));
				stockDetail.setMillid(rs.getInt("mill_id"));
				List<PaperDetail> paperDetails = new ArrayList<>();
				PaperDetail detail = new PaperDetail();
				detail.setGsm(rs.getString("gsm"));
				detail.setGrade(rs.getString("grade"));
				detail.setSize(rs.getString("size"));
				detail.setStock(rs.getDouble("stock"));
				paperDetails.add(detail);
				stockDetail.setPaperDetail(paperDetails);
				stockDetails.add(stockDetail);
			}

		}
		return stockDetails;
	}

	private int getSearchedIndex(List<PSIStockDetail> stockDetails, String millname) {
		int index = 0;
		for (PSIStockDetail stockDetail : stockDetails) {
			if (stockDetail.getMillname().equalsIgnoreCase(millname)) {
				return index;
			}
			index = index + 1;
		}
		return -1;
	}

	private Date getParsedDate(Timestamp timestamp) {
		// TODO Auto-generated method stub
		return new Date(timestamp.getTime());
	}

	@Override
	public List<PSIStockDetail> getMillDetails(ResultSet rs, PSIDatavo datavo) throws SQLException {
		// TODO Auto-generated method stub
		List<PSIStockDetail> stockDetails = new ArrayList<>();
		PSIStockDetail stockDetail = null;
		while (rs.next()) {
			stockDetail = new PSIStockDetail();
			stockDetail.setMillname(rs.getString("millname"));
			stockDetail.setAddress(rs.getString("address"));
			stockDetail.setMillid(rs.getInt("sno"));
			stockDetail.setContactNum(rs.getString("phone"));
			stockDetail.setMailId(rs.getString("mailid"));
			stockDetail.setEntryDate(getParsedDate(rs.getTimestamp("createdon")));
			List<PaperDetail> paperDetails = new ArrayList<>();
			PaperDetail detail = new PaperDetail();
			detail.setGsm(rs.getString("gsm"));
			detail.setGrade(rs.getString("grade"));
			detail.setSize(rs.getString("size"));
			// detail.setStock(rs.getDouble("stock"));
			detail.setRemarks(rs.getString("remarks"));
			paperDetails.add(detail);
			stockDetail.setPaperDetail(paperDetails);
			stockDetails.add(stockDetail);
		}
		return stockDetails;
	}

	@Override
	public List<PSIStockDetail> mapLast30DaysPurchaseTrans(ResultSet rs, PSIDatavo datavo, boolean isStockOut)
			throws SQLException {
		List<PSIStockDetail> stockDetails = new ArrayList<>();
		PSIStockDetail stockDetail = null;
		while (rs.next()) {
			int index = -1;
			String millname = rs.getString("millname");
			index = getSearchedIndex(stockDetails, millname);
			if (index > -1) {
				PaperDetail detail = new PaperDetail();
				detail.setOpening(rs.getDouble("opening"));
				if (isStockOut)
					detail.setStockOut(rs.getDouble("used"));
				else
					detail.setStockIn(rs.getDouble("purchase"));
				detail.setClosing(rs.getDouble("closing"));
				detail.setCreatedon(rs.getString("created"));
				detail.setRemarks(rs.getString("remark"));
				detail.setGsm(rs.getString("gsm"));
				detail.setGrade(rs.getString("grade"));
				detail.setSize(rs.getString("size"));

				stockDetails.get(index).getPaperDetail().add(detail);
			} else {
				stockDetail = new PSIStockDetail();
				stockDetail.setMillname(millname);
				stockDetail.setMillid(rs.getInt("millid"));
				List<PaperDetail> paperDetails = new ArrayList<>();
				PaperDetail detail = new PaperDetail();
				detail.setOpening(rs.getDouble("opening"));
				if (isStockOut)
					detail.setStockOut(rs.getDouble("used"));
				else
					detail.setStockIn(rs.getDouble("purchase"));
				detail.setClosing(rs.getDouble("closing"));
				detail.setCreatedon(rs.getString("created"));
				detail.setRemarks(rs.getString("remark"));
				detail.setGsm(rs.getString("gsm"));
				detail.setGrade(rs.getString("grade"));
				detail.setSize(rs.getString("size"));
				paperDetails.add(detail);
				stockDetail.setPaperDetail(paperDetails);
				stockDetails.add(stockDetail);
			}
		}
		return stockDetails;
	}
}
