package com.uj.ssm;
import org.apache.commons.codec.digest.DigestUtils;
public class MD5 {
    public static String md5(String text, String key) throws Exception {
        //加密后的字符串
        String encodeStr=DigestUtils.md5Hex(text + key);
        return encodeStr;
    }
}