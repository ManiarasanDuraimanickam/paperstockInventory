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
import com.utech.util.Constants;
import com.utech.util.ControllerUtil;

public class PSIRepositoryImpl implements PSIRespository {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4360965807739632241L;
	private DBConnection connection = new MySQLConnection();
	private ResponseMapper responseMapper = new ResponseMapperImpl();

	private static final String[] query = {
			"select * from auth where uname=? and pass=? and rights=? and financialYear=?", /* 0 */
			"select * from stockdetails inner join milldetails on stockdetails.mill_id=milldetails.sno;", /* 1 */
			"select * from milldetails where milldetails.millname=? and milldetails.gsm=? and milldetails.grade=? and milldetails.size=?;", /* 2 */
			"insert into milldetails(millname,gsm,grade,size,address,mailid,phone,remarks)values(?,?,?,?,?,?,?,?); ", /* 3 */
			"update milldetails set millname=?,gsm=?,grade=?,size=?,address=?,mailid=?,phone=?,remarks=? where sno=?;", /* 4 */
			"select * from milldetails;", /* 5 */
			"select stock from stockdetails where mill_id=? and financial_year=?;", /* 6 */
			"update stockdetails set stock=? ,lastupdated=? where mill_id=? and financial_year=?;"/* 7 */
	};
	private static final String[] stockFilterQuery = {
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock right join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and (stock.financial_year=? or stock.financial_year is null);", /* 0 */
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock right join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and mill.gsm=? and (stock.financial_year=? or stock.financial_year is null);", /* 1 */
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock right join milldetails mill on stock.mill_id=mill.sno where mill.millname=? and mill.gsm=? and mill.grade=? and (stock.financial_year=? or stock.financial_year is null);", /* 2 */
			"select mill.sno as mill_id ,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size,stock.stock,mill.address,mill.phone,mill.mailid,mill.createdon from stockdetails stock right join milldetails mill on stock.mill_id=mill.sno "
					+ "where mill.millname=? and mill.gsm=? and mill.grade=? and mill.size=? "
					+ "and (stock.financial_year=? or stock.financial_year is null);"/* 3 */
	};
	private static final String[] stockInQuery = {
			"insert into activity(mill_id,opening_stock,purchase,closing_stock,financial_year,remarks)values(?,?,?,?,?,?);", /* 0 */
			"select mill_id from stockdetails where mill_id=? and financial_year=?", /* 1 */
			"insert into stockdetails(stock,financial_year,mill_id,lastupdated)values(?,?,?,?)", /* 2 */
			"SELECT act.opening_stock as opening,act.purchase as purchase,act.closing_stock as closing,act.createdon as created ,act.remarks as remark,"
					+ " mill.sno as millid,mill.millname as millname,mill.gsm as gsm,mill.grade as grade,mill.size as size FROM activity act inner join milldetails"
					+ " mill on act.mill_id=mill.sno where act.financial_year=?and act.createdon between ? and ? and purchase is not null;" /* 3 */ };

