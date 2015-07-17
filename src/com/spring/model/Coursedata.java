package com.spring.model;

import java.util.Date;

public class Coursedata {
    private String cno;

    private String dname;

    private String dfile;

    private String dsummary;

    private Date dtime;

    public String getCno() {
        return cno;
    }

    public Coursedata() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Coursedata(String cno, String dname, String dfile, String dsummary,
			Date dtime) {
		super();
		this.cno = cno;
		this.dname = dname;
		this.dfile = dfile;
		this.dsummary = dsummary;
		this.dtime = dtime;
	}

	public void setCno(String cno) {
        this.cno = cno == null ? null : cno.trim();
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getDfile() {
        return dfile;
    }

    public void setDfile(String dfile) {
        this.dfile = dfile == null ? null : dfile.trim();
    }

    public String getDsummary() {
        return dsummary;
    }

    public void setDsummary(String dsummary) {
        this.dsummary = dsummary == null ? null : dsummary.trim();
    }

    public Date getDtime() {
        return dtime;
    }

    public void setDtime(Date dtime) {
        this.dtime = dtime;
    }
}