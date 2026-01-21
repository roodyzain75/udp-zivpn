<?php
session_start();
if($_POST['u']=='admin' && $_POST['p']=='admin'){
 $_SESSION['login']=1; header("Location: index.php");
}
?>
<form method=post>
<input name=u><input name=p type=password>
<button>Login</button>
</form>

