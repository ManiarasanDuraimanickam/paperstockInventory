package com.utech.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PSIStockDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String millname;
	private String address;
	private String mailId;
	private String contactNum;
	private List<PaperDetail> paperDetail = null;
	private Date entryDate;

	public String getMillname() {
		return millname;
	}

	public void setMillname(String millname) {
		this.millname = millname;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getContactNum() {
		return contactNum;
	}

	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}

	public List<PaperDetail> getPaperDetail() {
		if (null == this.paperDetail) {
			this.paperDetail = new ArrayList<>();
		}
		return paperDetail;
	}

	public void setPaperDetail(List<PaperDetail> paperDetail) {
		this.paperDetail = paperDetail;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
