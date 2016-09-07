/**
 * mysql 连接工具
 * @type {[type]}
 */
const mysql = require('mysql');
const config = require('../config');
const pool = mysql.createPool(Object.assign(
    config.mysql, {
        typeCast: function(field, next) {
            if (field.type === 'FLOAT') {
                return (field.string());
            }
            return next();
        },
        queryFormat: function(query, values) {
            if (!values) return query;
            return query.replace(/\:(\w+)/g, function(txt, key) {
                if (values.hasOwnProperty(key)) {
                    if (key == 'ordercondation' || key === 'order') {
                        return escape(values[key]);
                    } else {
                        return this.escape(values[key]);
                    }
                }
                return txt;
            }.bind(this));
        },
    }));




/**
 * mysql 执行函数
 * @param  {[type]}   sql      [语句]
 * @param  {[type]}   params   [参数]
 * @param  {Function} callback [回调]
 * @return {[type]}            [无返回]
 */
exports.query = function(sql, params, callback) {

    return new Promise(function (resolve, reject) {
        pool.getConnection(function (err, con) {
            if (err) {
                if (con) {
                    con.release();
                }
                return reject(err);
            }

            con.query(sql, params, function (err,rows) {
                if (err) {
                    if (con) {
                        con.release();
                    }
                    return reject(err);
                }
                resolve(rows);
                con.release();
            });
        });
    });
   
}