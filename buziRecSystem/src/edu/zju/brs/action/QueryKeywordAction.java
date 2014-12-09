package edu.zju.brs.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.zju.brs.utls.JsonUtils;
import edu.zju.brs.utls.StringUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by XZJ on 2014/12/9.
 */
public class QueryKeywordAction extends ActionSupport {

    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String execute() throws Exception {
        return "success";
    }

    public String queryShopByKeyword() throws IOException {
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();

        //根据该关键词查询数据库mydb
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        }catch(Exception e){
            System.out.println("找不到驱动类加载失败");
            e.printStackTrace();
        }
        String url = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "";
        Connection con=null;
        PreparedStatement ps=null;
        String querySql = "select lng,lat,name from shop_info where name like \"%" + this.keyword + "%\"";

        try{
            con = DriverManager.getConnection(url, username, password);
            ps = con.prepareStatement(querySql);
            ResultSet res = ps.executeQuery(querySql);
            while(res.next()){
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("lng",Double.parseDouble((String)res.getObject(1)));
                map.put("lat",Double.parseDouble((String) res.getObject(2)));
                map.put("shop_name",res.getObject(3));
                lists.add(map);
            }
        }catch(Exception se){
            se.printStackTrace() ;
        }
        try {
            con.close();
            ps.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(JsonUtils.toJsonfromList(lists));
        return null;
    }

    @Override
    public void validate() {
        if(StringUtils.isEmpty(this.keyword)){
            this.addFieldError("keyword", "empty keyword");
        }
    }
}
