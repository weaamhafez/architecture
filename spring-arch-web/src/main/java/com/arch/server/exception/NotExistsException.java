package com.arch.server.exception;

public class NotExistsException extends Exception{

    /**
	 * 
	 */
	private static final long serialVersionUID = 3320512469974302159L;

	public NotExistsException(String message) {
        super(message);
    }
}
