/**
 * 用户模块
 * @type {[type]}
 */
var Base = require('./base');
var user_sql = require('./user_sql.json');



class User extends Base{
    findAll(params) {
        return super.findWidthTotal(user_sql.findbyid,params);
    }
    findUserCourses(params) {

    }
    findPubSkills(params) {
        return super.findWidthTotal(user_sql.findpubskills,params);
    }
    findCollectCourses(params) {
        return super.findWidthTotal(user_sql.findcollectcourses,params);
    }
    findUserCommunions(params) {
        return super.findWidthTotal(user_sql.findusercommunion,params);
    }
    findUserAnswers(params) {

    }
    findUserQuestions(params) {

    }
    findUserMessages(params) {

    }
}

module.exports = User;
