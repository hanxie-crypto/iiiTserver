/**
 * 用户验证模块
 * @type {[type]}
 */
const Base = require('./base');
const author_sql = require('./author_sql.json');



class Author extends Base{

    findUserByAccount(params) {
        return super.findOnlyOne(author_sql.findbyaccount,params);
    }
    registUser(params) {
        return super.insertOne(author_sql.adduser,params).then(result => {
             if(result.data.affectedRows === 0){
                return Promise.resolve({
                    code: 200,
                    err:  Base.getMessage().PHONEALREADYREGIST,
                })
            }else {
                return Promise.resolve(result);
            }
        });
    }
}

module.exports = Author;
