package com.utech.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.utech.conection.DBConnection;
import com.utech.conection.MySQLConnection;
import com.utech.mapper.ResponseMapper;
import com.utech.mapper.ResponseMapperImpl;
import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;

public class StockoutRepo implements PSIRespository {

	/**
	 * 
	 */
	private static final long serialVersionUID = -334290211118863154L;
	private DBConnection connection = new MySQLConnection();
	private ResponseMapper responseMapper = new ResponseMapperImpl();
	private static final String[] stockFilterQuery = {
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock inner join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and stock.financial_year=? ;", /* 0 */
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock inner join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and mill.gsm=? and stock.financial_year=?;", /* 1 */
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock inner join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and mill.gsm=? and mill.grade=? and stock.financial_year=? ;", /* 2 */
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock inner join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and mill.gsm=? and mill.grade=? and mill.size=? and stock.financial_year=?;"/* 3 */
	};
	private static final String[] query = {
			"update stockdetails set stock=? ,lastupdated=? where mill_id=? and financial_year=?;", /* 0 */
			"insert into activity(mill_id,opening_stock,used,closing_stock,financial_year,remarks)values(?,?,?,?,?,?);"/* 1 */ };

	@Override
	public boolean isValidUser(USERINFO userinfo) throws SQLException {
		return false;
	}

	@Override
	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException {
		return null;
	}

	@Override
	public List<PSIStockDetail> getFilteredStockByUserQuery(PSIDatavo datavo, int queryIndex, Object... query)
			throws SQLException {
		List<PSIStockDetail> psiStockDetails = null;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(stockFilterQuery[queryIndex]);
			int index = 0;
			for (Object obj : query) {
				pst.setString(++index, (String) obj);
			}
			pst.setString(query.length + 1, datavo.getUserinfo().getFinacialYear());
			ResultSet resultSet = pst.executeQuery();
			psiStockDetails = this.responseMapper.getAllStockDetails(resultSet, null);
		} finally {
			this.connection.getConnection().close();
		}
		return psiStockDetails;
	}

	@Override
	public boolean isMillAvailability(PSIDatavo datavo, String... milldetails) throws SQLException {
		return false;
	}

	@Override
	public boolean doSaveMillDetails(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		return false;
	}

	@Override
	public boolean updateMillDetail(PSIDatavo datavo, PSIStockDetail milldetails) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<PSIStockDetail> getMillDetails(PSIDatavo datavo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean getStockIn(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean getStockout(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		boolean status = false;
		try {
			Connection con = this.connection.getConnection();
			double opening = detail.getPaperDetail().get(0).getStock();
			double closing = opening - detail.getPaperDetail().get(0).getStockOut();
			detail.getPaperDetail().get(0).setClosing(closing);
			detail.getPaperDetail().get(0).setStockIn(0);
			status = getStockInActivityInsert(con, datavo, detail);
			if (!status)
				return false;
			PreparedStatement pst = con.prepareStatement(query[0]);
			pst.setDouble(1, detail.getPaperDetail().get(0).getClosing());
			pst.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
			pst.setInt(3, detail.getMillid());
			pst.setString(4, datavo.getUserinfo().getFinacialYear());
			status = pst.executeUpdate() > 0 ? true : false;
		} finally {
			this.connection.closeConnection();
		}
		return status;
	}

	private boolean getStockInActivityInsert(Connection con, PSIDatavo datavo, PSIStockDetail detail)
			throws SQLException {
		PreparedStatement pst = con.prepareStatement(query[1]);
		pst.setInt(1, detail.getMillid());
		pst.setDouble(2, detail.getPaperDetail().get(0).getStock());
		pst.setDouble(3, detail.getPaperDetail().get(0).getStockOut());
		pst.setDouble(4, detail.getPaperDetail().get(0).getClosing());
		pst.setString(5, datavo.getUserinfo().getFinacialYear());
		pst.setString(6, detail.getPaperDetail().get(0).getRemarks());
		return pst.executeUpdate() > 0 ? true : false;
	}
}
