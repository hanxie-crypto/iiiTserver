/**
 * 技巧模块
 * @type {[type]}
 */
var Base = require('./base');
var skill_sql = require('./skill_sql.json');



class Skill extends Base {
    addSkillImg(params) {
        return super.insertOne(skill_sql.addskillimg, params).then(result => {
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
    findSkills(params) {
        return super.findWidthTotal(skill_sql.findskills, params);
    }
    addSkill(params) {
       return super.insertOne(skill_sql.addskill, params).then(result => {
            if (result.data.affectedRows === 0) {
                return Promise.resolve({
                    code: 200,
                    err: '',
                })
            } else {
                let id = result.data.insertId;
                result.data = {
                    skillid: id,
                };
                return Promise.resolve(result);
            }
        }); 
    }
    findSkillTypes(params) {
        return super.findAll(skill_sql.findskilltypes, params);
    }
}

module.exports = Skill;