'use strict';
const redis = require('./redis');
const logger = require('./logger');



const get = function(key) {
  return redis.get(key);
};

exports.get = get;

const set = function(key, value, time) {
  if(!time) {
    return redis.set(key, value).catch(err=> logger.error('cache set error',err));
  }else {
    return redis.set(key, value, 'EX', time).catch(err=> logger.error('cache ex set error',err));
  }

};

exports.set = set;