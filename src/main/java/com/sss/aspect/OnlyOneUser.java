package com.sss.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

/**
 * Created by sss on 2017/10/18.
 */
@Aspect
public class OnlyOneUser {
    @Before(value = "execution(* com.sss.controller.UserController.login(..))")
    public void isExit(){

    }
}
