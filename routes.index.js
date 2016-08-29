/**
 * 统一包含路由
 */

const express = require('express');
const router = express.Router();
const fs = require('fs');
const files = fs.readdirSync('./routes');
const middlewares = require('./middlewares');
const validator = require('./middlewares/sys/validator');
const routesall = {};
const logger = require('./util/logger');

for (let i = 0; i < files.length; i++) {
    Object.assign(routesall, require('./routes/' + files[i]));
}

for (let k in routesall) {
    let root_k = k.split('|');
    if (root_k.length > 2) {
        let [methodtype, methorname, ...middlewarenames] = root_k;

        if (typeof middlewarenames !== 'undefined') {
            const middlewarearr = [];
            for (let i = 0; i < middlewarenames.length; i++) {
                let midmethord = middlewares[middlewarenames[i]];
                if (typeof midmethord === 'function') {
                    middlewarearr.push(midmethord);
                }
            }
            router[methodtype](methorname,validator,...middlewarearr, routesall[k]);//所有中间件前置验证参数的中间件
        }
    }
    if (root_k.length === 2) {
        router[root_k[0]](root_k[1],validator, routesall[k]); //所有中间件前置验证参数的中间件
    }
    if (root_k.length < 2) {
        logger.error('配置错误')
    }

}


module.exports = router;