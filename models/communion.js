/**
 * 交流模块
 * @type {[type]}
 */
var Base = require('./base');
var communion_sql = require('./communion_sql.json');



class Communions extends Base{

    findFirstCommunions(params) {
        return super.findWidthTotal(communion_sql.findfirstcommunions,params);
    }
    findSecondCommunions(params) {
        return super.findWidthTotal(communion_sql.findsecondcommunions,params);
    }
    findCommunionDetail(params) {
        return super.findOnlyOne(communion_sql.findcommunionbyid,params);
    }
    checkCommunionCollect(params) {
        return super.findOnlyOne(communion_sql.checkcommunioncollect,params);  
    }

    addCommunionImg(params) {
        return super.insertOne(communion_sql.addcommunionimg, params).then(result => {
            if (result.data.affectedRows === 0) {
                return Promise.resolve({
                    code: 200,
                    err: '',
                })
            } else {
                let id = result.data.insertId;
                result.data = {
                    imgsrc: params.imgsrc,
                    imgid: id,
                };
                return Promise.resolve(result);
            }
        });
    }
    addCommunion(params) {
        return super.insertOne(communion_sql.addcommunion, params).then(result => {
            if (result.data.affectedRows === 0) {
                return Promise.resolve({
                    code: 200,
                    err: '',
                })
            } else {
                let id = result.data.insertId;
                result.data = {
                    imgsrc: params.imgsrc,
                    imgid: id,
                };
                return Promise.resolve(result);
            }
        });
    }
    findCommunionTypes(params) {
        return super.findAll(communion_sql.findcommuniontypes, params);
    }
    addCommunionPraise(params) {
       return super.insertOne(communion_sql.addcommunionpraise, params).then(result => {
            if (result.data.affectedRows === 0) {
                return Promise.resolve({
                    code: 200,
                    err: '',
                })
            } else {
                let id = result.data.insertId;
                result.data = {
                    id: id,
                };
                return Promise.resolve(result);
            }
        });
    }
    cancelCommunionPraise(params) {
        return super.deleteOne(communion_sql.cancelcommunionpraise,params);
    }
    addCommunionCollect(params) {
        return super.insertOne(communion_sql.addcommunioncollect, params).then(result => {
            if (result.data.affectedRows === 0) {
                return Promise.resolve({
                    code: 200,
                    err: '',
                })
            } else {
                let id = result.data.insertId;
                result.data = {
                    id: id,
                };
                return Promise.resolve(result);
            }
        });
    }
    cancelCommunionCollect(params) {
        return super.deleteOne(communion_sql.cancelcommunioncollect,params);
    }
    addCommunionChild(params) {
        return super.insertOne(communion_sql.addcommunionchild, params).then(result => {
            if (result.data.affectedRows === 0) {
                return Promise.resolve({
                    code: 200,
                    err: '',
                })
            } else {
                let id = result.data.insertId;
                result.data = {
                    id: id,
                };
                return Promise.resolve(result);
            }
        });
    }
}

module.exports = Communions;
