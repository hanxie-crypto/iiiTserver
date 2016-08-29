
const wechat = require('../util/wechat');
const config = require('../config');


function getAppPayData(params) {
    return `<xml><appid>${params.appid}</appid><attach>${params.attach}</attach><body><![CDATA[${params.body}]]></body><mch_id>${params.mch_id}</mch_id><nonce_str>${params.nonce_str}</nonce_str><notify_url>${params.notify_url}</notify_url><out_trade_no>${params.out_trade_no}</out_trade_no><spbill_create_ip>${params.spbill_create_ip}</spbill_create_ip><total_fee>${params.total_fee}</total_fee><trade_type>APP</trade_type><sign><![CDATA[${params.sign}]]></sign></xml>`;
}
function createNonceStr() {
  return Math.random().toString(36).substr(2, 15);
};

function createTimestamp() {
  return parseInt(new Date().getTime() / 1000) + '';
};

exports.appGetPreorder = function(req, res, next) {
    
    let params = req.body;
    params = wechat.signMd5(params, config.KEY);
    params.appid = config.AppID;
    params.mch_id = config.MchId;
    params.nonce_str = createNonceStr();
    params.notify_url = 'http://www.baidu.com';
    params.out_trade_no = createTimestamp();
    params.spbill_create_ip = config.SERVER_IP;
    let senddata = getAppPayData(params);
    wechat.getpreorder(senddata).then(data=>{
        res.json(data);
    }).catch(err=>{
        console.log(err);
        next(err);
    });
}


