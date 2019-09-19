package com.qding.bigdata.ds.annotation;

import java.lang.annotation.*;

/**
 * @author yanpf
 * @date 2018/5/16 11:00
 * @description
 */

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface DynamicDataSource {
    String value() default "";
}
