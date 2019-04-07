package httpClient;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.FileWriter;
import java.io.IOException;

public class HttpClientDemo {
    public static void main(String[] args) {
        //打开浏览器
        CloseableHttpClient build = HttpClientBuilder.create().build();
        //输入网址
        HttpGet httpGet = new HttpGet("https://www.cnblogs.com/xiashengwang/p/8087181.html");
        HttpEntity entity = null;
        try {
            //发送请求，获取响应内容
            entity = build.execute(httpGet).getEntity();
            //将请求转为字符串
            String toString = EntityUtils.toString(entity, "utf-8");
            FileWriter fileWriter = new FileWriter("D:/index.html");
            fileWriter.write(toString);
            fileWriter.flush();
            System.out.println(toString);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(httpGet != null){
                httpGet.releaseConnection();
                httpGet = null;
            }
            if(build != null){
                try {
                    build.close();
                    build = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
