package com.hrtxn.flchappinessmall.common;

/**
 * Author:封润
 * Date:2018-10-06 下午 2:52
 * Description:<描述>
 */
public class Res {
    public  Integer code;
    public  String  msg;
    public  Object obj;

    public Res() {
    }

    public Res(Integer code, String msg, Object obj) {

        this.code = code;
        this.msg = msg;
        this.obj = obj;
    }

    public Integer getCode() {

        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
