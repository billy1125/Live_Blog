<?php
setcookie("LoginOK", "", time() - 3600); //將Cookie移除的方式是讓它「過期」，所以時間設定為現在時間的一小時前
session_start();  // 啟用Session
session_destroy(); //將SESSION變數整個清除掉

echo "你已經登出成功，5秒鐘後回到登入畫面";
header("refresh:5; url=index.php");