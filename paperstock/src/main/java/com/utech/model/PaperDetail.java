package com.utech.model;

import java.io.Serializable;

public class PaperDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1287145194558762656L;
	private String gsm;
	private String grade;
	private float size;
	private double stockIn;
	private double stock;
	private double stockOut;
	private String remarks;

	public String getGsm() {
		return gsm;
	}

	public void setGsm(String gsm) {
		this.gsm = gsm;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public float getSize() {
		return size;
	}

	public void setSize(float size) {
		this.size = size;
	}

	public double getStockIn() {
		return stockIn;
	}

	public void setStockIn(double stockIn) {
		this.stockIn = stockIn;
	}

	public double getStock() {
		return stock;
	}

	public void setStock(double stock) {
		this.stock = stock;
	}

	public double getStockOut() {
		return stockOut;
	}

	public void setStockOut(double stockOut) {
		this.stockOut = stockOut;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
