/*
package com.qding.bigdata.ds.datatransform.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.baidu.mapapi.SDKInitializer;
import com.example.zdfl_cdrl.action.WorkAllActivity;
import com.example.zdfl_cdrl.action.WorkNewActivity;
import com.example.zdfl_cdrl.utils.ConIP;
import com.example.zdfl_cdrl.utils.Constants;
import com.example.zdfl_cdrl.utils.Data;
import com.example.zdfl_cdrl.utils.ExampleUtil;
import com.example.zdfl_cdrl.utils.NoticeThread;


public class MainActivity extends Activity {
	*/
/*ȫ�ֱ���SessionID*//*

	public static String sessionID;
	
	public static String data;
	
	private Button loginBtn = null;
	private Button btn = null;
	private EditText username;
	private EditText password;
	private HttpClient httpClient;
	private String name;
	private String pass;
	private String msg = null;
	private String strDept[] = null;
	private String strCode[] = null;
	
	private String path = null;
	*/
/*�Զ���¼*//*

	public SharedPreferences settings;
	
	private CheckBox rem_pw;
	
	private ProgressDialog progress;
	
	private EditText ip_app_adr;
	private EditText ip_notice_adr;
	
	*/
/*��������ѡ��*//*

	private Map<String,String> tomcatMap;
	private String[] tomcatStr;
	private String tomcatSelectVal;
	private Spinner tomcatpost;
	*/
/*tomcatkey*//*

	private int tomcatkey=0;
	
	private ImageButton ipxg=null;
	
	private View view;
	
	public static boolean isForeground = false;
	*/
/*���ͽ���Ļص�*//*

	private PushHandler pushHandler;
	
	*/
/*���ش洢��ʾ*//*

	private String FILE = "saveUserNamePwd";
	private SharedPreferences sp = null;
	private TextView textView = null;
	 
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        SDKInitializer.initialize(getApplicationContext());
        setContentView(R.layout.activity_main);
//        init();
//        BasicPushNotificationBuilder builder = new BasicPushNotificationBuilder(MainActivity.this);
//        builder.notificationFlags = Notification.FLAG_AUTO_CANCEL;  //����Ϊ�Զ���ʧ
//        builder.notificationDefaults = Notification.DEFAULT_SOUND|Notification.DEFAULT_VIBRATE;  // ����Ϊ�������𶯶�Ҫ
//        JPushInterface.setPushNotificationBuilder(1, builder);
        //registerMessageReceiver();  // used for receive msg
        

        tomcatMap = new HashMap<String, String>();
        
        //���ͷ���Ļص���
        pushHandler = new PushHandler();
        httpClient = new DefaultHttpClient();
        
        username = (EditText)findViewById(R.id.username);
        password = (EditText)findViewById(R.id.password);
        rem_pw = (CheckBox) findViewById(R.id.rm_mima);
        
        settings = this.getSharedPreferences("UserInfo", Context.MODE_WORLD_READABLE);
        
	
	
        try {
        	//��ѯ���������Ƿ񱣴�
        	if(settings.getString("DepStr", "").equals("") == false){  
        		String strTemp = settings.getString("DepStr","");  
        		tomcatStr = strTemp.split(",");
        		
            }
        	//��ѯ��̨���ص�����ID�Ƿ񱣴� 
        	if(settings.getString("CodeStr", "").equals("") == false){  
        		String strTemp1 = settings.getString("CodeStr","");  
        		strCode = strTemp1.split(",");
        		if(strCode != null && strCode.length > 0)
        		{
        			for(int k = 0 ; k < strCode.length ;k++ )
        			{
        				tomcatMap.put(k+"", strCode[k]);
        			}
        		}
            }
        	
        	
		} catch (Exception e) {
			// TODO: handle exception
		}
                
        
      
	        
      
	    */
