package com.hrtxn.flchappinessmall.exception;

/**
 * Author:封润
 * Date:2018-10-27 下午 5:29
 * Description:<描述>
 */
public class GoodsListNotNullException extends Exception {
    public GoodsListNotNullException() {
    }

    public GoodsListNotNullException(String message) {
        super(message);
    }

    public GoodsListNotNullException(String message, Throwable cause) {
        super(message, cause);
    }

    public GoodsListNotNullException(Throwable cause) {
        super(cause);
    }

    public GoodsListNotNullException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
