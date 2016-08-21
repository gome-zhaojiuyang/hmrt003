<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* public static String host = "http://192.168.1.166:8080/ImageServer/";  

public static String getContent(String url) throws Exception {  
  
    StringBuilder sb = new StringBuilder();  
  
    HttpClient client = new DefaultHttpClient();  
    HttpParams httpParams = client.getParams();  
    // 设置网络超时参数  
    HttpConnectionParams.setConnectionTimeout(httpParams, 3000);  
  
    HttpConnectionParams.setSoTimeout(httpParams, 5000);  
    HttpResponse response = client.execute(new HttpGet(url));  
    HttpEntity entity = response.getEntity();  
    if (entity != null) {  
        BufferedReader reader = new BufferedReader(new InputStreamReader(  
                entity.getContent(), "UTF-8"), 8192);  
  
        String line = null;  
        while ((line = reader.readLine()) != null) {  
            sb.append(line + "\n");  
        }  
        reader.close();  
  
    }  
  
    return sb.toString();  
}  
public static HttpResponse post(Map<String, Object> params, String url) {  
  
    HttpClient client = new DefaultHttpClient();  
    HttpPost httpPost = new HttpPost(url);  
    httpPost.addHeader("charset", HTTP.UTF_8);  
    httpPost.setHeader("Content-Type",  
            "application/x-www-form-urlencoded; charset=utf-8");  
    HttpResponse response = null;  
    if (params != null && params.size() > 0) {  
        List<NameValuePair> nameValuepairs = new ArrayList<NameValuePair>();  
        for (String key : params.keySet()) {  
            nameValuepairs.add(new BasicNameValuePair(key, (String) params  
                    .get(key)));  
        }  
        try {  
            httpPost.setEntity(new UrlEncodedFormEntity(nameValuepairs,  
                    HTTP.UTF_8));  
            response = client.execute(httpPost);  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } catch (RuntimeException e) {  
            e.printStackTrace();  
        }  
    } else {  
        try {  
            response = client.execute(httpPost);  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
  
    return response;  
  
}  
public static Object getValues(Map<String, Object> params, String url) {  
    String token = "";  
    HttpResponse response = post(params, url);  
    if (response != null) {  
        try {  
            token = EntityUtils.toString(response.getEntity());  
            response.removeHeaders("operator");  
        } catch (ParseException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
    return token;  
}  
public static Object setImgByStr(String imgStr,String imgName){  
    String url =  host+"channel-uploadImage.action";  
    Map<String,Object> params = new HashMap<String, Object>();  
    params.put("imgStr", imgStr);  
    params.put("imgName", imgName);  
    return getValues(params, url);  
} */

%>
</body>
</html>