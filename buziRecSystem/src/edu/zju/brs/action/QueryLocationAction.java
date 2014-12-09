package edu.zju.brs.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.zju.brs.utls.JsonUtils;
import edu.zju.brs.utls.StringUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by XZJ on 2014/12/7.
 */

public class QueryLocationAction extends ActionSupport {

    private double lat;
    private double lng;

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }


    @Override
    public String execute() throws Exception {
        return "success";
    }

    public String queryMapPoints() throws IOException{
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("lat",this.getLat());
        map.put("lng",this.getLng());
        lists.add(map);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(JsonUtils.toJsonfromList(lists));
        return null;
}

    @Override
    public void validate() {
        if(0==lat || lat > 30.386932 || lat < 30.133887 ){
            this.addFieldError("lat", "invalid lat");
        }
        if(0==lng || lng < 119.936229 || lng > 120.488723){
            this.addFieldError("lat", "invalid lng");
        }
    }
}
