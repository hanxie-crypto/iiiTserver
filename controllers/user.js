const User = new(require('../models/user'))();
const cache = require('../util/cache');
/**
 * 用户控制器
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getUser = function(req, res, next) {
    User.findAll({userid:req.params.userid})
    .then(data=>res.json(data))
    .catch(next);
}


