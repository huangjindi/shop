package com.fh.shop.backend.util;

import redis.clients.jedis.Jedis;

/**
 * @program: shop-admin-v4
 * @ClassName: RedisUtil
 * @description:
 * @author: 黄锦迪
 * @create: 2019-03-27 21:31
 **/
public class RedisUtil {

    public static String get(String key){
        Jedis jedis = null;
        String result = null;
        try {
            jedis = RedisPool.getResource();
            result = jedis.get(key);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != jedis){
                jedis.close();
                jedis = null;
            }
        }
        return result;
    }


    public static void expire(String key,int seconds){
        Jedis jedis = null;
        try {
            jedis = RedisPool.getResource();
            jedis.expire(key,seconds);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != jedis){
                jedis.close();
                jedis = null;
            }
        }

    }

    public static void set(String key,String value){
        Jedis jedis = null;
        try {
            jedis = RedisPool.getResource();
            jedis.set(key,value);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != jedis){
            jedis.close();
            jedis = null;
        }
    }

    }
} 
