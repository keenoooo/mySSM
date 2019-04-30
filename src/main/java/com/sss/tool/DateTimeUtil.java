package com.sss.tool;



import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.tool
 * @Description:     //joda-time
 *                   //str->date
 *                   //date->str
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/19 14:31
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/19    pc           v1.0.0               修改原因
 */
public class DateTimeUtil {
    //joda-time
    //str->date
    //date->str


    public static final String STANDARD_FORMAT="yyyy-MM-dd HH:mm:ss";

    public  static Date strToDate(String dateTimeStr, String formatStr){
        DateTimeFormatter dateTimeFormatter= DateTimeFormat.forPattern(formatStr);
        DateTime dateTime=dateTimeFormatter.parseDateTime(dateTimeStr);
        return dateTime.toDate();
    }

    public static String dateToStr(Date date,String formatStr){
        if(date==null){
            return "IS empty";
        }
        DateTime dateTime=new DateTime(date);
        return dateTime.toString(formatStr);
    }



    /**
     *
     * @param dateTimeStr 具体时间
     * @return
     */
    public  static Date strToDate(String dateTimeStr){
        DateTimeFormatter dateTimeFormatter= DateTimeFormat.forPattern(STANDARD_FORMAT);
        DateTime dateTime=dateTimeFormatter.parseDateTime(dateTimeStr);
        return dateTime.toDate();
    }

    public static String dateToStr(Date date){
        if(date==null){
            return "empty";
        }
        DateTime dateTime=new DateTime(date);
        return dateTime.toString(STANDARD_FORMAT);
    }
}
