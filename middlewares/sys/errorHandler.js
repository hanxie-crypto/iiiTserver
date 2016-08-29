'use strict';


const logger = require('../../util/logger');

exports.notFound = (req, res) => {
    if (req.xhr) {
        res.status(404).json({
            code: 404,
            message: 'not found'
        })
    }
    logger.error(req.originalUrl, '404');
    res.render('error/404');
}

exports.serverError = (err, req, res, next) => {
    console.log(err);
    /*if (req.xhr) {
        res.status(500).json({
            code: 500,
            message: err.message,
            fields: err.fields||'',
        })
    } else {
        res.render('error/error', {
            message: err.message,
            fields: err.fields||'',
        });
    }
    if(res.headersSent){
        next(err);
    }*/
    res.status(500).json({
        code: 500,
        message: err.message,
        fields: err.fields || '',
    })
    logger.error(err);

}