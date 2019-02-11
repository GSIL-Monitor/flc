package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-27 下午 5:29
 * Description:<描述>
 */
public class StoreListNotNullException extends Exception {
    public StoreListNotNullException() {
    }

    public StoreListNotNullException(String message) {
        super(message);
    }

    public StoreListNotNullException(String message, Throwable cause) {
        super(message, cause);
    }

    public StoreListNotNullException(Throwable cause) {
        super(cause);
    }

    public StoreListNotNullException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