/*
	    tomcatMap.put("0","crm");
		tomcatStr[0] ="�ܲ�����";
		tomcatMap.put("1","longxin");
		tomcatStr[1] ="��������";
		tomcatMap.put("2","longhong");
		tomcatStr[2] ="��������";
		tomcatMap.put("3","longxiao");
		tomcatStr[3] ="��������";
		tomcatMap.put("4","longyu");
		tomcatStr[4] ="��������";
		tomcatMap.put("5","fengning");
		tomcatStr[5] ="��������";
		*//*

        //http://211.143.141.57:8080/voip2/
	    String[] ips=null;        
        try {
        	//��ѯIP�Ƿ񱣴�
        	if(settings.getString("FUDIP", "").equals("") == false){  
        		//ȡ���ϴ�ѡ������������
        		tomcatkey = settings.getInt("tomcatkey",0 );  
            }
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        
        //����ϴβ����Ƿ񱣴��û��������� 
        if(settings.getBoolean("ISCHECK", true)){  
        	rem_pw.setChecked(true);  
        	username.setText(settings.getString("USERNAME", ""));  
        	password.setText(settings.getString("PASSWORD", ""));  
        }else{  
        	rem_pw.setChecked(false);  
        	username.setText("");  
        	password.setText("");  
        }
        
        loginBtn = (Button)findViewById(R.id.login);
        loginBtn.setOnClickListener(new View.OnClickListener(){
			public void onClick(View v) {
				
		     
				if(tomcatStr == null || tomcatStr.length == 0)
				{
					
					new  AlertDialog.Builder(MainActivity.this).setTitle("����" )  
					                .setMessage("��ѡ���¼����" )
					                .setPositiveButton("ȷ��" ,  null )  
					                .show(); 	
					return;
					
				}
		        name = username.getText().toString().trim();
		        pass = password.getText().toString().trim();
		        
		        if(name.length() == 0 || pass.length() == 0)
		        {
					new  AlertDialog.Builder(MainActivity.this).setTitle("����" )  
	                .setMessage("�û��������벻��Ϊ��" )
	                .setPositiveButton("ȷ��" ,  null )  
	                .show(); 	
		        	
		        }
		        
		        progress=ProgressDialog.show(MainActivity.this,tomcatStr[tomcatkey]+"-��¼��",tomcatStr[tomcatkey]+"-���ڵ�¼ϵͳ,���Ժ�...");
            	new Thread(logoutRunnable).start();
              	 
			}
        });
        

        
        ipxg = (ImageButton)findViewById(R.id.ipxg);
        ipxg.setOnClickListener(new View.OnClickListener(){
        	public void onClick(View v) {
                //����IP��ַ�޸Ŀ�
                view = LayoutInflater.from(MainActivity.this).inflate(R.layout.ip_dialog, null);
                //web��̨��IP��ַ�Ķ���
                ip_app_adr = (EditText)view.findViewById(R.id.ip_adr);
                //���ͷ�������IP��ַ�Ķ��� 
                ip_notice_adr = (EditText)view.findViewById(R.id.ip_notices);
                
                //����ѡ���Ķ���
                tomcatpost = (Spinner)view.findViewById(R.id.tomcat_port); 
                
                //����ϴβ�����ȡ��������������
                if(tomcatStr != null && tomcatStr.length > 0)
                {
                	
                	//����ѡ������ArrayAdapter��������        
            	    ArrayAdapter<String> adapter = new ArrayAdapter<String>(MainActivity.this,android.R.layout.simple_spinner_item,tomcatStr);                 
            	    //���������б�ķ��        
            	    adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);                 
            	    //��adapter ��ӵ�spinner��        
            	    tomcatpost.setAdapter(adapter);   
            	    
            	 
            	    //����¼�Spinner�¼�����          
            	    tomcatpost.setOnItemSelectedListener(new Spinner.OnItemSelectedListener() {
            		    @Override
            		    public void onItemSelected(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
            		    	//��ѡ��ʱ�����Ķ���  
            		    	tomcatSelectVal = tomcatMap.get(String.valueOf(arg2));
            		    	tomcatkey = arg2;
            		    	settings.edit().putInt("tomcatkey", tomcatkey).commit(); 
            				       		    	
            		    }
            		 
            		    @Override
            		    public void onNothingSelected(AdapterView<?> arg0) {
            		    	// TODO Auto-generated method stub
            		    	tomcatSelectVal = tomcatMap.get(String.valueOf(0));
            		    	tomcatkey = 0;
            		    	settings.edit().putInt("tomcatkey", tomcatkey).commit(); 
            		    }
            		});    	    
            	    //����Ĭ��ֵ        
            	    tomcatpost.setVisibility(View.VISIBLE);	
            	    tomcatpost.setSelection(tomcatkey);
    	      	                    	
                }
                //ȡ���������İ�ť
                btn = (Button) view.findViewById(R.id.button1);
                
                btn.setOnClickListener(new OnClickListener() {
                 	 
         				@Override
         				public void onClick(View arg0) {
         					 ip_app_adr = (EditText)view.findViewById(R.id.ip_adr);
         					 path=ip_app_adr.getText().toString();
         					new MyTask().execute("");
         					// new Thread(getdataRunnable).start();
         					 
         				}
                        
                   });                
         
                
                
                try {
                	if(settings.getString("ip_app_adr", "").equals("") == false){  
                		ip_app_adr.setText(settings.getString("ip_app_adr","" ));  
                    }
                	if(settings.getString("ip_notice_adr", "").equals("") == false){  
                		ip_notice_adr.setText(settings.getString("ip_notice_adr","" ));  
                    }
        		} catch (Exception e) {
        			// TODO: handle exception
        		}                

        		
        	   
        		
                //ͨ��AlertDialog.Builder�������ʵ�������ǵ�һ��AlertDialog�Ķ���
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                //����Title��ͼ��
                builder.setIcon(R.drawable.ic_search_focused);
                //����Title������
                builder.setTitle("�����IP��ַ�޸ģ�");
                //    ���������Լ�����Ĳ����ļ���Ϊ�������Content
                builder.setView(view);
                
                //����һ��PositiveButton
                builder.setPositiveButton("ȷ��", new DialogInterface.OnClickListener()
                {
                    @Override
                    public void onClick(DialogInterface dialog, int which)
                    {
        		        //��������ڵ��·������
                    	if(ip_app_adr.getText().toString().trim().length()>0)
//                    	   ConIP.IP="http://"+ip_app_adr.getText().toString().trim()+"/"+tomcatSelectVal;
                    		ConIP.IP="http://"+ip_app_adr.getText().toString().trim()+"/crm_cd_springMVC";
                    	else
                    	{
                    		Toast.makeText(MainActivity.this,"APPServer IP��ַ���ô���",Toast.LENGTH_LONG).show();
                    		return;
                    	}	
                    	String []strTemp = ip_notice_adr.getText().toString().trim().split(":");
                    	if(strTemp.length >= 2)
                    	{	
                    	  ConIP.NOTICESERVER_IP = strTemp[0];
                    	  ConIP.NOTICE_PORT = Integer.parseInt(strTemp[1]);
                    	}
                    	else
                    	{
                    		Toast.makeText(MainActivity.this,"NoticeServer IP��ַ���ô���",Toast.LENGTH_LONG).show();
                    		return;
                    		
                    	}
                    	settings.edit().putString("FUDIP",ConIP.IP).commit();
                    	settings.edit().putInt("tomcatkey",tomcatkey).commit();
                    	settings.edit().putString("ip_notice_adr",ip_notice_adr.getText().toString()).commit();
                    	settings.edit().putString("ip_app_adr",ip_app_adr.getText().toString()).commit();
                    	
                    	//ǿ�ƹر�                    	
                    	// 1.  
//                    	android.os.Process.killProcess(android.os.Process.myPid());  
                    	// 2.  
//                    	ActivityManager am = (ActivityManager)getSystemService(ACTIVITY_SERVICE);  
//                    	am.restartPackage("lab.sodino.errorreport");  
                    	// 3.  
//                    	System.exit(0);

                    }
                });
                //    ����һ��NegativeButton
                builder.setNegativeButton("ȡ��", new DialogInterface.OnClickListener()
                {
                    @Override
                    public void onClick(DialogInterface dialog, int which)
                    {
        		        
                    }
                });
                //    ��ʾ���öԻ���
                builder.show();
			
        	}
        });
        
        
        //��Ϣ���ͣ��ͻ��˵�½ʱע�������ͷ�������
//        ServiceManager serviceManager = new ServiceManager(this);  
//        serviceManager.setNotificationIcon(R.drawable.ic_work_all);  
//        serviceManager.startService(); 
        
    }
        

	
    Runnable logoutRunnable = new Runnable() {
	    @Override  
	    public void run() {  
	        if(!settings.getString("FUDIP", "").equals("")){  
	        	ConIP.IP=settings.getString("FUDIP", "");  
	        }
	        else
	        {
	        	ConIP.IP += "/crm_cd_springMVC";
//	        	ConIP.IP += "/crm";
	        }
	        Log.d("Login ip-->", ConIP.IP+"Constants.LOGIN_PATH-->"+Constants.LOGIN_PATH); 
	    	
	        
	    	if(!settings.getString("SESSIONID", "").equals(""))
	    	{
	    		
				HttpGet get = new HttpGet(Constants.LOGOUT_PATH+settings.getString("SESSIONID", ""));
				HttpClient client = new DefaultHttpClient();
				StringBuilder builder = null;
				try {
					HttpResponse response = client.execute(get);
					if (response.getStatusLine().getStatusCode() == 200) {
						InputStream inputStream = response.getEntity().getContent();
						BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
						builder = new StringBuilder();
						String s = null;
						for (s = reader.readLine(); s != null; s = reader.readLine()) {
							builder.append(s);
						}
				    	if(builder!=null){
							if(builder.toString().equals("1")){
								
							}else{
								Toast.makeText(MainActivity.this,"�û���ʼ����¼����ʧ�ܣ�",Toast.LENGTH_LONG).show();
							}
						}
					}
				} catch (Exception e) {
					progress.dismiss();
                	runOnUiThread(new Runnable() {
                        public void run() {
                            Toast.makeText(MainActivity.this,"���������쳣��",Toast.LENGTH_LONG).show();
                       }
                	});
					e.printStackTrace();
				}
		    }
	    	
    		HttpPost post = new HttpPost(Constants.LOGIN_PATH);
            // ������ݲ��������Ƚ϶�Ļ����ԶԴ��ݵĲ������з�װ
    		String strc = tomcatMap.get(tomcatkey+"");
            List<BasicNameValuePair> params = new ArrayList<BasicNameValuePair>();
            params.add(new BasicNameValuePair("code", tomcatMap.get(tomcatkey+"")));
            params.add(new BasicNameValuePair("username", name));
            params.add(new BasicNameValuePair("password", pass));
            try {
                // �����������
                post.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                // ����POST����
                HttpResponse response = httpClient.execute(post);
                // ����������ɹ��ط�����Ӧ
                if (response.getStatusLine().getStatusCode() == 200)
                {
                    msg = EntityUtils.toString(response.getEntity());
                    if(msg!=null && !msg.equals("")){
                    	String[] array = msg.split(",");
                        if(array[0].equals("1")){
                        	sessionID = array[1];
        			        if(rem_pw.isChecked()) {
        						settings.edit().putBoolean("ISCHECK", true)
        						.putString("USERNAME", name)
        						.putString("PASSWORD", pass)
        						.putString("SESSIONID", MainActivity.sessionID)
        						.commit();
        			        }else{
        			        	settings.edit().putBoolean("ISCHECK", false)
        						.putString("USERNAME", "")
        						.putString("PASSWORD", "")
        						.commit();
        			        }
                            // ��ʾ��¼�ɹ�
                        	progress.dismiss();
        			        Intent intent = new Intent();
        	                intent.setClass(MainActivity.this, MainFragment.class);
        	                Data.code=tomcatMap.get(tomcatkey+"");
        	                Data.name=name;
        	                Data.pass=pass;
        	                
        	                startActivityForResult(intent, 0);
        	            
        	                String strTemp2[] = new String[2];
        	              	if(settings.getString("ip_notice_adr", "").equals("") == false){  
        	            		String strTemp1 = settings.getString("ip_notice_adr","");  
        	            		strTemp2= strTemp1.split(":");
        	                }       
        	              	if(strTemp2.length == 2)
        	              	{
        	                  //�����ͷ�������ע����û���Ϣ
        	                  ConIP.mNoticeThread = new NoticeThread(pushHandler,strTemp2[0],Integer.parseInt(strTemp2[1]),name,pass);
        	                  ConIP.mNoticeThread.start(); 
        	              	}
        	              	else
        	              	{
        	              		
        	              	}
        	           
                      
                        }else if(array[0].equals("0")){
                        	progress.dismiss();
                        	runOnUiThread(new Runnable() {
                               public void run() {
                                    Toast.makeText(MainActivity.this,"�û������������",Toast.LENGTH_LONG).show();
                               }
                        	});
    			        }else if(array[0].equals("2")){
                        	progress.dismiss();
                        	runOnUiThread(new Runnable() {
                                public void run() {
                                    Toast.makeText(MainActivity.this,"��ǰ�û��Ѿ���½�����л��û���",Toast.LENGTH_LONG).show();
                               }
                        	});
    			        }
                    }

                }
            }
            catch (Exception e)
            {
				progress.dismiss();
            	runOnUiThread(new Runnable() {
                    public void run() {
                        Toast.makeText(MainActivity.this,"���������쳣��",Toast.LENGTH_LONG).show();
                   }
            	});
                e.printStackTrace();
            }
	    	
	    }
    };
   
    */
