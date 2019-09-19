package com.qding.bigdata.ds.datatransform.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

public class PoolThread {

    public static  ExecutorService fixedThreadPool = Executors.newFixedThreadPool(10,      new ThreadFactory() {
        public Thread newThread(Runnable r) {
            Thread t = Executors.defaultThreadFactory().newThread(r);
            t.setDaemon(true);
            return t;
        }
    });

    public static void fixedThread(Runnable runnable){
        fixedThreadPool.execute(runnable);
    }
}
