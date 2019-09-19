package com.qding.bigdata.ds.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author yanpf
 * @date 2018/5/30 9:46
 * @description
 */
@Component
public class EnvConfig {

    //private static boolean envLocal = Boolean.valueOf(PropertiesUtil.getPropertiesByKey(Constant.CONFIGFILE, "env.local", "false"));

    private static boolean envLocal;

    public static boolean isEnvLocal() {
        return envLocal;
    }

    @Value("${env.local}")
    public void setEnvLocal(boolean envLocal) {
        EnvConfig.envLocal = envLocal;
    }
}
