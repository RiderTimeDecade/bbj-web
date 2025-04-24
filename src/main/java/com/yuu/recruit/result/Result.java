package com.yuu.recruit.result;

import lombok.Data;

import java.io.Serializable;

/**
 * API结果返回对象
 */
@Data
public class Result implements Serializable {

    /**
     * 状态码
     */
    private int code;

    /**
     * 消息
     */
    private String msg;

    /**
     * 返回数据
     */
    private Object data;

    /**
     * 成功结果
     * 
     * @return Result对象
     */
    public static Result success() {
        return success("操作成功");
    }

    /**
     * 成功结果
     * 
     * @param msg 成功消息
     * @return Result对象
     */
    public static Result success(String msg) {
        return success(msg, null);
    }

    /**
     * 成功结果
     * 
     * @param data 返回数据
     * @return Result对象
     */
    public static Result success(Object data) {
        return success("操作成功", data);
    }

    /**
     * 成功结果
     * 
     * @param msg 成功消息
     * @param data 返回数据
     * @return Result对象
     */
    public static Result success(String msg, Object data) {
        Result result = new Result();
        result.setCode(0);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }

    /**
     * 失败结果
     * 
     * @return Result对象
     */
    public static Result failure() {
        return failure("操作失败");
    }

    /**
     * 失败结果
     * 
     * @param msg 失败消息
     * @return Result对象
     */
    public static Result failure(String msg) {
        return failure(msg, null);
    }

    /**
     * 失败结果
     * 
     * @param msg 失败消息
     * @param data 返回数据
     * @return Result对象
     */
    public static Result failure(String msg, Object data) {
        Result result = new Result();
        result.setCode(1);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }

    /**
     * 自定义结果
     * 
     * @param code 状态码
     * @param msg 消息
     * @param data 数据
     * @return Result对象
     */
    public static Result custom(int code, String msg, Object data) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }
} 