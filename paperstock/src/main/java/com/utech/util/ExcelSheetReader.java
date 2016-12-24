package com.utech.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.LinkedList;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.utech.conection.MySQLConnection;

public class ExcelSheetReader {
	public static void main(String[] args) throws IOException, SQLException {
		String excelFilePath = "E:\\Java\\ut\\Specfic_data\\latest_paperstock_details.xlsx";
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
		Connection connection = new MySQLConnection().getConnection();
		Workbook workbook = new XSSFWorkbook(inputStream);
		Sheet firstSheet = workbook.getSheetAt(0);
		Iterator<Row> iterator = firstSheet.iterator();
		LinkedList insert = null;
		int cursor = 0;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			insert = new LinkedList();
			while (cellIterator.hasNext()) {
				Cell cell = cellIterator.next();

				switch (cell.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					System.out.print(cell.getStringCellValue());
					insert.add(cell.getStringCellValue());
					break;
				case Cell.CELL_TYPE_BOOLEAN:
					System.out.print(cell.getBooleanCellValue());
					insert.add(cell.getBooleanCellValue());
					break;
				case Cell.CELL_TYPE_NUMERIC:
					System.out.print(cell.getNumericCellValue());
					insert.add(cell.getNumericCellValue());
					break;
				}
				System.out.print(" - ");
			}
			System.out.println();
			chekAndInsert(insert, connection);
		}

		workbook.close();
		inputStream.close();
	}

	private static String selectMill = "select * from milldetails where milldetails.millname=? and milldetails.gsm=? and milldetails.grade=? and milldetails.size=?";

	private static void chekAndInsert(LinkedList insert, Connection con) throws SQLException {
		PreparedStatement pst = con.prepareStatement(selectMill);
		pst.setString(1, "" + insert.get(0));
		pst.setString(2, "" + insert.get(1));
		pst.setString(3, "" + insert.get(2));
		pst.setString(4, "" + insert.get(3));
		ResultSet resultSet = pst.executeQuery();
		if (!resultSet.next() || resultSet.wasNull()) {
			int millid = millidinsertMill(pst, con, insert);
			if (millid != -1) {
				insertActivity(insert, con, pst, millid);
				insertStock(insert, con, pst, millid);
			}
		}

	}

	private static String insertStock = "insert into stockdetails(stock,financial_year,mill_id,lastupdated)values(?,?,?,?)";

	private static void insertStock(LinkedList insert, Connection con, PreparedStatement pst, int millid)
			throws SQLException {
		pst = con.prepareStatement(insertStock);
		pst.setDouble(1, (double) insert.get(4));
		pst.setString(2, "2016-2017");
		pst.setInt(3, millid);
		pst.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
		pst.executeUpdate();
	}

	private static String insertActivity = "insert into activity(mill_id,opening_stock,purchase,closing_stock,financial_year,remarks)values(?,?,?,?,?,?)";

	private static void insertActivity(LinkedList insert, Connection con, PreparedStatement pst, int millid)
			throws SQLException {
		// TODO Auto-generated method stub
		pst = con.prepareStatement(insertActivity);
		pst.setInt(1, millid);
		pst.setDouble(2, 0);
		pst.setDouble(3, (double) insert.get(4));
		pst.setDouble(4, (double) insert.get(4));
		pst.setString(5, "2016-2017");
		pst.setString(6, "Imported from excel");
		pst.executeUpdate();
	}

	private static String insertMill = "insert into milldetails(millname,gsm,grade,size,address,mailid,phone,remarks)values(?,?,?,?,?,?,?,?); ";

	private static int millidinsertMill(PreparedStatement pst, Connection con, LinkedList insert) throws SQLException {
		pst = con.prepareStatement(insertMill);
		pst.setString(1, "" + insert.get(0));
		pst.setString(2, "" + insert.get(1));
		pst.setString(3, "" + insert.get(2));
		pst.setString(4, "" + insert.get(3));
		pst.setString(5, "");
		pst.setString(6, "");
		pst.setString(7, "");
		pst.setString(8, "imported from excel");
		pst.executeUpdate();
		pst = con.prepareStatement(selectMill);
		pst.setString(1, "" + insert.get(0));
		pst.setString(2, "" + insert.get(1));
		pst.setString(3, "" + insert.get(2));
		pst.setString(4, "" + insert.get(3));
		ResultSet resultSet = pst.executeQuery();
		return !resultSet.wasNull() && resultSet.next() ? resultSet.getInt("sno") : -1;
		// TODO Auto-generated method stub

	}
}
