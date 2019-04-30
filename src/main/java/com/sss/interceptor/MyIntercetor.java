package com.sss.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.interceptor
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/8 20:02
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/8    pc           v1.0.0               修改原因
 */
public class MyIntercetor extends HandlerInterceptorAdapter {
    static public final Logger logger = LoggerFactory.getLogger(MyIntercetor.class);

    /**
     *  在业务处理器处理请求之前被调用
     *      如果返回false
     *          从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     *
     *      如果返回true
             *    执行下一个拦截器,直到所有的拦截器都执行完毕
             *    再执行被拦截的Controller
             *    然后进入拦截器链,
             *    从最后一个拦截器往回执行所有的postHandle()
             *    接着再从最后一个拦截器往回执行所有的afterCompletion()
     **/
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("MyIntercetor   preHandle执行。。。");

        return super.preHandle(request, response, handler);
    }

    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作
     * 可在modelAndView中加入数据，比如当前时间
     **/
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
        logger.info("MyInterceptor   postHandle执行。。。");
    }
}
