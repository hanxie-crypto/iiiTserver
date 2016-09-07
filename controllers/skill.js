const Skill = new(require('../models/skill'))();
const moment = require('moment');
const cache = require('../util/cache');
const config = require('../config');
const upqiniu = require('../util/upqiniu');
const pageCount = require('../config').pageCount;


/**
 * 技巧图片上传
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.upSkillImg = function(req, res, next) {
    let key = Date.now() + '-' + req.files[0].originalname;
   
    const localFile = req.files[0].path;
    upqiniu.uploadFile(key, localFile).then(data=>{
        let simg = {
            imgsrc: config.qiniuurl + data.key,
        }
        return Skill.addSkillImg(simg);

    }).then(result=>{
        res.json(result);
    }).catch(next);
}
/**
 * 查询技巧
 * @param  {[type]} req      [description]
 * @param  {[type]} res.next [description]
 * @return {[type]}          [description]
 */
exports.skillList = function(req,res,next) {

    const params = req.body;
    let nowPage = params.page;
    if (nowPage) {
        nowPage = nowPage < 1 ? 1 : nowPage;
        params.start = (nowPage - 1) * pageCount;
    }
    params.count = pageCount;

    Skill.findSkills(params)
        .then(data => res.json(data))
        .catch(next);
}



exports.addSkill = function(req, res, next) {
    const params = req.body;
    params.createtime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
    Skill.addSkill(params)
    .then(result=>{
        res.json(result);
    }).catch(next);
}

exports.findSkillTypes = function(req, res, next) {
    Skill.findSkillTypes({})
    .then(result=>{
        res.json(result);
    }).catch(next);
}