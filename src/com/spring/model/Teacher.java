package com.spring.model;

public class Teacher {
    private String tno;

    private String tpwd;

    private String tname;
    
    private String timage;
    
    

    public Teacher(String tno, String tpwd, String tname, String timage) {
		super();
		this.tno = tno;
		this.tpwd = tpwd;
		this.tname = tname;
		this.timage = timage;
	}

	public String getTimage() {
		return timage;
	}

	public void setTimage(String timage) {
		this.timage = timage;
	}

	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno == null ? null : tno.trim();
    }

    public String getTpwd() {
        return tpwd;
    }

    public void setTpwd(String tpwd) {
        this.tpwd = tpwd == null ? null : tpwd.trim();
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }
}