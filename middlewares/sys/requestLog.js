const logger = require('../../util/logger');

module.exports = function(req, res, next) {

  if (exports.ignore.test(req.url)) {
    next();
    return;
  }

  const t = new Date();
  logger.verbose('started' + t.toISOString() + req.method + req.url + req.ip);
  logger.verbose('params' + req.query.toString() + req.params.toString() + req.body.toString());
  res.on('finish', function() {
    const duration = ((new Date()) - t);

    logger.verbose('completed' + res.statusCode + '(' + duration + 'ms)');
  });

  next();
};

exports.ignore = /^\/(public|agent)/;