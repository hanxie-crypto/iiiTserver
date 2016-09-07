/**
 * 路由:{参数}
 * @type {Object}
 */
module.exports = {
    '/users/:userid': {
        userid: 'isNumeric',
    },
    '/login': {
        useraccount: 'isMobilePhone',
        vcode:'isNumeric',
    }
}