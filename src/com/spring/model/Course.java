package com.spring.model;

public class Course {
    private String cno;

    private String cname;

    private Integer ctimes;

    private String csummary;
    
    private String cimage;

    public Course(String cno, String cname, Integer ctimes, String csummary,
			String cimage) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.ctimes = ctimes;
		this.csummary = csummary;
		this.cimage = cimage;
	}

	public String getCimage() {
		return cimage;
	}

	public void setCimage(String cimage) {
		this.cimage = cimage;
	}

	public String getCno() {
        return cno;
    }

    public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setCno(String cno) {
        this.cno = cno == null ? null : cno.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getCtimes() {
        return ctimes;
    }

    public void setCtimes(Integer ctimes) {
        this.ctimes = ctimes;
    }

    public String getCsummary() {
        return csummary;
    }

    public void setCsummary(String csummary) {
        this.csummary = csummary == null ? null : csummary.trim();
    }
}