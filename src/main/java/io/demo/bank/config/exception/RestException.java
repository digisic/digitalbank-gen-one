package io.demo.bank.config.exception;

import org.springframework.http.HttpStatus;

public class RestException extends RuntimeException {  


	private static final long serialVersionUID = 9064945270708398079L;

	private String msg;
	private HttpStatus status;
	
	public RestException (String msg, HttpStatus status) {
		this.msg = msg;
		this.status = status;
	}
	
	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	/**
	 * @return the status
	 */
	public HttpStatus getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(HttpStatus status) {
		this.status = status;
	}
	
	

}