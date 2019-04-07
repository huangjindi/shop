package com.fh.shop.backend.common;

import redis.clients.jedis.JedisPoolConfig;

/**
 * @program: shop-admin-v4
 * @ClassName: JedisPool
 * @description:
 * @author: 黄锦迪
 * @create: 2019-03-27 21:11
 **/
public class RedisPool {

    public static RedisPool jedisPool = null;

    public static void initPool(){
        //new一个JedisPoolConfig
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(1000);
        jedisPoolConfig.setMaxIdle(100);
        jedisPoolConfig.setMinIdle(100);
        jedisPoolConfig.setTestOnBorrow(true);
        jedisPoolConfig.setTestOnReturn(true);

    }
}
