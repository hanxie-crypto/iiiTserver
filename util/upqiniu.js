const config = require("../config");
const qiniu = require("qiniu");
const bucket = 'wqserver';
const qiuniuurl = 'http://7xuwbb.com1.z0.glb.clouddn.com/';
qiniu.conf.ACCESS_KEY = config.qiniu.ACCESS_KEY;
qiniu.conf.SECRET_KEY = config.qiniu.SECRET_KEY;


//构建上传策略函数
function uptoken(bucket, key) {
    var putPolicy = new qiniu.rs.PutPolicy(bucket + ":" + key);
    return putPolicy.token();
}




exports.uploadFile=function (key, localFile) {
    let token = uptoken(bucket, key);
    const extra = new qiniu.io.PutExtra();
    return new Promise(function(resolve, reject) {
        qiniu.io.putFile(token, key, localFile, extra, function(err, ret) {
            if (!err) {
                // 上传成功， 处理返回值
                resolve(ret)
            } else {
                // 上传失败， 处理返回代码
                reject(err);
            }
         });
    });
 }