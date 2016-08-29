/**
 * 微信工具集
 */
var md5 = require('MD5');
const config = require('../config');
const superagent = require('superagent');
const xmlreader = require('xmlreader');
const createNonceStr = function() {
  return Math.random().toString(36).substr(2, 15);
};

const createTimestamp = function() {
  return parseInt(new Date().getTime() / 1000) + '';
};

const raw = function(args) {
  let keys = Object.keys(args);
  keys = keys.sort()
  let newArgs = {};
  keys.forEach(function(key) {
    newArgs[key] = args[key];
  });

  let string = '';
  for (let k in newArgs) {
    string += '&' + k + '=' + newArgs[k];
  }
  string = string.substr(1);
  return string;
};

/**
 * @md5 签名算法
 *
 *
 * @returns
 */
exports.signMd5 = function(params, key) {
  params.nonce_str = createNonceStr();
  let string = raw(params);
  string = string + '&key=' + key;
  let sign = md5(string).toUpperCase();
  params.sign = sign;
  return params;
}


/**
 * 获得预支付编号
 * @param  {[type]}   code     [微信返回的code]
 * @param  {Function} callback [执行回调函数]
 * @return {[type]}            [description]
 */
exports.getpreorder = function(senddata) {

  return new Promise(function(resolve, reject) {
    return superagent.post(config.commonPayUrl)
      .timeout(10000)
      .set('Content-Type', 'text/xml')
      .send(senddata)
      .end(function(err, response) {
        if (err) {
          console.log('预订单错误', err);
          reject(err);
        } else {
          return xmlreader.read(response.text, function(errors, xmlresponse) {
            if (null !== errors) {
              reject(err);
            }
            if (xmlresponse.xml.prepay_id) {
              var payobj = {};
              payobj.timeStamp = createTimestamp();
              payobj.package = 'prepay_id=' + xmlresponse.xml.prepay_id.text();
              payobj.appId = config.AppID;
              payobj.signType = 'MD5';
              payobj = signMd5(payobj, config.KEY);
              resolve(payobj);
            } else {
              let message = xmlresponse.xml.return_msg.text();
              reject(new Error(message));
            }
          });
        }
      });
  })
}