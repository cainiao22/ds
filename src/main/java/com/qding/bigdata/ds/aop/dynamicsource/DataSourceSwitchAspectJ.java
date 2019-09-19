package com.qding.bigdata.ds.aop.dynamicsource;

import com.qding.bigdata.ds.annotation.DynamicDataSource;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.SpelEvaluationException;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * @author yanpf
 * @date 2018/5/16 9:47
 * @description
 */

@Aspect
@Component
public class DataSourceSwitchAspectJ {


    ExpressionParser parser = new SpelExpressionParser();

    LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /*@Pointcut("execution(public * *(..))")
    private void anyMethod(){}//定义一个切入点*/

    @Before("@annotation(com.qding.bigdata.ds.annotation.DynamicDataSource)")
    public void beforMethod(JoinPoint joinPoint){

        /*  不知什么原因这个方法获取不到注解
        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        Parameter[] parameters = method.getParameters();
        EvaluationContext context = new StandardEvaluationContext();
        Object[] args = joinPoint.getArgs();
        for (int i=0; i<parameters.length; i++) {
            context.setVariable(parameters[i].getName(), args[i]);
        }
        */

        //拦截的实体类
        Object target = joinPoint.getTarget();
        //拦截的方法名称
        String methodName = joinPoint.getSignature().getName();
        //拦截的方法参数
        Object[] args = joinPoint.getArgs();
        //拦截的放参数类型
        Class[] parameterTypes = ((MethodSignature)joinPoint.getSignature()).getMethod().getParameterTypes();

        Method method = null;
        try {
            method = target.getClass().getMethod(methodName, parameterTypes);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        //获取变量名称
        String[] params = u.getParameterNames(method);
        EvaluationContext context = new StandardEvaluationContext();
        for (int i=0; i<params.length; i++) {
            context.setVariable(params[i], args[i]);
        }
        DynamicDataSource annotation = method.getAnnotation(DynamicDataSource.class);

        String dataSource;
        try {
            dataSource = parser.parseExpression(annotation.value()).getValue(context, String.class);
        }catch (SpelEvaluationException e){
            dataSource = annotation.value();
        }
        logger.info("dataSource取值为: " + dataSource);
        DataSourceContextHolder.setDataSource(dataSource);
    }
}
