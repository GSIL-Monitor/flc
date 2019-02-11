package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-27 下午 4:53
 * Description:<描述>
 */
public class ClassNotNullException extends Exception {
    public ClassNotNullException() {
    }

    public ClassNotNullException(String message) {
        super(message);
    }

    public ClassNotNullException(String message, Throwable cause) {
        super(message, cause);
    }

    public ClassNotNullException(Throwable cause) {
        super(cause);
    }

    public ClassNotNullException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
