package com.vinshopmysql.model;

public class RepOrderDTO {
	
	private String vinName;
	
	private int amount;
	
	private int cnt;

	public String getVinName() {
		return vinName;
	}

	public void setVinName(String vinName) {
		this.vinName = vinName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "ReOrderDTO [vinName=" + vinName + ", amount=" + amount + ", cnt=" + cnt + "]";
	}
	
}
