package com.spring.model;

public class Student {
    public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(String sno, String spwd, String sname, String smajor,
			String sgrade, String sclass) {
		super();
		this.sno = sno;
		this.spwd = spwd;
		this.sname = sname;
		this.smajor = smajor;
		this.sgrade = sgrade;
		this.sclass = sclass;
	}

	private String sno;

    private String spwd;

    private String sname;

    private String smajor;

    private String sgrade;

    private String sclass;

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno == null ? null : sno.trim();
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd == null ? null : spwd.trim();
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getSmajor() {
        return smajor;
    }

    public void setSmajor(String smajor) {
        this.smajor = smajor == null ? null : smajor.trim();
    }

    public String getSgrade() {
        return sgrade;
    }

    public void setSgrade(String sgrade) {
        this.sgrade = sgrade == null ? null : sgrade.trim();
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass == null ? null : sclass.trim();
    }

	@Override
	public String toString() {
		return "Student [sno=" + sno + ", spwd=" + spwd + ", sname=" + sname
				+ ", smajor=" + smajor + ", sgrade=" + sgrade + ", sclass="
				+ sclass + "]";
	}
}