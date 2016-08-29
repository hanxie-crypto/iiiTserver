/**
 * 微信
 * @type {[type]}
 */
const wechat = require('../controllers/wechat');

const wechat_root = {
    'post|/appgetpreorder': wechat.appGetPreorder,
}
module.exports = wechat_root;
