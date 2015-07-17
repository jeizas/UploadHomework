package com.spring.model;

import java.util.Date;

public class SC {

    private String sno;
	private String cno;
    private Integer sctimes;
    private String scfile;
    private Date sctime;
    private String cname;
    private String allowlook;

    
    public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	
	public SC(String sno, String cno, Integer sctimes, String scfile,
			Date sctime, String cname, String allowlook) {
		super();
		this.sno = sno;
		this.cno = cno;
		this.sctimes = sctimes;
		this.scfile = scfile;
		this.sctime = sctime;
		this.cname = cname;
		this.allowlook = allowlook;
	}

	public String getAllowlook() {
		return allowlook;
	}

	public void setAllowlook(String allowlook) {
		this.allowlook = allowlook;
	}

	public SC(String sno, String cno, Integer sctimes, String scfile,
			Date sctime, String cname) {
		super();
		this.sno = sno;
		this.cno = cno;
		this.sctimes = sctimes;
		this.scfile = scfile;
		this.sctime = sctime;
		this.cname = cname;
	}
	public SC() {
		super();
	}

	public SC(String sno,String cno, Integer sctimes,String scfile,Date sctime) {
		super();
		this.cno = cno;
		this.sctimes = sctimes;
		this.sno = sno;
		this.scfile = scfile;
		this.sctime = sctime;
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
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getScfile() {
		return scfile;
	}
	public void setScfile(String scfile) {
		this.scfile = scfile;
	}
	public Date getSctime() {
		return sctime;
	}
	public void setSctime(Date sctime) {
		this.sctime = sctime;
	}
	@Override
	public String toString() {
		return "SC [sno=" + sno + ", cno=" + cno + ", sctimes=" + sctimes
				+ ", scfile=" + scfile + ", sctime=" + sctime + "]";
	}


    

}