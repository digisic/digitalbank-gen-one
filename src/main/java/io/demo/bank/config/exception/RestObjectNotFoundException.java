package io.demo.bank.config.exception;


public class RestObjectNotFoundException extends RuntimeException {  

	/**
	 * 
	 */
	private static final long serialVersionUID = -245914076167801121L;
	private String msg;

	
	public RestObjectNotFoundException (String msg) {
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