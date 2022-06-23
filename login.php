<?php
header("Content-Type: application/json; charset=UTF-8");
session_start();  // 啟用Session

$AccountCheckResult = array("Result" => false, "Admin" => false);

if (isset($_COOKIE["LoginOK"]) && $_COOKIE["LoginOK"] == "OK") {
    $AccountCheckResult["Result"] = true;
    if (isset($_SESSION["admin"]) && $_SESSION["admin"] == "Y")
        $AccountCheckResult["Admin"] = true;
}
if (isset($_POST["Account"]) && isset($_POST["Password"])) {
    require("functions.php"); // require() 引用別的PHP檔案

    $Account = $_POST["Account"];                                       // 使用者帳號
    $Password = $_POST["Password"];                                     // 密碼
    $RemeberMe = isset($_POST["RemeberMe"]) ? $_POST["RemeberMe"] : ""; // 記住我
    $Result = Account_Check($Account, $Password);           // 帳號密碼驗證

    if ($Account == $Result["account"] && $Password == $Result["password"]) {
        $_SESSION["id"] = $Result["id"]; // id
        $_SESSION["account"] = $Result["account"]; // 帳號
        $_SESSION["password"] = $Result["password"]; // 密碼
        $_SESSION["name"] = $Result["name"]; // 姓名
        $_SESSION["admin"] = $Result["admin"]; // 使用權限設定，如果是Y代表為管理者帳號

        // 依據有沒有勾選記住我？來設定LoginOK的Cookie的期限
        $date = ($RemeberMe == "YesRememberMe") ? strtotime("+10 days", time()) : strtotime("+1 minutes", time());

        setcookie("LoginOK", "OK", $date); // 建立LoginOK的Cookie，用來辨識使用者是否已經成功驗證帳號密碼

        $AccountCheckResult["Result"] = true;
        if ($Result["admin"] == "Y")
            $AccountCheckResult["Admin"] = true;
    }
}

echo json_encode($AccountCheckResult);
