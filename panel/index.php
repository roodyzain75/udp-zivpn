<?php
session_start();
if(!isset($_SESSION['login'])) header("Location: login.php");
$u=file('/etc/udp-zivpn/users.db');
echo "<h2>UDP ZIVPN PRO++</h2><pre>";
foreach($u as $l) echo $l;
echo "</pre>";
