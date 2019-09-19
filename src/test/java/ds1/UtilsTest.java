package ds1;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.ParseException;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;

import com.qding.bigdata.ds.util.EncodeUtil;
import com.qding.bigdata.ds.util.HttpUtil;
import com.qding.bigdata.ds.util.JsonUtil;


public class UtilsTest {
    private static final Pattern resultPat = Pattern.compile("^callback\\((.*)\\)");

  @Test
  public void testEncodeUtil(){
    String url="%5B%7B%22location%22%3A%22116.581832%2C39.922102%22%2C%22ip%22%3A%22%22%2C%22position%22%3A%22%22%2C%22bhv_from%22%3A%22%22%2C%22url%22%3A%22%22%2C%22cookie%22%3A%22%22%2C%22user_id%22%3A%22%22%2C%22vid%22%3A%223.0.0%22%2C%22imei%22%3A%22935563d8d27a90d080eb9acde6021294%22%2C%22agent%22%3A%22%22%2C%22query%22%3A%22%22%2C%22media%22%3A%22%22%2C%22os%22%3A%229.3.1%22%2C%22UAEventKey%22%3A%22Out_App%22%2C%22bhv%22%3A%22Out_App%22%2C%22USPositionKey%22%3A%22%22%2C%22referrer%22%3A%22%22%2C%22grade%22%3A%22%22%2C%22timestamp%22%3A%221480397422125.782959%22%2C%22network%22%3A%22WIFI%22%2C%22item_id%22%3A%22%22%2C%22model%22%3A%22Unknown%20iPhone%22%2C%22USIdKey%22%3A%22%22%2C%22UALevelRelation%22%3A%221%7C1%22%2C%22device%22%3A%22iOS%22%2C%22trace_id%22%3A%22%22%7D%5D";
    System.out.println(EncodeUtil.urlDecode(url));
    System.out.println(EncodeUtil.urlDecode(EncodeUtil.urlDecode(url)));
  }
  @Test
  public void testJsonUtil(){
    String url="%5B%7B%22location%22%3A%22116.581832%2C39.922102%22%2C%22ip%22%3A%22%22%2C%22position%22%3A%22%22%2C%22bhv_from%22%3A%22%22%2C%22url%22%3A%22%22%2C%22cookie%22%3A%22%22%2C%22user_id%22%3A%22%22%2C%22vid%22%3A%223.0.0%22%2C%22imei%22%3A%22935563d8d27a90d080eb9acde6021294%22%2C%22agent%22%3A%22%22%2C%22query%22%3A%22%22%2C%22media%22%3A%22%22%2C%22os%22%3A%229.3.1%22%2C%22UAEventKey%22%3A%22Out_App%22%2C%22bhv%22%3A%22Out_App%22%2C%22USPositionKey%22%3A%22%22%2C%22referrer%22%3A%22%22%2C%22grade%22%3A%22%22%2C%22timestamp%22%3A%221480397422125.782959%22%2C%22network%22%3A%22WIFI%22%2C%22item_id%22%3A%22%22%2C%22model%22%3A%22Unknown%20iPhone%22%2C%22USIdKey%22%3A%22%22%2C%22UALevelRelation%22%3A%221%7C1%22%2C%22device%22%3A%22iOS%22%2C%22trace_id%22%3A%22%22%7D%5D";
    System.out.println(JsonUtil.strJson2ListMap(EncodeUtil.urlDecode(url)));
  }
  
  @Test
  public void testHttpUtil() throws Exception{
	
	  String url = "https://qaqd.qdingnet.com/managerbg/home/loginByMobile";
	  Map<String,String> params = new HashMap<String,String>();
	  params.put("mobile", "18910269755");
	  params.put("password", "614812@zj");
	  params.put("orgTypeFlag", "bs");
	  params.put("callback", "callback");

	  try {
		ObjectMapper objectMapper = new ObjectMapper();

		String  post = "";
		for(int i=0;i<3;i++){
			try{
				System.out.println(new Date().toLocaleString());
				post = HttpUtil.post(url, params);
				break;
			}catch(Exception e){
				e.printStackTrace();
				Thread.sleep(10000);
				continue;
			}
			
		}
		
		Matcher matcher = resultPat.matcher(post);
		System.out.println(post);

		if(matcher.find()){
            Map<String, Object> map = ((HashMap<String, Object>) objectMapper.readValue(matcher.group(1).toString(), Map.class));
            String code = map.get("code").toString();
            if(code.equals("200")){
            	map =(HashMap<String, Object>)  map.get("data");
            	map =(HashMap<String, Object>)  map.get("entity");
    			System.out.println(map.get("realname"));

            }else{
            	
            	System.out.println(map.get("message").toString());
            }
		}
	} catch (ParseException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	  
	  
	  
	  
	  
  }
}
