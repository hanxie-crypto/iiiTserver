/**
 * 用户控制器
 * @type {[type]}
 */
const user = require('../controllers/user');

const user_root = {
    'get|/users/:userid': user.getUser,
}
module.exports = user_root;
