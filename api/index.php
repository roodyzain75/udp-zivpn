<?php
$key=$_GET['key']??'';
if($key!=='SECRET_API_KEY') die('NO');
$cmd=$_GET['cmd']??'';
if(in_array($cmd,['add','del','list','renew'])){
  system("udp-$cmd");
}
echo "OK";
