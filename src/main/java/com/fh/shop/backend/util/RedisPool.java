package com.fh.shop.backend.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;


/**
 * @program: shop-admin-v4
 * @ClassName: RedisPool
 * @description:
 * @author: 黄锦迪
 * @create: 2019-03-27 21:24
 **/
public class RedisPool {

    private static JedisPool jedisPool;

    public static void initPool(){
        //new一个JedisPoolConfig
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(5000);
        jedisPoolConfig.setMaxIdle(1000);
        jedisPoolConfig.setMinIdle(100);
        jedisPoolConfig.setTestOnBorrow(true);
        jedisPoolConfig.setTestOnReturn(true);

        jedisPool = new JedisPool(jedisPoolConfig,"192.168.1.90",6666);

    }

    static {
        initPool();
    }

    public static Jedis getResource(){
        return jedisPool.getResource();
    }


} 
