
$(function () {
    /*----產生data-th-----*/
    let $table = $("#table_change");
    let $thRows = $table.find("thead th");
    console.log($thRows[0])
    $thRows.each(function (key, thRow) {
        $table
            .find("tbody tr td:nth-child(" + (key + 1) + ")")
            .attr("data-th", $(thRow).text());
    });
    /*-----------*/
    goPage(1, 2); // 一開始先秀第一頁,以及每一頁最多兩筆資料
});


function goPage(currentPage, pageSize) {

    var tr = $("#table_change tbody tr");
    var num = $("#table_change tbody tr").length; //表格所有行數(所有記錄數)
    var totalPage = Math.ceil(num / pageSize); // 表格所有行數/每頁顯示行數 = 總頁數

    $('#numberPage').attr('max', totalPage); // 寫入跳至第幾頁input

    $("#numberPage").off('change').on("change", function () {// 跳至第幾頁
        let numberPage = $("#numberPage").val();
        if (numberPage > totalPage) {
            console.log("頁數超過")
            return
        }
        goPage(numberPage, 2);
    });

    var startRow = (currentPage - 1) * pageSize + 1; //開始顯示的行
    var endRow = currentPage * pageSize; //結束顯示的行
    endRow = (endRow > num) ? num : endRow;


    //遍歷顯示資料實現分頁
    for (var i = 1; i < (num + 1); i++) {
        var trRow = tr[i - 1];
        if (i >= startRow && i <= endRow) {
            trRow.style.display = "";
        } else {
            trRow.style.display = "none";
        }
    }

    var tempStr = "";
    if (currentPage > 1) {
        tempStr += `<a href="javascript:;" onClick="goPage(1,${pageSize})">首頁</a>`;
        tempStr += `<a href="javascript:;" onClick="goPage(${currentPage - 1},${pageSize})">上一頁</a>`;

    } else {
        tempStr += `<a href="javascript:;" class="disabled">首頁</a>`;
        tempStr += `<a href="javascript:;" class="disabled">上一頁</a>`;
    }

    tempStr += `<div><span>第${currentPage}頁</span>/<span>共${totalPage}頁</span></div>`;

    if (currentPage < totalPage) {
        tempStr += `<a href="javascript:;" onClick="goPage(${currentPage + 1},${pageSize})" class="btn btn-sm btn-outline-secondary">下一頁</a>`;
        tempStr += `<a href="javascript:;" onClick="goPage(${totalPage},${pageSize})" class="btn btn-sm btn-outline-secondary">尾頁</a>`;
    } else {
        tempStr += `<a href="javascript:;" class="disabled">下一頁</a>`;
        tempStr += `<a href="javascript:;" class="disabled">尾頁</a>`;
    }

    $("#pageModule").html(tempStr);
}

