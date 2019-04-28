package io.demo.bank.config.exception;


public class RestNotAcceptableException extends RuntimeException {  

	/**
	 * 
	 */
	private static final long serialVersionUID = 4113204222861006995L;
	
	private String msg;

	
	public RestNotAcceptableException (String msg) {
		this.msg = msg;
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
}