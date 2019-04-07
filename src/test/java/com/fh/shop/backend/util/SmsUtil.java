package com.fh.shop.backend.util;

import com.google.gson.Gson;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class SmsUtil {
    public static String sms(String phone) {
        //构建头信息
        Map<String, String> header = new HashMap<>();
        header.put("AppKey", SystemConstant.APP_KEY);
        String uuid = UUID.randomUUID().toString();
        header.put("Nonce", uuid);
        String currTime = "" + new Date().getTime();
        header.put("CurTime", currTime);
        String checkSum = CheckSumBuilder.getCheckSum(SystemConstant.APP_SECRET, uuid, currTime);
        header.put("CheckSum", checkSum);

        //构建参数信息
        Map<String, String> param = new HashMap<>();
        param.put("mobile", phone);
        //执行请求
        String result = HttpClientUtil.sendPost(SystemConstant.PHONE_SEND_CODE_URL, header, param);
        Gson gson = new Gson();
        Map map = gson.fromJson(result, Map.class);
        String phoneCode = (String) map.get("obj");
        System.out.println(phoneCode);
        return phoneCode;
    }
}
