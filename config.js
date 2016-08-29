'use strict';

let config = {};

const proconfig = {
    privatekey: 'ssss',
    mysql: {
        host: 'localhost',
        port: '3306',
        database: 'ihb',
        charset: 'utf8_general_ci',
        user: 'youraccount',
        password: 'yourpassword',
        multipleStatements: true,
    },
    listenport: 3000,
    redis_db: 0,
    redis_host: '127.0.0.1',
    redis_port: 6379,
    session_secret: 'yourxxx',
    loggers: {
        infoFile: {
            name: 'info',
            level: 'info',
            filename: 'logs/info.log',
        },
        errorFile: {
            name: 'error',
            level: 'error',
            filename: 'logs/error.log',
        },
        accessFile: {
            name: 'verbose',
            level: 'verbose',
            filename: 'logs/access.log',
        },
    },
    pageCount: 20,
    validator: true,
    qiniu: {
        ACCESS_KEY:'yourxxx',
        SECRET_KEY: 'yourxxx',
    },
    AppID: 'yourxxx',
    AppSecret: 'yourxxx',
    MchId: 'yourxxx',
    wechatAccesTokenUrl: 'https://api.weixin.qq.com/cgi-bin/token',
    wechatJsapiTicket: 'https://api.weixin.qq.com/cgi-bin/ticket/getticket',
    userAccessToken: 'https://api.weixin.qq.com/sns/oauth2/access_token',
    commonPayUrl: 'https://api.mch.weixin.qq.com/pay/unifiedorder',
    getUserInfo: 'https://api.weixin.qq.com/sns/userinfo',

    KEY: 'yourxxx',

};


const devconfig = {
    privatekey: 'ssss',
    mysql: {
        host: 'localhost',
        port: '3306',
        database: 'ihb',
        charset: 'utf8_general_ci',
        user: 'yourxxx',
        password: 'yourxxx',
        multipleStatements: true,
    },
    listenport: 3000,
    redis_db: 0,
    redis_host: '127.0.0.1',
    redis_port: 6379,
    session_secret: 'ihb',
    loggers: {
        infoFile: {
            name: 'info',
            level: 'info',
            filename: 'logs/info.log',
        },
        errorFile: {
            name: 'error',
            level: 'error',
            filename: 'logs/error.log',
        },
        accessFile: {
            name: 'verbose',
            level: 'verbose',
            filename: 'logs/access.log',
        }
    },
    pageCount: 10,
    validator: true,
    qiniu: {
        ACCESS_KEY:'yourxxx',
        SECRET_KEY: 'yourxxx',
    },
    AppID: 'yourxxx',
    AppSecret: 'yourxxx',
    MchId: 'yourxxx',
    wechatAccesTokenUrl: 'https://api.weixin.qq.com/cgi-bin/token',
    wechatJsapiTicket: 'https://api.weixin.qq.com/cgi-bin/ticket/getticket',
    userAccessToken: 'https://api.weixin.qq.com/sns/oauth2/access_token',
    commonPayUrl: 'https://api.mch.weixin.qq.com/pay/unifiedorder',
    getUserInfo: 'https://api.weixin.qq.com/sns/userinfo',
    KEY: 'PUTAOYUNABCDEFGHIJKLMNOPQRSTUVW1',
    PAY_SUCCESS_URL: 'http://wap.putaoyun.com/wap/paysuccess',
}
if (process.env.NODE_ENV !== 'production') {
    config = devconfig;
} else {
    config = proconfig;
}
config.qiniuurl = 'yourxxx'; //七牛云的基础地址，用来返回上传后生成的文件地址
module.exports = config;