const Author = new(require('../models/author'))();
const cache = require('../util/cache');
const md5 = require('md5');
const moment = require('moment');
const message = require('../message');
/**
 * 用户登录
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.login = function(req, res, next) {
    const params = req.body;

    cache.get(`vcode${params.useraccount}`)
        .then(result => {
            if (params.vcode !== result) {
                return Promise.resolve({
                    novalidatecode: true
                });
            }

            return Author.findUserByAccount(params);
        })
        .then(result => {
            if (result.novalidatecode === true) {
                return res.json({
                    status: false,
                    code: 201,
                    err: message.VALIDATECODEERR
                })
            }
            if (result.data.userpwd !== md5(params.userpwd)) {
                return res.json({
                    code: 202,
                    status: false,
                    err: message.PWDERR
                })
            }
            delete result.data.userpwd; //清掉密码项
            res.json(result);
        })
        .catch(next);


}
/**
 * 注册
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.regist = function(req, res, next) {
    const params = req.body;

    cache.get(`vcode${params.useraccount}`)
        .then(result => {
            if (params.vcode !== result) {
                return Promise.resolve({
                    novalidatecode: true
                });
            }

            return Author.registUser(params);
        })
        .then(result => {
            if (result.novalidatecode === true) {
                return res.json({
                    code: 200,
                    err: message.VALIDATECODEERR
                })
            }
           
            res.json(result);
        })
        .catch(next);
}
/**
 * 获取验证码
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getValidateCode = function(req, res, next) {
    const params = req.body;
    const validatecode = '1234';
    cache.set(`vcode${params.useraccount}`, validatecode, 60*6) //单位s 
        .then(result => {
            res.json({
                code: 200,
                validatecode: validatecode
            });
        })
        .catch(next);

}