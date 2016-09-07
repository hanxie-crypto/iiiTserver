const express = require('express');
const path = require('path');
//const favicon = require('serve-favicon');
const requestLog = require('./middlewares/sys/requestLog');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const routes = require('./routes.index');
const session = require('express-session');
const RedisStore = require('connect-redis')(session);
const config = require('./config'); 

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
//app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
//app.use(express.static(path.join(__dirname, 'public')));
app.use('/static', express.static('public'));
app.use(session({
    secret: config.session_secret,
    store: new RedisStore({
        port: config.redis_port,
        host: config.redis_host
    }),
    resave: true,
    saveUninitialized: true
}));

app.use(requestLog); //增加访问日志;
app.use('/', routes);
const logger = require('./util/logger');
try {
  const errorHandler = require('./middlewares/sys/errorHandler');
  app.use(errorHandler.notFound);
  app.use(errorHandler.serverError);
} catch(err) {
  logger.error(err);
}




process.env.PORT = config.listenport;

module.exports = app;
