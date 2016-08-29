/**
 * 交流路由
 * @type {[type]}
 */
const communion = require('../controllers/communion');

const communion_route = {
    'post|/communionfirstlist': communion.getFirstCommunions,
    'post|/communionsecondlist': communion.getSecondCommunions,
    'get|/communiondetail/:communionid': communion.getCommunionDetail,
    'post|/upcommunionimg|fileup':communion.upCommunionImg,
    'post|/addcommunion': communion.addCommunion,
    'post|/addcommunionpraise':communion.addCommunionPraise,
    'post|/cancelcommunionpraise':communion.cancelCommunionPraise,
    'post|/addcommunioncollect':communion.addCommunionCollect,
    'post|/cancelcommunionCollect':communion.cancelCommunionCollect,
    'post|/addcommunionchild':communion.addCommunionChild,
    'get|/findcommuniontypes':communion.findCommunionTypes,
    'post|/checkcommunioncollect': communion.checkCommunionCollect,
}
module.exports = communion_route;
