package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-31 下午 1:51
 * Description:<描述>
 */
public class RoleIsAdminNotNullException extends Exception {
    public RoleIsAdminNotNullException() {
    }

    public RoleIsAdminNotNullException(String message) {
        super(message);
    }

    public RoleIsAdminNotNullException(String message, Throwable cause) {
        super(message, cause);
    }

    public RoleIsAdminNotNullException(Throwable cause) {
        super(cause);
    }

    public RoleIsAdminNotNullException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
