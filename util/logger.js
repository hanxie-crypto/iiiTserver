'use strict';


const winston = require('winston');
const config = require('../config');
const FileTransport = require('winston-daily-rotate-file');



let logger = new(winston.Logger)({

    transports: [
        new(FileTransport)(config.loggers.infoFile),
        new(FileTransport)(config.loggers.errorFile),
        new(FileTransport)(config.loggers.accessFile),
    ],
    exitOnError: false,
});

/*if (process.env.NODE_ENV !== 'production') {
    logger = new(winston.Logger)({

        transports: [
            new(winston.transports.Console)(),
        ],
        exitOnError: false,
    });
}*/


module.exports = logger;