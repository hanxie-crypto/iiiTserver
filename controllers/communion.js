const Communion = new(require('../models/communion'))();
const moment = require('moment');
const cache = require('../util/cache');
const pageCount = require('../config').pageCount;
const config = require('../config');
const upqiniu = require('../util/upqiniu');
/**
 * 交流控制器
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getFirstCommunions = function(req, res, next) {


    const params = req.body;
    let nowPage = params.page;
    if (nowPage) {
        nowPage = nowPage < 1 ? 1 : nowPage;
        params.start = (nowPage - 1) * pageCount;
    }
    params.count = pageCount;

    Communion.findFirstCommunions(params)
        .then(data => res.json(data))
        .catch(next);
}

/**
 * 子集交流
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getSecondCommunions = function(req, res, next) {


    const params = req.body;
    let nowPage = params.page;
    if (nowPage) {
        nowPage = nowPage < 1 ? 1 : nowPage;
        params.start = (nowPage - 1) * pageCount;
    }
    params.count = pageCount;

    Communion.findSecondCommunions(params)
        .then(data => res.json(data))
        .catch(next);
}
/**
 * 获得交流详情
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getCommunionDetail =  function(req, res, next) {


    const communionid = req.params.communionid;
  

    Communion.findCommunionDetail({communionid:communionid})
        .then(data => res.json(data))
        .catch(next);
}
/**
 * 交流图片上传
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.upCommunionImg = function(req, res, next) {
    let key = Date.now() + '-' + req.files[0].originalname;
   
    const localFile = req.files[0].path;
    upqiniu.uploadFile(key, localFile).then(data=>{
        let simg = {
            imgsrc: config.qiniuurl + data.key,
        }
        return Communion.addCommunionImg(simg);

    }).then(result=>{
        res.json(result);
    }).catch(next);
}
/**
 * 增加交流
 * @param {[type]}   req  [description]
 * @param {[type]}   res  [description]
 * @param {Function} next [description]
 */
exports.addCommunion = function(req, res, next) {
    const params = req.body;
    params.createtime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
    Communion.addCommunion(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}
/**
 * 交流类型查询
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.findCommunionTypes =  function(req, res, next) {
    Communion.findCommunionTypes({})
    .then(result=>{
        res.json(result);
    }).catch(next);
}

exports.addCommunionPraise = function(req, res, next) {
    const params = req.body;
    params.createtime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
    Communion.addCommunionPraise(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}

exports.cancelCommunionPraise = function(req, res, next) {
    const params = req.body;
    Communion.cancelCommunionPraise(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}
exports.addCommunionCollect = function(req, res, next) {
    const params = req.body;
    params.createtime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
    Communion.addCommunionCollect(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}

exports.cancelCommunionCollect = function(req, res, next) {
    const params = req.body;
    Communion.cancelCommunionCollect(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}

exports.addCommunionChild = function(req, res, next) {
    const params = req.body;
    params.createtime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
    Communion.addCommunionChild(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}

exports.checkCommunionCollect = function(req, res, next) {
    const params = req.body;
 
    Communion.checkCommunionCollect(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}