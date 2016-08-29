/**
 * 课程路由
 * @type {[type]}
 */
const course = require('../controllers/course');

const course_route = {
    'post|/courselist': course.getCourses,
    'get|/coursedetail/:courseid': course.getCourseDetail,
}
module.exports = course_route;
