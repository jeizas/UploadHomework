package com.spring.model;

import java.util.Date;

public class Settask {
	
	private String cno;
	
	private Integer sctimes;
	
	private Date stoptime;
	
	private String stitle;

    private String stcontent;
	
	public Settask(String cno, Integer sctimes, Date stoptime, String stitle,
			String stcontent) {
		super();
		this.cno = cno;
		this.sctimes = sctimes;
		this.stoptime = stoptime;
		this.stitle = stitle;
		this.stcontent = stcontent;
	}

	public Date getStoptime() {
		return stoptime;
	}

	public void setStoptime(Date stoptime) {
		this.stoptime = stoptime;
	}



	public Settask(String cno, Integer sctimes, String stitle, String stcontent) {
		this.cno = cno;
		this.sctimes = sctimes;
		this.stitle = stitle;
		this.stcontent = stcontent;
	}

	public Settask() {
		super();
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public Integer getSctimes() {
		return sctimes;
	}

	public void setSctimes(Integer sctimes) {
		this.sctimes = sctimes;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getStcontent() {
		return stcontent;
	}

	public void setStcontent(String stcontent) {
		this.stcontent = stcontent;
	}



    
}