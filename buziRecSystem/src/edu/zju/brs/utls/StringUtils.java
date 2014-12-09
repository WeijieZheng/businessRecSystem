package edu.zju.brs.utls;

/**
 * Created by XZJ on 2014/12/7.
 */
public class StringUtils {

    public static boolean isEmpty(String str){
        if(null==str || str.length()==0){
            return true;
        }
        return false;
    }
}
