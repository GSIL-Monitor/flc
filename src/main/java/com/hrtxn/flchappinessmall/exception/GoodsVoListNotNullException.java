package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-25 上午 11:59
 * Description:<描述>
 */
public class GoodsVoListNotNullException extends Exception {
    public GoodsVoListNotNullException() {
    }

    public GoodsVoListNotNullException(String message) {
        super(message);
    }

    public GoodsVoListNotNullException(String message, Throwable cause) {
        super(message, cause);
    }

    public GoodsVoListNotNullException(Throwable cause) {
        super(cause);
    }

    public GoodsVoListNotNullException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
