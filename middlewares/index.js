/**
 * 用户可配置的中间件
 */

const jwt = require('jsonwebtoken');
const config = require('../config');
const multer = require('multer');
const path = require('path');
const basepath = path.join(__dirname, '..', 'imgupload');
const storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, basepath)
  },
  filename: function(req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname)
  }
})
const upload = multer({
  storage: storage
});


exports.checkapi = function(req, res, next) {
  let token = req.body.token || req.query.token || req.headers['x-access-token'];
  if (token) {
    jwt.verify(token, config.privatekey, function(err, decoded) {
      if (err) {
        return res.json({
          success: false,
          message: 'token信息错误.'
        });
      } else {
        next(decoded);
      }
    });
  } else {
    return res.status(403).send({
      success: false,
      message: '没有提供token！',
    });
  }
}

exports.author = function(req, res, next) {
  if (!req.session.user) {
    return res.status(403).json({
      info: 'faile'
    });
  }
  next();
}

exports.test = function(req, res, next) {

  next();
}

exports.fileup = upload.array('file', 12);