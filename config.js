'use strict';

let config = {};

const proconfig = {
    privatekey: 'ssss',
    mysql: {
        host: '115.28.8.74',
        port: '3306',
        database: 'ihb',
        charset: 'utf8_general_ci',
        user: 'root',
        password: 'wq123',
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
        },
    },
    pageCount: 20,
    validator: true,
    qiniu: {
        ACCESS_KEY:'9Av-wBLloTzjXb0DN7B2BEbilEgMtC9Gfq0fhfZ6',
        SECRET_KEY: 'JrKY-Lnb7PDGvdzH6ALY6lb7pRMJkeoztxcCytWR',
    },
    AppID: 'wx6152431428fe7bdd',
    //AppSecret: '02d1d1ca9778bd6dae98a9023c62ee9d',
    AppSecret: '8dd155189431d23d9dfc66689c9369f0',
    //MchId: '1220364301',
    MchId: '1277016001',
    wechatAccesTokenUrl: 'https://api.weixin.qq.com/cgi-bin/token',
    wechatJsapiTicket: 'https://api.weixin.qq.com/cgi-bin/ticket/getticket',
    userAccessToken: 'https://api.weixin.qq.com/sns/oauth2/access_token',
    commonPayUrl: 'https://api.mch.weixin.qq.com/pay/unifiedorder',
    getUserInfo: 'https://api.weixin.qq.com/sns/userinfo',
    //KEY: 'PUTAOYUNABCDEFGHIJKLMNOPQRSTUVWX',
    KEY: 'PUTAOYUNABCDEFGHIJKLMNOPQRSTUVW1',
    PAY_SUCCESS_URL: 'http://wap.putaoyun.com/wap/paysuccess',
    SERVER_IP: '114.80.154.68',
};


const devconfig = {
    privatekey: 'ssss',
    mysql: {
        host: '115.28.8.74',
        port: '3306',
        database: 'ihb',
        charset: 'utf8_general_ci',
        user: 'root',
        password: 'wq123',
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
        ACCESS_KEY:'9Av-wBLloTzjXb0DN7B2BEbilEgMtC9Gfq0fhfZ6',
        SECRET_KEY: 'JrKY-Lnb7PDGvdzH6ALY6lb7pRMJkeoztxcCytWR',
    },
    AppID: 'wx6152431428fe7bdd',
    AppSecret: '8dd155189431d23d9dfc66689c9369f0',
    MchId: '1277016001',
    wechatAccesTokenUrl: 'https://api.weixin.qq.com/cgi-bin/token',
    wechatJsapiTicket: 'https://api.weixin.qq.com/cgi-bin/ticket/getticket',
    userAccessToken: 'https://api.weixin.qq.com/sns/oauth2/access_token',
    commonPayUrl: 'https://api.mch.weixin.qq.com/pay/unifiedorder',
    getUserInfo: 'https://api.weixin.qq.com/sns/userinfo',
    //KEY: 'PUTAOYUNABCDEFGHIJKLMNOPQRSTUVWX',
    KEY: 'PUTAOYUNABCDEFGHIJKLMNOPQRSTUVW1',
    PAY_SUCCESS_URL: 'http://wap.putaoyun.com/wap/paysuccess',
    SERVER_IP: '114.80.154.68',
}
if (process.env.NODE_ENV !== 'production') {
    config = devconfig;
} else {
    config = proconfig;
}
config.qiniuurl = 'http://7xuwbb.com1.z0.glb.clouddn.com/';
module.exports = config;