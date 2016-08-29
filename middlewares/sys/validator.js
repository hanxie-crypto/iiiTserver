const validator = require('validator');
const validatorconfig = require('../../validatorconfig');


module.exports = function(req, res, next) {
    const validateobj = validatorconfig[req.route.path];
    if (typeof validateobj !== 'undefined') {
        const params = Object.assign({}, req.params, req.body, req.query);
        for (let key in params) {
            let validateFuncName = validateobj[key]; //like isEmail
            if (validateFuncName) {
                let value = params[key];
                let validateFunc = validator[validateFuncName]; //验证函数
                let isvalidate = true;
                isvalidate = validateFunc(value);
                if(validateFuncName === 'isMobilePhone') {
                    isvalidate = validateFunc(value,'zh-CN');
                } 
                if (!isvalidate) {
                    return next(new Error(`param ${key} is not validate the rule is '${validateFuncName}'`));
                }
            }
        }
    }

    next();
};