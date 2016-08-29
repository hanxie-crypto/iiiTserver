/**
 * 课程模块
 * @type {[type]}
 */
var Base = require('./base');
var course_sql = require('./course_sql.json');



class findCourses extends Base{
    findCourses(params) {
        return super.findWidthTotal(course_sql.findcourses,params);
    }
    findCourseDetail(params) {
        return super.findOnlyOne(course_sql.findcoursebyid,params);
    }
}

module.exports = findCourses;
