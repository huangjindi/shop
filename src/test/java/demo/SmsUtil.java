package demo;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class SmsUtil {
    public static void main(String[] args) {
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        String uuid = UUID.randomUUID().toString();
        String time = "" + new Date().getTime();
        String checkSum = CheckSumBuilder.getCheckSum("f0160b9b97e1", uuid, time);
        HttpPost httpPost = new HttpPost("https://api.netease.im/sms/sendcode.action");
        httpPost.addHeader("AppKey", "856e00d7fcb941e284a18103f947dee7");
        httpPost.addHeader("Nonce", uuid);
        httpPost.addHeader("CurTime", time);
        httpPost.addHeader("AppKey", checkSum);

        List<NameValuePair> parems = new ArrayList();
        parems.add(new BasicNameValuePair("mobile","18537912159"));

        try {
            UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(parems, "utf-8");
            httpPost.setEntity(urlEncodedFormEntity);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
