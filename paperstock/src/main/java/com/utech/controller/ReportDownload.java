package com.utech.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.PaperDetail;
import com.utech.service.PSIService;
import com.utech.service.PSIServiceImpl;
import com.utech.util.Constants;

/**
 * Servlet implementation class ReportDownload
 */
@WebServlet("/reportdownload")
public class ReportDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static PSIService PSI_SERVICE = new PSIServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportDownload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("APPLICATION/OCTET-STREAM");
		String filename = "PaperStock.xlsx";
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		OutputStream out = response.getOutputStream();
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		try {
			List<PSIStockDetail> stockDetail = PSI_SERVICE.getAllStockDetails(datavo);
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet("Current Stock Detail");
			int rownum = 1;
			getColumnHeader(sheet.createRow(0));
			for (PSIStockDetail stdetail : stockDetail) {
				for (PaperDetail prdetail : stdetail.getPaperDetail()) {
					Row row = sheet.createRow(rownum++);
					Cell cell = row.createCell(0);
					cell.setCellValue(stdetail.getMillname());
					Cell cell1 = row.createCell(1);
					cell1.setCellValue(prdetail.getGsm());
					Cell cell2 = row.createCell(2);
					cell2.setCellValue(prdetail.getGrade());
					Cell cell3 = row.createCell(3);
					cell3.setCellValue(prdetail.getSize());
					Cell cell4 = row.createCell(4);
					cell4.setCellValue(prdetail.getStock());
					
				}
			}
			workbook.write(out);
			out.flush();
			out.close();
			workbook.close();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getColumnHeader(XSSFRow row) {
		// TODO Auto-generated method stub
		Cell cell = row.createCell(0);
		cell.setCellValue("Mill Name");
		Cell cell1 = row.createCell(1);
		cell1.setCellValue("GSM");
		Cell cell2 = row.createCell(2);
		cell2.setCellValue("GRADE");
		Cell cell3 = row.createCell(3);
		cell3.setCellValue("SIZE");
		Cell cell4 = row.createCell(4);
		cell4.setCellValue("STOCK");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
