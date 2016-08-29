/**
 * 路由配置
 * 规则请求方式|路由|中间件1|中间件2|
 */

const skill = require('../controllers/skill');
const index = {
    'post|/upskillimg|fileup': skill.upSkillImg,
    'post|/skill': skill.skillList,
    'post|/addskill':skill.addSkill,
    'get|/skilltypes':skill.findSkillTypes,
}
module.exports = index;