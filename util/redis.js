'use strict';

const config = require('../config');
const Redis = require('ioredis');

const client = new Redis({
  port: config.redis_port,
  host: config.redis_host,
  db: config.redis_db,
  retryStrategy: function (times) {
    const delay = Math.min(times * 2, 2000);
    return delay;
  }
});

exports = module.exports = client;