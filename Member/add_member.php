<?php
//檢查有沒有名稱是"LoginOK"的Cookie，也檢查值是不是OK，沒有就直接把使用者帶到登入首頁
if (!isset($_COOKIE["LoginOK"]) || $_COOKIE["LoginOK"] !== "OK") {
    echo "<h1>這是一個秘密網頁，你不是會員，不能進來</h1>";
    echo "<a href='../index.php'>回到登入首頁！</a>";

    exit;
} else {
    require("../functions.php"); // require() 引用別的PHP檔案

    //檢查有沒有來自edit_member.php的POST，如果有，才更新使用者資料
    if (isset($_POST["Account"]) && isset($_POST["Password"]) && isset($_POST["Name"])) {
        if ($_POST["Account"] != "" && $_POST["Password"] != "" && $_POST["Name"] != "") {
            // 更新使用者資料
            $InsertResult = Add_Member(
                $_POST["Account"],
                $_POST["Password"],
                $_POST["Name"],
                isset($_POST["Admin"]) ? $_POST["Admin"] : ""
            );

            if ($InsertResult == true)
                echo "{$_POST["Name"]}帳號新增成功！";
            else
                echo "{$_POST["Name"]}帳號新增失敗！";
            
            echo "五秒鐘回到管理者頁面";
            header("refresh:5; url=admin.php");
            exit;
        }
    }
   
}
?>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增使用者</title>
</head>

<body>
    <h1>新增會員，請輸入會員資料</h1>
    <form name="login" method="post" action="add_member.php">
        帳號: <input type="text" name="Account" size="15" value="" /><br />
        密碼: <input type="text" name="Password" size="15" value="" /><br />
        姓名: <input type="text" name="Name" size="15" value="" /><br />
        是否為管理員：<input type="checkbox" name="Admin" value="Y" /><br />
        <input type="submit" value="新增會員" />
    </form>
</body>

</html>