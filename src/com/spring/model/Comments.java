package com.spring.model;

import java.util.Date;

public class Comments {
    private String comment;

    private Date comtime;

    private String somscore;

    private String comremark;

    public String getComment() {
        return comment;
    }

    public Comments() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comments(String comment, Date comtime, String somscore,
			String comremark) {
		super();
		this.comment = comment;
		this.comtime = comtime;
		this.somscore = somscore;
		this.comremark = comremark;
	}

	@Override
	public String toString() {
		return "Comments [comment=" + comment + ", comtime=" + comtime
				+ ", somscore=" + somscore + ", comremark=" + comremark + "]";
	}

	public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getComtime() {
        return comtime;
    }

    public void setComtime(Date comtime) {
        this.comtime = comtime;
    }

    public String getSomscore() {
        return somscore;
    }

    public void setSomscore(String somscore) {
        this.somscore = somscore == null ? null : somscore.trim();
    }

    public String getComremark() {
        return comremark;
    }

    public void setComremark(String comremark) {
        this.comremark = comremark == null ? null : comremark.trim();
    }
}