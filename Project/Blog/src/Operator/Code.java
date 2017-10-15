package Operator;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Code
{
    private static final String SHA_ALGORITHM = "SHA-256";

    /**
     * @param strForEncrypt 
     * @return 
     */
    private static byte[] getHash(String strForEncrypt) {
        MessageDigest digest = null ;
        try {
            digest = MessageDigest. getInstance(SHA_ALGORITHM);
        } catch (NoSuchAlgorithmException e1) {
            e1.printStackTrace();
        }
        assert digest != null;
        digest.reset();
        return digest.digest(strForEncrypt.getBytes());
    }

    /**
     * 
     * @param strForEncrypt 
     * @return 
     */
    public static String getSHA256(String strForEncrypt) {
        byte [] data = getHash(strForEncrypt);
        return String.format( "%0" + (data.length * 2) + "X", new BigInteger(1, data));
    }
}