/**���ͷ�����̸߳����߳�ͨ�ŵĻص���
     * 
     * @author zhanghongsheng
     *
     *//*

    private  class PushHandler extends Handler
    {
    	@Override
    	public void handleMessage(Message msg)
    	{
    	    super.handleMessage(msg);
     		switch(msg.arg1)
     		{
     		case 10:   //��������������Ϣ   
     			
     			//����һ��NotificationManager������
     			String ns = Context.NOTIFICATION_SERVICE;
     			NotificationManager mNotificationManager = (NotificationManager)getSystemService(ns);
     			
     			mNotificationManager.cancel(0);
     			// ����Notification�ĸ�������
     			int icon = R.drawable.activity_bg4; //֪ͨͼ��
     			String message = msg.obj.toString();//���ͷ������͹�������Ϣ����
     			//�������� BX�����޹�����CW���²⹤��
     			String orderType = GetParam(message,"[","]"); 
     			String messageContent =message.substring(message.lastIndexOf("]")+1);
     			CharSequence notificationText = messageContent; //״̬����ʾ��֪ͨ�ı���ʾ
     			long when = System.currentTimeMillis(); //֪ͨ������ʱ�䣬����֪ͨ��Ϣ����ʾ
     			
     			//����������Գ�ʼ�� Nofification
     			Notification notification = new Notification(icon,"δ������֪ͨ",when);
 			    //֪ͨʱ����Ĭ�ϵ����� 
     			notification.defaults = Notification.DEFAULT_SOUND| Notification.DEFAULT_VIBRATE;
     			//����֪ͨ���¼���Ϣ
     			Context context = getApplicationContext(); //������
     			CharSequence contentTitle = "δ������֪ͨ"; //֪ͨ������
     			CharSequence contentText = notificationText; //֪ͨ������MyWorkClassify
     			
     			Intent notificationIntent  = new Intent();   
     			notificationIntent.setClass(MainActivity.this,WorkNewActivity.class);   
     			Bundle bundleSimple = new Bundle();   
     			bundleSimple.putString("classify", orderType);   
     			bundleSimple.putString("worktype", "new"); 
     			notificationIntent.putExtras(bundleSimple);  
//     			startActivityForResult(notificationIntent, 0); 
//     			Intent intentSimple = new Intent(MainActivity.this, MainFragment.class); //�����֪ͨ��Ҫ��ת��δ��������Activity

     			notification.flags = Notification.FLAG_AUTO_CANCEL;//���֪ͨ����֪ͨ���Զ�ȡ��
     			PendingIntent contentIntent = PendingIntent.getActivity(MainActivity.this,0,notificationIntent,0);
     			notification.setLatestEventInfo(context, contentTitle, contentText, contentIntent);
     			//��Notification���ݸ� NotificationManager
     			mNotificationManager.notify(0,notification);
//     			mNotificationManager.cancel(0);
//     			�����Ҫ����һ��֪ͨ��ֻ��Ҫ�����ú�notification֮���ٴε��� setLatestEventInfo(),Ȼ�����·���һ��֪ͨ���ɣ����ٴε���notify()��
     			break;
     		case 11:
//     			mTextView.setText("��¼�ɹ� ");
     		    break;
     		case 12:
//     			mTextView.setText("��¼ʧ��  ");
     		    break;
     		case 99:  //��Ҫ���µ�¼ 
              //  NoticeThread mNoticeThread = new NoticeThread(pushHandler,ConIP.NOTICESERVER_IP,ConIP.NOTICE_PORT,name,pass);
               // mNoticeThread.start(); 
     		    break;
     		}    	
     	}
    	
    }
    
    */
