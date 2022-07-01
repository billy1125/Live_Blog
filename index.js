var currentPage = 1
const TotalPage = 9

// 登入表單顯示或隱藏處理
$.ajax({
    url: "login.php",
    type: "POST",
    dataType: "json",
    success: function (data) {
        console.log(data)
        if (data["Result"] == true) {
            $("#loginButton").hide()
            $("#logoutButton").show()
        } else {
            $("#loginButton").show()
            $("#logoutButton").hide()
        }
        if (data["Admin"] == false) {
            $("#admin").hide()
        }
    },
    error: function (jqXHR) {
        console.log("發生錯誤: " + jqXHR.status)
    }
})

// 置入部落格文章
$.ajax({
    type: "GET",
    url: "functions.php?function=Query_All_Post_Titles",
    dataType: "json",
    success: function (data) {
        for (let i = 0; i < data.length; i++) {
            let j = 1
            let title = data[i]['title']
            let name = data[i]['name']
            let post = data[i]['post']
            let datetime = data[i]['datetime']

            let div_post = `<div id="post"><div class="blog-post">
                                <h2 class="blog-post-title">${title}</h2>
                                <p class="blog-post-meta"> ${datetime} <a href="" #"">${name}</a></p>
                                ${post}</div></div>`

            $("#posts").append(div_post)

            if (data[i]["isPin"] == "1") {
                let div_post = `<div class="carousel-item">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h1>${title}</h1><p>${post.substring(0, 75)} ... </p>
                                            <p><a href="#">繼續閱讀</a></p>
                                        </div>
                                    </div>
                                </div>`
                $("#carousel_inner").append(div_post)
                let div_item = `<li data-target="#myCarousel" data-slide-to="${j}""></li>`
                $("#carousel_indicators").append(div_item)
                j += 1
            }
        }

        goToPage(1, TotalPage)

    },
    error: function (jqXHR) {
        console.log("發生錯誤: " + jqXHR.status);
    }
})

// 表單送出處理
$("form").submit(function (e) {
    e.preventDefault();
    var datas = $("form").serialize()
    $.ajax({
        url: "login.php",
        type: "POST",
        data: datas,
        dataType: "json",
        success: function (data) {
            if (data["Result"] == true) {
                $("#login_form_popup").hide()
                $("#loginButton").hide()
                $("#logoutButton").show()
                alert("登入成功!")
            }
            if (data["Admin"] == true) {
                $("#admin").show()
            }
        },
        error: function (jqXHR) {
            console.log("發生錯誤: " + jqXHR.status)
        }
    })
})

$("#login_form_popup").hide()

$("#loginButton").click(function () {
    $("#login_form_popup").show()
});

$("#closeButton").click(function () {
    $("#login_form_popup").hide()
});

$("#nextPage").click(function () {
    currentPage += 1
    currentPage = (currentPage >= TotalPage) ? TotalPage : currentPage
    goToPage(currentPage, TotalPage)
});

$("#lastPage").click(function () {
    currentPage -= 1
    currentPage = (currentPage <= 1) ? 1 : currentPage
    goToPage(currentPage, TotalPage)
});

function goToPage(_currentPage, _pageSize) {
    let posts = $("#posts").children("div#post")
    let postNum = posts.length
    // let totalPage = Math.ceil(postNum / _pageSize);

    let startRow = (_currentPage - 1) * _pageSize; //開始顯示的行
    var endRow = _currentPage * _pageSize; //結束顯示的行
    endRow = (endRow > postNum) ? postNum : endRow;

    //遍歷顯示資料實現分頁
    for (let i = 0; i < postNum; i++) {
        let post = posts[i];
        // console.log(post)
        if (i >= startRow && i < endRow) {
            // $("#postNum" + i).show()
            post.style.display = "";
        } else {
            // $("#postNum" + i).hide()
            post.style.display = "none";
        }
    }
}