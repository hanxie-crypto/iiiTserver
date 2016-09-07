const Course = new(require('../models/course'))();
const cache = require('../util/cache');
const pageCount = require('../config').pageCount;
/**
 * 课程控制器
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getCourses = function(req, res, next) {


    const params = req.body;
    let nowPage = params.page;
    if (nowPage) {
        nowPage = nowPage < 1 ? 1 : nowPage;
        params.start = (nowPage - 1) * pageCount;
    }
    params.count = pageCount;

    Course.findCourses(params)
        .then(data => res.json(data))
        .catch(next);
}

/**
 * 获得课程详情
 * @param  {[type]}   req  [description]
 * @param  {[type]}   res  [description]
 * @param  {Function} next [description]
 * @return {[type]}        [description]
 */
exports.getCourseDetail =  function(req, res, next) {


    const courseid = req.params.courseid;
  

    Course.findCourseDetail({courseid:courseid})
        .then(data => res.json(data))
        .catch(next);
}