/**���ݴ�����ַ����ͱ�ǩ�ַ���ȡ����
     * 
     * @param pScr
     * @param p1
     * @param p2
     * @return
     *//*

    String GetParam(String pScr,String p1,String p2)
    {
    	if(pScr.length() ==0 || p1.length() == 0 || p2.length() == 0)
    		return "";
    	int iStart = pScr.indexOf(p1);
    	int iEnd = pScr.indexOf(p2);
    	if(iStart == -1 || iEnd== -1)
    		return "";
    	String strRet = pScr.substring(iStart+p1.length(),iEnd);
    	return strRet;
    }
	// ��ʼ�� JPush������Ѿ���ʼ������û�е�¼�ɹ�����ִ�����µ�¼��
	private void init(){
//		 JPushInterface.init(getApplicationContext());
	}
	
	@Override
	protected void onResume() {
//		JPushInterface.onResume(getApplicationContext());
		isForeground = true;
		super.onResume();
	}

	@Override
	protected void onPause() {
//		JPushInterface.onPause(getApplicationContext());
		isForeground = false;
		super.onPause();
	}

	@Override
	protected void onDestroy() {
//		unregisterReceiver(mMessageReceiver);
		super.onDestroy();
	}

	//for receive customer msg from jpush server
	private MessageReceiver mMessageReceiver;
	public static final String MESSAGE_RECEIVED_ACTION = "com.example.zdfl_cdrl.MESSAGE_RECEIVED_ACTION";
	public static final String KEY_TITLE = "title";
	public static final String KEY_MESSAGE = "message";
	public static final String KEY_EXTRAS = "extras";
	
	public void registerMessageReceiver() {
		mMessageReceiver = new MessageReceiver();
		IntentFilter filter = new IntentFilter();
		filter.setPriority(IntentFilter.SYSTEM_HIGH_PRIORITY);
		filter.addAction(MESSAGE_RECEIVED_ACTION);
		registerReceiver(mMessageReceiver, filter);
	}

	public class MessageReceiver extends BroadcastReceiver {

		@Override
		public void onReceive(Context context, Intent intent) {
			if (MESSAGE_RECEIVED_ACTION.equals(intent.getAction())) {
              String messge = intent.getStringExtra(KEY_MESSAGE);
              String extras = intent.getStringExtra(KEY_EXTRAS);
              StringBuilder showMsg = new StringBuilder();
              showMsg.append(KEY_MESSAGE + " : " + messge + "\n");
              if (!ExampleUtil.isEmpty(extras)) {
            	  showMsg.append(KEY_EXTRAS + " : " + extras + "\n");
              }
              setCostomMsg(showMsg.toString());
			}
		}
	}
	
	private void setCostomMsg(String msg){
		Log.v("------------���յ�����---------------", msg);
	}
	
    private boolean checkIP(String str) {
        Pattern pattern = Pattern.compile("^((\\d|[1-9]\\d|1\\d\\d|2[0-4]\\d|25[0-5]|[*])\\.){3}(\\d|[1-9]\\d|1\\d\\d|2[0-4]\\d|25[0-5]|[*])$");
        return pattern.matcher(str).matches();
    }

    
    
    
    
    */
