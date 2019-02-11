package com.hrtxn.flchappinessmall.common;

import java.util.ArrayList;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-11 下午 4:30
 * Description:<工具类>
 */
public class Util {
    /**
     * 字符串分割工具类
     */
    public static List<String> stringToList(String split,String str){
       String splits=split;
        if(".".equals(split)||"$".equals(split)||"|".equals(split)||"[".equals(split)||"{".equals(split)||"^".equals(split)||"?".equals(split)||"*".equals(split)||"+".equals(split)||"\\\\".equals(split)||"+".equals(split)){
           //如果包含就在分割字符串前添加两个'\'反斜杠 四个因为要转义反斜杠
            splits="\\\\"+split;
        }

        String[] strArry = str.split(splits);
        ArrayList<String> strings = new ArrayList<String>(strArry.length);
      //数组转换arraylist集合
        System.out.println(splits+"77777777777777777777777777777777777777777777777777777777777777777");
       for(int i=0; i<strArry.length;i++){
           strings.add(strArry[i]);
       }
        return strings;
    }
}
