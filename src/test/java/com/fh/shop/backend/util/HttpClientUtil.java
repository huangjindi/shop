package com.fh.shop.backend.util;

import net.sf.json.JSON;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class HttpClientUtil {
    public static String sendPost(String url, Map<String,String> header, Map<String, String> param ) {
        CloseableHttpClient client = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(url);
        //构建头部参数
        if (header != null && header.size() != 0){
            //循环Map
            Iterator<Map.Entry<String, String>> iterator = header.entrySet().iterator();
            while (iterator.hasNext()){
                Map.Entry<String, String> next = iterator.next();
                httpPost.addHeader(next.getKey(),next.getValue());
            }
        }
        //构建参数信息
        if (param != null && param.size() != 0) {
            List<NameValuePair> nvpList = new ArrayList<NameValuePair>();
            Iterator<Map.Entry<String, String>> iterator = param.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<String, String> next = iterator.next();
                nvpList.add(new BasicNameValuePair(next.getKey(),next.getValue()));
            }
            try {
                httpPost.setEntity(new UrlEncodedFormEntity(nvpList));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        CloseableHttpResponse response = null;
        String result = "";
        try {
            //执行请求
            response = client.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity,"utf-8");
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (response != null){
                try {
                    response.close();
                    response = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (httpPost != null ) {
                httpPost.releaseConnection();
            }
            if (client != null ){
                try {
                    client.close();
                    client = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        return result;
    }

    public static String sendPost(String url, JSON json) {
        CloseableHttpClient client = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(url);
        CloseableHttpResponse response = null;
        String result = "";
        try {
            if (json != null) {
                StringEntity entity = new StringEntity(json.toString(), Charset.forName("UTF-8"));
                entity.setContentEncoding("UTF-8");
                // 发送Json格式的数据请求
                entity.setContentType("application/json");
                httpPost.setEntity(entity);
            }
            response = client.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity,"utf-8");
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (response != null){
                try {
                    response.close();
                    response = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (httpPost != null ) {
                httpPost.releaseConnection();
            }
            if (client != null ){
                try {
                    client.close();
                    client = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        return result;
    }
    public  static String sendGet(String url) {
        //打开浏览器
        CloseableHttpClient client = HttpClientBuilder.create().build();
        //发送请求
        HttpGet httpGet = new HttpGet(url);
        CloseableHttpResponse response = null;
        String result = "";
        try {
            //执行请求 返回数据
            response = client.execute(httpGet);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity, "utf-8");
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (response != null){
                try {
                    response.close();
                    response = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (httpGet != null ) {
                httpGet.releaseConnection();
            }
            if (client != null ){
                try {
                    client.close();
                    client = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        return result;
    }


}
