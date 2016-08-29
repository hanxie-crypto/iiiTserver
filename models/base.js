/**
 * 基类
 * @type {[type]}
 */
const mysql = require('../db/mysqlDriver');

const SQL_TOTAL = 'select FOUND_ROWS() total FROM DUAL ';

const message = require('../message');

class Base {
    static getMessage() {
        return message;
    }
    deleteOne(sql, params) {
        return mysql.query(sql, params).then(_data => {
            let rep = {};
            rep.status = true;

            return Promise.resolve(rep);
        }).catch(err => {
            return Promise.reject(err);
        });
    }
    findOnlyOne(sql, params) {
        return mysql.query(sql, params).then(_data => {
            let rep = {};
            rep.status = true;
            rep.data = _data[0];
            return Promise.resolve(rep);
        }).catch(err => {
            return Promise.reject(err);
        });
    }
    findAll(sql, params) {
        return mysql.query(sql, params).then(_data => {
            let rep = {};
            rep.status = true;
            rep.data = _data;
            return Promise.resolve(rep);
        }).catch(err => {
            return Promise.reject(err);
        });
    }
    findWidthTotal(sql, params) {
        return mysql.query(`${sql};${SQL_TOTAL}`, params).then(_data => {
            let rep = {};
            rep.status = true;
            rep.data = _data[0];
            rep.total = _data[1][0].total;
            return Promise.resolve(rep);
        }).catch(err => {
            return Promise.reject(err);
        });

    }
    insertOne(sql, params) {
        return mysql.query(sql, params).then(_data => {
            let rep = {};
            rep.status = true;
            rep.data = _data;
            return Promise.resolve(rep);
        }).catch(err => {
            return Promise.reject(err);
        });
    }
}

module.exports = Base;