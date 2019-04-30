import com.sss.dao.GoodsCarMapper;
import com.sss.pojo.GoodsCar;
import com.sss.service.Impl.GoodsCarServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import sun.misc.BASE64Encoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: PACKAGE_NAME
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/1/8 19:22
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/1/8    pc           v1.0.0               修改原因
 */

public class Test {

    @org.junit.Test
    public void test1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
        GoodsCarMapper car = ac.getBean(GoodsCarMapper.class);

    }

    @org.junit.Test
    public void test2(){
        String token = System.currentTimeMillis() + new Random().nextInt(99999999) + "";
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] md5 = md.digest(token.getBytes());
            String s = new String(md5);
            System.out.println(s);
            BASE64Encoder encoder = new BASE64Encoder();
            String encode = encoder.encode(md5);
            System.out.println(encode);
            String ss = "";
            System.out.println(ss.length());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    @org.junit.Test
    public void useraddressTest(){
        //UserAddressServiceimpl sv = new UserAddressServiceimpl();
        //UserAddressBean addressBean = new UserAddressBean();
        //addressBean.setReciver("t");
        //addressBean.setAddress("t");
        //addressBean.setPhone("18754126324");
        //System.out.println(sv.insert(addressBean));

        GoodsCarServiceImpl service = new GoodsCarServiceImpl();
        service.insert(new GoodsCar());
    }

}
