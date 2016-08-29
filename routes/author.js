/**
 * 账号控制器
 * @type {[type]}
 */
const author = require('../controllers/author');

const author_route = {
    'post|/login': author.login,
    'post|/getValidateCode':author.getValidateCode,
    'post|/regist': author.regist,
}
module.exports = author_route;
