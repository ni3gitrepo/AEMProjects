package com.shop.domain;

import java.io.Serializable;

public class DomainObject implements Serializable {
	/**
	 * 
	 */
	

	private static final long serialVersionUID = 1L;
	private String message;

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	} 

}
