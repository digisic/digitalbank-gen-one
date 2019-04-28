package io.demo.bank.config.exception;


public class RestBadRequestException extends RuntimeException {  


	private static final long serialVersionUID = 9064945270708398079L;

	private String msg;

	
	public RestBadRequestException (String msg) {
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