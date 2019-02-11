package com.hrtxn.flchappinessmall.tools;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tools {

    /**
     * 随机生成四位数验证码
     *
     * @return
     */
    public static int getRandomNum4() {
        return (int) ((Math.random() * 9 + 1) * 1000);
    }

    /**
     * 随机生成六位数验证码
     *
     * @return
     */
    public static int getRandomNum() {
        return (int) ((Math.random() * 9 + 1) * 100000);
    }

    /**
     * 随机生成七位数验证码
     *
     * @return
     */
    public static int getRandomNum7() {
        Random r = new Random();
        return r.nextInt(9000000) + 1000000;// (Math.random()*(999999-100000)+100000)
    }

    /**
     * 检测字符串是否不为空(null,"","null")
     *
     * @param s
     * @return 不为空则返回true，否则返回false
     */
    public static boolean notEmpty(String s) {
        return s != null && !"".equals(s) && !"null".equals(s);
    }

    /**
     * 检测字符串是否为空(null,"","null")
     *
     * @param s
     * @return 为空则返回true，不否则返回false
     */
    public static boolean isEmpty(String s) {
        return s == null || "".equals(s) || "null".equals(s);
    }

    /**
     * 检测字符串是否为空(null,"","null")
     *
     * @param s
     * @return 为空则返回true，不否则返回false
     */
    public static boolean isEmpty(Object s) {
        return s == null || "".equals(s) || "null".equals(s);
    }

    /**
     * 字符串转换为字符串数组
     *
     * @param str        字符串
     * @param splitRegex 分隔符
     * @return
     */
    public static String[] str2StrArray(String str, String splitRegex) {
        if (isEmpty(str)) {
            return null;
        }
        return str.split(splitRegex);
    }

    /**
     * 用默认的分隔符(,)将字符串转换为字符串数组
     *
     * @param str 字符串
     * @return
     */
    public static String[] str2StrArray(String str) {
        return str2StrArray(str, ",\\s*");
    }

    /**
     * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
     *
     * @param date
     * @return yyyy-MM-dd HH:mm:ss
     */
    public static String date2Str(Date date) {
        return date2Str(date, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
     *
     * @param date
     * @return
     */
    public static Date str2Date(String date) {
        if (notEmpty(date)) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                return sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return new Date();
        } else {
            return null;
        }
    }

    /**
     * 按照参数format的格式，日期转字符串
     *
     * @param date
     * @param format
     * @return
     */
    public static String date2Str(Date date, String format) {
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(date);
        } else {
            return "";
        }
    }

    /**
     * 把时间根据时、分、秒转换为时间段
     *
     * @param StrDate
     */
    public static String getTimes(String StrDate) {
        String resultTimes = "";

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now;

        try {
            now = new Date();
            Date date = df.parse(StrDate);
            long times = now.getTime() - date.getTime();
            long day = times / (24 * 60 * 60 * 1000);
            long hour = (times / (60 * 60 * 1000) - day * 24);
            long min = ((times / (60 * 1000)) - day * 24 * 60 - hour * 60);
            long sec = (times / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);

            StringBuffer sb = new StringBuffer();
            // sb.append("发表于：");
            if (hour > 0) {
                sb.append(hour + "小时前");
            } else if (min > 0) {
                sb.append(min + "分钟前");
            } else {
                sb.append(sec + "秒前");
            }

            resultTimes = sb.toString();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return resultTimes;
    }

    /**
     * 写txt里的单行内容
     *
     * @param fileP   文件路径
     * @param content 写入的内容
     */
    public static void writeFile(String fileP, String content) {
        String filePath = String.valueOf(Thread.currentThread()
                .getContextClassLoader().getResource(""))
                + "../../"; // 项目路径
        filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
        if (filePath.indexOf(":") != 1) {
            filePath = File.separator + filePath;
        }
        try {
            OutputStreamWriter write = new OutputStreamWriter(
                    new FileOutputStream(filePath), "utf-8");
            BufferedWriter writer = new BufferedWriter(write);
            writer.write(content);
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 验证邮箱
     *
     * @param email
     * @return
     */
    public static boolean checkEmail(String email) {
        boolean flag = false;
        try {
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 验证手机号码
     *
     * @param mobileNumber
     * @return
     */
    public static boolean checkMobileNumber(String mobileNumber) {
        boolean flag = false;
        try {
            Pattern regex = Pattern
                    .compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
            Matcher matcher = regex.matcher(mobileNumber);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 读取txt里的单行内容
     *
     * @param fileP 文件路径
     */
    public static String readTxtFile(String fileP) {
        try {

            String filePath = String.valueOf(Thread.currentThread()
                    .getContextClassLoader().getResource(""))
                    + "../../"; // 项目路径
            filePath = filePath.replaceAll("file:/", "");
            filePath = filePath.replaceAll("%20", " ");
            filePath = filePath.trim() + fileP.trim();
            if (filePath.indexOf(":") != 1) {
                filePath = File.separator + filePath;
            }
            String encoding = "utf-8";
            File file = new File(filePath);
            if (file.isFile() && file.exists()) { // 判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file), encoding); // 考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while ((lineTxt = bufferedReader.readLine()) != null) {
                    return lineTxt;
                }
                read.close();
            } else {
                System.out.println("找不到指定的文件,查看此路径是否正确:" + filePath);
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
        }
        return "";
    }

    /**
     * @param @param  sdate
     * @param @param  bdate
     * @param @return 设定文件
     * @throws
     * @Description: (计算两个日期 【 字符串类型 】 之间的时间距离)
     */
    public static Map<String, Long> timesBetween(String sdate, Date bdate) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long day = 0;
        long hour = 0;
        long min = 0;
        long sec = 0;
        long diff = 0;
        try {
            Date startDate = df.parse(sdate);
            Date bindDate = bdate;
            long stime = startDate.getTime();
            long btime = bindDate.getTime();
            if (stime > btime) {
                diff = stime - btime;
            } else {
                diff = btime - stime;
            }
            day = diff / (24 * 60 * 60 * 1000);
            hour = diff / (60 * 60 * 1000) - day * 24;
            min = diff / (60 * 1000) - day * 24 * 60 - hour * 60;
            sec = diff / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Map<String, Long> timeMap = new HashMap<String, Long>();
        timeMap.put("Day", day);
        timeMap.put("Hour", hour);
        timeMap.put("Min", min);
        timeMap.put("Sec", sec);
        return timeMap;
    }

    /**
     * 获取过去或者未来 任意天内的日期数组
     *
     * @param intervals intervals天内
     * @return 日期数组
     */
    public static ArrayList<String> test(int intervals) {
        ArrayList<String> pastDaysList = new ArrayList<String>();
        ArrayList<String> fetureDaysList = new ArrayList<String>();
        for (int i = 1; i <= intervals; i++) {
            pastDaysList.add(getPastDate(i));
            fetureDaysList.add(getFetureDate(i));
        }
        return pastDaysList;
    }

    /**
     * 获取过去第几天的日期
     *
     * @param past
     * @return
     */
    public static String getPastDate(int past) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
        Date today = calendar.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String result = format.format(today);
        return result;
    }

    /**
     * 获取未来 第 past 天的日期
     *
     * @param past
     * @return
     */
    public static String getFetureDate(int past) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);
        Date today = calendar.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String result = format.format(today);
        return result;
    }

    public static double div(double d1, double d2, int len) {// 进行除法运算
        BigDecimal b1 = new BigDecimal(d1);
        BigDecimal b2 = new BigDecimal(d2);
        return b1.divide(b2, len, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 判断对象是否为空
     * @param obj
     * @return
     */
    public static boolean objectIsEmpty(Object obj) {
        if (obj == null) {
            return true;
        }
        if ((obj instanceof List)) {
            return ((List) obj).size() == 0;
        }
        if ((obj instanceof String)) {
            return ((String) obj).trim().equals("");
        }
        return false;
    }

    /**
     * 获取昨日
     * @return
     */
    public static String getLastData(){
        Calendar now = Calendar.getInstance();
        int nowYear = now.get(Calendar.YEAR);
        int nowMonth = now.get(Calendar.MONTH) + 1;
        int nowDay = now.get(Calendar.DAY_OF_MONTH);
        String lastDate = null;
        if(nowDay <= 28){
            if (nowMonth == 1){
                lastDate = (nowYear-1)+"-12-"+nowDay;
            }else{
                if (nowMonth <= 10){
                    if (nowDay <= 9){
                        lastDate = nowYear+"-0"+(nowMonth-1)+"-0"+nowDay;
                    }else{
                        lastDate = nowYear+"-0"+(nowMonth-1)+"-"+nowDay;
                    }
                }else {
                    if (nowDay <= 9){
                        lastDate = nowYear+"-"+(nowMonth-1)+"-0"+nowDay;
                    }else{
                        lastDate = nowYear+"-"+(nowMonth-1)+"-"+nowDay;
                    }
                }
            }
            //判断日期是否合法
            if (validate(lastDate)){
                return lastDate;
            }else {
                return null;
            }
        }
        return null;
    }

    /** 判断某一日期是否合法 */
    public static boolean validate(String dateString){
        //使用正则表达式 测试 字符 符合 dddd-dd-dd 的格式(d表示数字)
        Pattern p = Pattern.compile("\\d{4}+[-]\\d{1,2}+[-]\\d{1,2}+");
        Matcher m = p.matcher(dateString);
        if(!m.matches()){	return false;}

        //得到年月日
        String[] array = dateString.split("-");
        int year = Integer.valueOf(array[0]);
        int month = Integer.valueOf(array[1]);
        int day = Integer.valueOf(array[2]);

        if(month<1 || month>12){	return false;}
        int[] monthLengths = new int[]{0, 31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if(isLeapYear(year)){
            monthLengths[2] = 29;
        }else{
            monthLengths[2] = 28;
        }
        int monthLength = monthLengths[month];
        if(day<1 || day>monthLength){
            return false;
        }
        return true;
    }

    /** 是否是闰年 */
    private static boolean isLeapYear(int year){
        return ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ;
    }

    /**
     * 获取double类型保留两位小数，其余位数舍去
     * @param temp
     * @return
     */
    public static Double twoPoint(double temp){
        String strNum = String.valueOf(temp);
        String ss= "";
        int a = strNum.indexOf(".");
        if(a>0){
            //获取小数点后面的数字
            String dianAfter = strNum.substring(a+1);
            if(dianAfter.length()>=2){
                ss=strNum.substring(0,a+3);
            }else {
                ss = strNum+"0";
            }
        }else{
            ss=strNum+".00";
        }
        return Double.parseDouble(ss);
    }

    /**
     * 获取上个月对应的周的范围（周分红）
     * @return
     */
    public static String[] getWeekRange(){
        String[] lastDataRange = new String[7];
        Calendar now = Calendar.getInstance();
        int nowYear = now.get(Calendar.YEAR);
        int nowMonth = now.get(Calendar.MONTH) + 1;
        int nowDay = now.get(Calendar.DAY_OF_MONTH);
        if (nowMonth == 1){
            if (nowDay == 7){
                for (int i = 1; i <= 7; i++) {
                    lastDataRange[i-1] = (nowYear - 1) + "-12-0"+i;
                }
            }
            if (nowDay == 14){
                for (int i = 8; i <= 14; i++) {
                    if (i <= 9){
                        lastDataRange[i-8] = (nowYear - 1) + "-12-0"+i;
                    }else {
                        lastDataRange[i-8] = (nowYear - 1) + "-12-"+i;
                    }
                }
            }
            if (nowDay == 21){
                for (int i = 15; i <= 21; i++) {
                    lastDataRange[i-15] = (nowYear - 1) + "-12-"+i;
                }
            }
            if (nowDay == 28){
                for (int i = 22; i <= 28; i++) {
                    lastDataRange[i-22] = (nowYear - 1) + "-12-"+i;
                }
            }
        }else {
            if (nowDay == 7){
                for (int i = 1; i <= 7; i++) {
                    lastDataRange[i-1] = nowYear + "-0"+(nowMonth - 1)+"-0"+i;
                }
            }
            if (nowDay == 14){
                for (int i = 8; i <= 14; i++) {
                    if (i <= 9){
                        lastDataRange[i-8] = nowYear + "-0"+(nowMonth - 1)+"-0"+i;
                    }else {
                        lastDataRange[i-8] = nowYear + "-"+(nowMonth - 1)+"-"+i;
                    }
                }
            }
            if (nowDay == 21){
                for (int i = 15; i <= 21; i++) {
                    lastDataRange[i-15] = nowYear + "-"+(nowMonth - 1)+"-"+i;
                }
            }
            if (nowDay == 28){
                for (int i = 22; i <= 28; i++) {
                    lastDataRange[i-22] = nowYear + "-"+(nowMonth - 1)+"-"+i;
                }
            }
        }
        return lastDataRange;
    }

    /**
     * 获取对应的上个月份
     * @return
     */
    public static String[] getLastMonth(){
        Calendar now = Calendar.getInstance();
        int nowYear = now.get(Calendar.YEAR);
        int nowMonth = now.get(Calendar.MONTH) + 1;
        int nowDay = now.get(Calendar.DAY_OF_MONTH);
        String[] lastMonth = new String[2];
        if (nowDay <= 28){
            if (nowMonth == 1){
                lastMonth[0] = (nowYear - 1)+"-12-01";
                lastMonth[1] = (nowYear - 1)+"-12-28";
            }else{
                if (nowMonth <= 10 ){
                    lastMonth[0] = nowYear+"-0"+(nowMonth - 1)+"-01";
                    lastMonth[1] = nowYear+"-0"+(nowMonth - 1)+"-28";
                }else{
                    lastMonth[0] = nowYear+"-"+(nowMonth - 1)+"-01";
                    lastMonth[1] = nowYear+"-"+(nowMonth - 1)+"-28";
                }
            }
        }
        return lastMonth;
    }

    /**
     * 获取每月的天数
     * @param year
     * @param month
     * @return
     */
    public static int days(int year, int month) {
        int days = 0;
        if (month != 2) {
            switch (month) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    days = 31;
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    days = 30;
            }
        } else {
            // 闰年
            if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
                days = 29;
            else
                days = 28;
        }
        return days;
    }


    /**
     * 获取上季度
     * @return
     */
    public static String[] getLastQuarter(){
        String[] quarter = new String[3];
        Calendar now = Calendar.getInstance();
        int nowYear = now.get(Calendar.YEAR);
        int nowMonth = now.get(Calendar.MONTH) + 1;
        int nowDay = now.get(Calendar.DAY_OF_MONTH);
        if (nowDay == 1){
            if (nowMonth == 1){
                quarter[0] = (nowYear - 1)+"-10";
                quarter[1] = (nowYear - 1)+"-11";
                quarter[2] = (nowYear - 1)+"-12";
            }else {
                if(nowMonth == 4){
                    quarter[0] = nowYear+"-01";
                    quarter[1] = nowYear+"-02";
                    quarter[2] = nowYear+"-03";
                }
                if(nowMonth == 7){
                    quarter[0] = nowYear+"-04";
                    quarter[1] = nowYear+"-05";
                    quarter[2] = nowYear+"-06";
                }
                if(nowMonth == 10){
                    quarter[0] = nowYear+"-07";
                    quarter[1] = nowYear+"-08";
                    quarter[2] = nowYear+"-09";
                }
            }
        }
        return quarter;
    }

    /**
     * 获取上年
     * @return
     */
    public static String[] getLastYear(){
        String[] year = new String[12];
        Calendar now = Calendar.getInstance();
        int nowYear = now.get(Calendar.YEAR);
        int nowMonth = now.get(Calendar.MONTH) + 1;
        int nowDay = now.get(Calendar.DAY_OF_MONTH);

        if (nowMonth == 1){
            year[0] = (nowYear - 1) + "-01";
            year[1] = (nowYear - 1) + "-02";
            year[2] = (nowYear - 1) + "-03";
            year[3] = (nowYear - 1) + "-04";
            year[4] = (nowYear - 1) + "-05";
            year[5] = (nowYear - 1) + "-06";
            year[6] = (nowYear - 1) + "-07";
            year[7] = (nowYear - 1) + "-08";
            year[8] = (nowYear - 1) + "-09";
            year[9] = (nowYear - 1) + "-10";
            year[10] = (nowYear - 1) + "-11";
            year[11] = (nowYear - 1) + "-12";
        }
        return year;
    }

    /**
     * 两日期比较大小
     * @param DATE1
     * @param DATE2
     * @return
     */
    public static int compare_date(String DATE1, String DATE2) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date dt1 = df.parse(DATE1);
            Date dt2 = df.parse(DATE2);
            if (dt1.getTime() >= dt2.getTime()) {
                return 1;
            } else if (dt1.getTime() <= dt2.getTime()) {
                return -1;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        String[] strs = getLastYear();
        for (String str: strs) {
            System.out.println(str);
        }
    }
}