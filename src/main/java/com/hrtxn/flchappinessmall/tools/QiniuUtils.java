package com.hrtxn.flchappinessmall.tools;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.apache.log4j.Logger;

import java.io.ByteArrayInputStream;

public class QiniuUtils {
	private static Logger logger = Logger.getLogger(QiniuUtils.class);
	private static final String accessKey = "tvQEUQfRv62_QRDBULKhtZnG48KnMOtKJY9n01xs";
	private static final String secretKey = "NaxseML_gluEbLBqJeEuM-kmPtOyXljT9MGlpCF2";
	private static Configuration cfg = new Configuration(Zone.zone0());

	/**
	 * 上传文件到七牛云
	 * @param uploadBytes 数据源
	 * @param key 文件名
	 * @param bucket 空间名
	 * @param URL 外链
	 * @return
	 */
	public static String qiniu(byte[] uploadBytes, String key, String bucket,String URL) {
		UploadManager uploadManager = new UploadManager(cfg);
		ByteArrayInputStream byteInputStream = new ByteArrayInputStream(uploadBytes);
		Auth auth = Auth.create(accessKey, secretKey);
		String upToken = auth.uploadToken(bucket);
		try {
			Response response = uploadManager.put(byteInputStream, key,upToken, null, null);
			DefaultPutRet putRet = new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
			System.out.println(putRet.key + "--" + putRet.hash);
			return URL + key;
		} catch (QiniuException ex) {
			Response r = ex.response;
			logger.error("七牛云上传文件出错！" + r.toString());
			return null;
		}
	}

    /**
     * 修改七牛云文件（有问题--可先删除，再执行上传操作）
     * @param bucket
     * @param oldkey
     * @param key
     * @param URL
     * @return
     */
	public static String updateqiniu(String bucket,String oldkey,String key,String URL) {
		Auth auth = Auth.create(accessKey, secretKey);
		BucketManager bucketManager = new BucketManager(auth, cfg);
		try {
		    bucketManager.move(bucket, oldkey, bucket, key);
		    return URL+key;
		} catch (QiniuException ex) {
		    //如果遇到异常，说明移动失败
		    logger.error("修改七牛云文件出错！" + ex.response.toString());
		    return null;
		}
	}

    /**
     * 删除七牛云文件
     * @param bucket
     * @param key
     * @return
     */
	public static boolean deleteqiniu(String bucket,String key) {
		Auth auth = Auth.create(accessKey, secretKey);
		BucketManager bucketManager = new BucketManager(auth, cfg);
		try {
			bucketManager.delete(bucket, key);
			//bucketManager.deleteAfterDays(bucket, key, 0);
			return true;
		} catch (QiniuException ex) {
		    //如果遇到异常，说明移动失败
		    logger.error("删除七牛云文件出错！" + ex.response.toString());
		    return false;
		}
	}
}
