package com.sunflower.petal.service.support;

/**
 * Created by xiangkui on 14-2-22.
 * 导数状态码
 */
public class ImportStatus {
    private static int  NOT_STARTED;//未开始
    private static int  IMPORTING;//正在导数
    private static int HAVA_ENDED;//已经结束

    public enum status{
       SUCCESS,
        ERROR,
        UNKWON
    } ;
    private int processCode=NOT_STARTED;//过程码
    private status result=status.UNKWON;//是否成功
    private String  message="";//附加内容
    public ImportStatus(){
        processCode=NOT_STARTED;
    }
    //getter and setter

    public int getProcessCode() {
        return processCode;
    }

    public void setProcessCode(int processCode) {
        this.processCode = processCode;
    }

    public status getResult() {
        return result;
    }

    public void setResult(status result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