/**
   	 * MyTask�̳��̳߳�AsyncTask����������������json���������ݸ��µȲ�����
   	 *//*

   public	class MyTask extends AsyncTask<String, Void, String> {
   		
   		*/
/**
   		 * ��������ǰ��ʾdialog��
   		 *//*

   		@Override
   		protected void onPreExecute() {
   			super.onPreExecute();
   		}
   		
   		*/
/**
   		 * ��doInBackground�����У���һЩ������������Ⱥ�ʱ������
   		 *//*

   		@Override
   		protected String doInBackground(String... params) {
   			return GetData();
   		}
   		
   		*/
/**
   		 * �ڸ÷����У���Ҫ����һЩ���ݵĴ������¡�
   		 *//*

   		@Override
   		protected void onPostExecute(String result) {
   			if (result != null && !result.equals("")) {
   				// �����ȡ��result���ݲ�Ϊ�գ���ô�������JSON����������ʾ���ֻ���Ļ�ϡ�
//   				List<Map<String, Object>> list0 = JSONAnalysis(result);
			try {
				JSONArray jsonarray = new JSONArray(result);
				 */
/*��װ��������ѡ������������*//*

			    
			    tomcatStr = new String[jsonarray.length()];
			    
                String DepStr = "";
                String CodeStr = "";
                tomcatMap.clear();
			    
	      	    for (int i = 0; i < jsonarray.length(); i++) {
	      	    	String stemp = jsonarray.getJSONObject(i).get("code").toString();
	      	    	tomcatMap.put(i+"", jsonarray.getJSONObject(i).get("code").toString());
	      	    	tomcatStr[i]=jsonarray.getJSONObject(i).get("name").toString();
	      	    	DepStr += tomcatStr[i]+",";
	      	    	CodeStr += stemp+",";
					}
	      	    
	      	    settings.edit().putString("DepStr", DepStr).commit();
	      	    settings.edit().putString("CodeStr", CodeStr).commit();
	      	    
	      	   tomcatpost = (Spinner)view.findViewById(R.id.tomcat_port); 
	      	    //����ѡ������ArrayAdapter��������        
        	    ArrayAdapter<String> adapter = new ArrayAdapter<String>(MainActivity.this,android.R.layout.simple_spinner_item,tomcatStr);                 
        	    //���������б�ķ��        
        	    adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);                 
        	    //��adapter ��ӵ�spinner��        
        	    tomcatpost.setAdapter(adapter);                 
        	    //����¼�Spinner�¼�����          
        	    tomcatpost.setOnItemSelectedListener(new Spinner.OnItemSelectedListener() {
        		    @Override
        		    public void onItemSelected(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
        		    	//��ѡ��ʱ�����Ķ���  
        		    	tomcatSelectVal = tomcatMap.get(String.valueOf(arg2));
        		    	tomcatkey = arg2;
        		    	settings.edit().putInt("tomcatkey", tomcatkey).commit(); 
        				       		    	
        		    }
        		 
        		    @Override
        		    public void onNothingSelected(AdapterView<?> arg0) {
        		    	// TODO Auto-generated method stub
        		    	tomcatSelectVal = tomcatMap.get(String.valueOf(0));
        		    	tomcatkey = 0;
        		    	settings.edit().putInt("tomcatkey", tomcatkey).commit(); 
        		    }
        		});    	    
        	    //����Ĭ��ֵ        
        	    tomcatpost.setVisibility(View.VISIBLE);	
        	    tomcatpost.setSelection(tomcatkey);
	      	    
	   			super.onPostExecute(result);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
   		}
   	}
       
    public String  GetData()
    {
    		msg = "";   
    		ConIP.IP="http://"+path+"/crm_cd_springMVC";
//    		path ="192.168.0.116:8081"+ "/crm_cd_springMVC";
   	        Log.d("Login ip-->", ConIP.IP+"Constants.LOGIN_PATH-->"+Constants.LOGIN_PATH); 
   	        String httpStr = ConIP.IP+"/servlet/CompanyQuery";
   	    	
   	    	//��ȡ��˾
    		HttpPost post = new HttpPost(httpStr);
            // ������ݲ��������Ƚ϶�Ļ����ԶԴ��ݵĲ������з�װ
            List<BasicNameValuePair> params = new ArrayList<BasicNameValuePair>();
            try {
                // �����������
                post.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
                // ����POST����
                HttpResponse response = httpClient.execute(post);
                // ����������ɹ��ط�����Ӧ
                if (response.getStatusLine().getStatusCode() == 200)
                {
                    msg = EntityUtils.toString(response.getEntity());
                    return msg;
                }
            }
            catch (Exception e)
            {
   				
            	
                e.printStackTrace();
            }
   	    	
            	return msg;
    };		
   	} 
}
*/
