package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-31 下午 3:38
 * Description:<描述>
 */
public class AdminNotDelect extends Exception {
    public AdminNotDelect() {
    }

    public AdminNotDelect(String message) {
        super(message);
    }

    public AdminNotDelect(String message, Throwable cause) {
        super(message, cause);
    }

    public AdminNotDelect(Throwable cause) {
        super(cause);
    }

    public AdminNotDelect(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