	@Override
	public boolean isValidUser(USERINFO userinfo) throws SQLException {
		boolean valid = false;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[0]);
			pst.setString(1, userinfo.getUsername());
			pst.setString(2, new String(userinfo.getPassword()));
			pst.setBoolean(3, Boolean.TRUE);
			pst.setString(4, userinfo.getFinacialYear());
			ResultSet resultSet = pst.executeQuery();
			valid = !resultSet.wasNull() && resultSet.next() ? (Boolean) resultSet.getObject("rights") : false;
		} finally {
			this.connection.getConnection().close();
		}
		return valid;
	}

	@Override
	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException {
		List<PSIStockDetail> psiStockDetails = null;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[1]);
			ResultSet resultSet = pst.executeQuery();
			psiStockDetails = this.responseMapper.getAllStockDetails(resultSet, datavo);
		} finally {
			this.connection.getConnection().close();
		}
		return psiStockDetails;
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
		boolean valid = false;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[2]);
			int index = 0;
			for (String str : milldetails) {
				pst.setString(++index, str);
			}
			ResultSet resultSet = pst.executeQuery();
			valid = !resultSet.wasNull() && resultSet.next() ? true : false;
		} finally {
			this.connection.getConnection().close();
		}
		return valid;
	}

	@Override
	public boolean doSaveMillDetails(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		// TODO Auto-generated method stub
		boolean status = false;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[3]);
			pst.setString(1, detail.getMillname());
			pst.setString(2, detail.getPaperDetail().get(0).getGsm());
			pst.setString(3, detail.getPaperDetail().get(0).getGrade());
			pst.setString(4, detail.getPaperDetail().get(0).getSize());
			pst.setString(5, detail.getAddress());
			pst.setString(6, detail.getMailId());
			pst.setString(7, detail.getContactNum());
			pst.setString(8, detail.getPaperDetail().get(0).getRemarks());
			status = pst.executeUpdate() > 0 ? true : false;
		} finally {
			this.connection.getConnection().close();
			// status = false;
		}
		return status;
	}

	@Override
	public boolean updateMillDetail(PSIDatavo datavo, PSIStockDetail milldetails) throws SQLException {
		boolean updateStatus = false;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[4]);
			pst.setString(1, milldetails.getMillname());
			pst.setString(2, milldetails.getPaperDetail().get(0).getGsm());
			pst.setString(3, milldetails.getPaperDetail().get(0).getGrade());
			pst.setString(4, milldetails.getPaperDetail().get(0).getSize());
			pst.setString(5, milldetails.getAddress());
			pst.setString(6, milldetails.getMailId());
			pst.setString(7, milldetails.getContactNum());
			pst.setString(8, milldetails.getPaperDetail().get(0).getRemarks());
			pst.setInt(9, milldetails.getMillid());
			updateStatus = pst.executeUpdate() > 0 ? true : false;
		} finally {
			this.connection.closeConnection();
		}

		return updateStatus;
	}

	@Override
	public List<PSIStockDetail> getMillDetails(PSIDatavo datavo) throws SQLException {
		List<PSIStockDetail> psiStockDetails = null;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[5]);
			ResultSet resultSet = pst.executeQuery();
			psiStockDetails = this.responseMapper.getMillDetails(resultSet, datavo);
		} finally {
			this.connection.getConnection().close();
		}
		return psiStockDetails;
	}

	@Override
	public boolean getStockIn(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		boolean status = false;
		try {
			Connection con = this.connection.getConnection();
			double opening = detail.getPaperDetail().get(0).getStock();
			double closing = opening + detail.getPaperDetail().get(0).getStockIn();
			detail.getPaperDetail().get(0).setClosing(closing);
			detail.getPaperDetail().get(0).setStockOut(0);
			status = getStockInActivityInsert(con, datavo, detail);
			if (!status)
				return false;
			if (!isStockExists(con, datavo, detail)) {
				PreparedStatement pst = con.prepareStatement(stockInQuery[2]);
				pst.setDouble(1, detail.getPaperDetail().get(0).getClosing());
				pst.setString(2, datavo.getUserinfo().getFinacialYear());
				pst.setInt(3, detail.getMillid());
				pst.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
				status = pst.executeUpdate() > 0 ? true : false;
			} else {
				PreparedStatement pst = con.prepareStatement(query[7]);
				pst.setDouble(1, detail.getPaperDetail().get(0).getClosing());
				pst.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
				pst.setInt(3, detail.getMillid());
				pst.setString(4, datavo.getUserinfo().getFinacialYear());
				status = pst.executeUpdate() > 0 ? true : false;
			}
		} finally {
			this.connection.closeConnection();
		}
		return status;
	}

	private boolean isStockExists(Connection con, PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		PreparedStatement pst = con.prepareStatement(stockInQuery[1]);
		pst.setInt(1, detail.getMillid());
		pst.setString(2, datavo.getUserinfo().getFinacialYear());
		ResultSet rs = pst.executeQuery();
		return !rs.wasNull() && rs.next() ? true : false;
	}

	private boolean getStockInActivityInsert(Connection con, PSIDatavo datavo, PSIStockDetail detail)
			throws SQLException {
		PreparedStatement pst = con.prepareStatement(stockInQuery[0]);
		pst.setInt(1, detail.getMillid());
		pst.setDouble(2, detail.getPaperDetail().get(0).getStock());
		pst.setDouble(3, detail.getPaperDetail().get(0).getStockIn());
		pst.setDouble(4, detail.getPaperDetail().get(0).getClosing());
		pst.setString(5, datavo.getUserinfo().getFinacialYear());
		pst.setString(6, detail.getPaperDetail().get(0).getRemarks());
		return pst.executeUpdate() > 0 ? true : false;
	}

	@Deprecated
	private double getCurrentStock(Connection con, PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		PreparedStatement pst = con.prepareStatement(query[6]);
		pst.setInt(1, datavo.getStockDetails().get(0).getMillid());
		pst.setString(2, datavo.getUserinfo().getFinacialYear());
		ResultSet rs = pst.executeQuery();
		return Double.parseDouble(!rs.wasNull() && rs.next() ? rs.getString("stock") : "0");
	}

	@Override
	public boolean getStockout(PSIDatavo datavo, PSIStockDetail detail) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<PSIStockDetail> getLast30DaysPurchaseTrans(PSIDatavo datavo) throws SQLException {
		List<PSIStockDetail> psiStockDetails = null;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(stockInQuery[3]);
			pst.setString(1, datavo.getUserinfo().getFinacialYear());
			pst.setTimestamp(2, new Timestamp(ControllerUtil.getBackDate(Constants.BACK_DAYS_INT).getTime()));
			pst.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			ResultSet resultSet = pst.executeQuery();
			psiStockDetails = this.responseMapper.mapLast30DaysPurchaseTrans(resultSet, datavo,false);
		} finally {
			this.connection.getConnection().close();
		}
		return psiStockDetails;
	}

}
