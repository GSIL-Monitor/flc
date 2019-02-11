
/**
 * 验证是否是正整数
 */
function isPositiveInteger(integer) {
    var reg = /^[0-9]\d*$/;
    return reg.test(integer);
}

/**
 * 验证电话号码格式
 */
// function isTel(tel) {
// //     var reg = /^(13[0-9]|14[0-9]|15[0-9]|16[0-9]|17[0-9]|18[0-9]|19[0-9])\d{8}$/;
// //     return reg.test(tel);
// // }
function isTel(tel) {
    var reg = /^(1)\d{10}$/;
    return reg.test(tel);
}

/**
 * 验证身份证号码格式
 */
function isIdentityNum(identityNum) {
    var reg = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
    return reg.test(identityNum);
}

/**
 * 验证社会组织机构代码格式
 */
function isSocialNum(socialNum) {
    var reg = /^[a-zA-Z0-9]{17}-[a-zA-Z0-9]$/;
    return reg.test(socialNum);
}

/**
 * 是否含有中文（也包含日文和韩文）
 */
function isChineseChar(str) {
    var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
    return reg.test(str);
}

/**
 * 判断小数点后是否包含两位数
 * @param str
 * @returns {*|boolean}
 */
function isDecimalsContainTwo(str){
    var reg= /^(-?\d+)(\.\d{1,2})?$/
    return reg.test(str)
}