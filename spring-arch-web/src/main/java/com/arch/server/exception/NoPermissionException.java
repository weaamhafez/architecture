package com.arch.server.exception;

public class NoPermissionException extends Exception{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1186686985863494051L;

	public NoPermissionException(String message) {
        super(message);
    }
}
