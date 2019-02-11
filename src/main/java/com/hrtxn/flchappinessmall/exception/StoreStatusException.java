package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-06 下午 3:10
 * Description:<描述>
 */
public class StoreStatusException extends Exception {
    public StoreStatusException() {
    }

    public StoreStatusException(String message) {
        super(message);
    }

    public StoreStatusException(String message, Throwable cause) {
        super(message, cause);
    }

    public StoreStatusException(Throwable cause) {
        super(cause);
    }

    public StoreStatusException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
