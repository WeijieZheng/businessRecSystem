package edu.zju.brs.utls;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

/**
 * 将处理json对象的工具类
 * Created by XZJ on 2014/12/8.
 */

public class JsonUtils {

    /**
     * 将对象转换成json字符串
     */
    public static String toJsonfromObject(Object obj){
        JSONObject jsonObject = JSONObject.fromObject(obj);
        return jsonObject.toString();
    }

    /**
     * 将列表转换成json字符串
     */
    public static String toJsonfromList(List list){
        JSONArray jsonArray = JSONArray.fromObject(list);
        return jsonArray.toString();
    }

    /**
     * 将json字符串转化成对象
     */
    public static <T> T fromJson(String jsonStr, Class<T> classType){
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);
        return (T)JSONObject.toBean(jsonObject,classType);
    }


}
