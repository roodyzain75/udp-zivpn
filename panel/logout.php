<?php
session_start();

/* hapus semua data session */
$_SESSION = [];
session_destroy();

/* kembali ke halaman login */
header("Location: login.php");
exit;

