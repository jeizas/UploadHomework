package com.spring.model;

public class Admin {
    private String ano;

    private String apwd;

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano == null ? null : ano.trim();
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd == null ? null : apwd.trim();
    }

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(String ano, String apwd) {
		super();
		this.ano = ano;
		this.apwd = apwd;
	}

	@Override
	public String toString() {
		return "Admin [ano=" + ano + ", apwd=" + apwd + "]";
	}
    
}