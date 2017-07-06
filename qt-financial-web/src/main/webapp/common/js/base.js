function LoadAjaxContent(url, id) {
	$('.preloader').show();
	$.ajax({
		mimeType : 'text/html; charset=utf-8', // ! Need set mimeType only when
		url : url,
		type : 'GET',
		success : function(data) {
			$('#' + id).html(data);
			$('.preloader').hide();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			// alert(errorThrown);
		},
		dataType : "html",
		async : true
	});
}

function LoadAjaxContentCallback(url, id, callback) {
	$('.preloader').show();
	$.ajax({
		mimeType : 'text/html; charset=utf-8', // ! Need set mimeType only when
		url : url,
		type : 'GET',
		success : function(data) {
			$('#' + id).html(data);
			$('.preloader').hide();
			callback();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			// alert(errorThrown);
		},
		dataType : "html",
		async : true
	});
}

function LoadAjaxData(url, callback) {
	$.ajax({
		url : url,
		type : 'GET',
		success : function(data) {
			callback(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		},
		dataType : "json",
		async : true
	});
}

function submitAjaxData(url, param, callback) {
	$.ajax({
		url : url,
		type : 'POST',
		data : param,
		success : function(data) {
			callback(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		},
		dataType : "json",
		async : true
	});
}
// 浮点数加法运算
function FloatAdd(arg1, arg2) {
	var r1, r2, m;
	try {
		r1 = arg1.toString().split(".")[1].length
	} catch (e) {
		r1 = 0
	}
	try {
		r2 = arg2.toString().split(".")[1].length
	} catch (e) {
		r2 = 0
	}
	m = Math.pow(10, Math.max(r1, r2));
	return (arg1 * m + arg2 * m) / m;
}

// 浮点数减法运算
function FloatSub(arg1, arg2) {
	var r1, r2, m, n;
	try {
		r1 = arg1.toString().split(".")[1].length
	} catch (e) {
		r1 = 0
	}
	try {
		r2 = arg2.toString().split(".")[1].length
	} catch (e) {
		r2 = 0
	}
	m = Math.pow(10, Math.max(r1, r2));
	// 动态控制精度长度
	n = (r1 >= r2) ? r1 : r2;
	return ((arg1 * m - arg2 * m) / m).toFixed(n);
}

// 浮点数乘法运算
function FloatMul(arg1, arg2) {
	var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
	try {
		m += s1.split(".")[1].length
	} catch (e) {
	}
	try {
		m += s2.split(".")[1].length
	} catch (e) {
	}
	return Number(s1.replace(".", "")) * Number(s2.replace(".", ""))
			/ Math.pow(10, m);
}

// 浮点数除法运算
function FloatDiv(arg1, arg2) {
	var t1 = 0, t2 = 0, r1, r2;
	try {
		t1 = arg1.toString().split(".")[1].length
	} catch (e) {
	}
	try {
		t2 = arg2.toString().split(".")[1].length
	} catch (e) {
	}
	with (Math) {
		r1 = Number(arg1.toString().replace(".", ""));
		r2 = Number(arg2.toString().replace(".", ""));
		return (r1 / r2) * pow(10, t2 - t1);
	}
}
// 打印区域
function printit(MyDiv) {
	// if (confirm('确定打印吗？')) {
	var newstr = document.getElementById(MyDiv).innerHTML;
	console.log(newstr);
	var headerStr = ''
			+ ' <!DOCTYPE html>'
			+ ' <html lang="en">'
			+ ' <head>'
			+ ' <meta charset="utf-8">'
			+ ' <title>慢病管理系统</title>'
			+ ' <meta name="description" content="description">'
			+ ' <meta name="author" content="mlnx">'
			+ ' <meta name="viewport" content="width=device-width, initial-scale=1">'
			+ '<link href="/community-doctor-web/common/img/favicon.ico" rel="shortcut icon" media="print">'
			+ '<link href="/community-doctor-web/common/js/advanced-datatable/css/demo_page.css" rel="stylesheet" media="print"/>'
			+ '<link href="/community-doctor-web/common/js/advanced-datatable/css/demo_table.css" rel="stylesheet" media="print"/>'
			+ '<link href="/community-doctor-web/common/js/data-tables/DT_bootstrap.css" rel="stylesheet" media="print"/>'
			+ '<link href="/community-doctor-web/common/js/gritter/css/jquery.gritter.css" rel="stylesheet" media="print"/>'
			+ '<link href="/community-doctor-web/common/css/style.css"  rel="stylesheet" media="print">'
			+ '<link href="/community-doctor-web/common/css/style-responsive.css" rel="stylesheet" media="print">'
			+ '<link href="/community-doctor-web/common/css/radio-checkbox.css" rel="stylesheet" media="print">'
			+ '<link href="/community-doctor-web/common/css/admin/heart_new.css" rel="stylesheet" media="print">'
			+ ' </head>' + ' <body>';
	var str = headerStr + newstr + '</body></html>';
	var reg = new RegExp("(<button.*?>[\\s|\\S]*?<\/button>)", "g"); // 创建正则RegExp对象
	var printStr = str.replace(reg, "");
	var pwin = window.open("", "pwin"); // 如果是本地测试，需要先新建Print.htm，如果是在域中使用，则不需要
	pwin.document.write(printStr);
	pwin.document.close(); // 这句很重要，没有就无法实现
	setTimeout(function() {
		pwin.print();
		pwin.close();
	}, 500);

	return false;
	// }
}
// format日期
function formatDate(strTime) {
	var date = new Date(strTime);
	return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
			+ date.getDate();
}

// format日期时间
function formatDatetime(strTime) {
	var date = new Date(strTime);
	return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
			+ date.getDate() + " " + date.getHours() + ":" + date.getMinutes()
			+ ":" + date.getSeconds();
}
// format时间
function formatTime(strTime) {
	var date = new Date(strTime);
	return date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
}

// format时间
function formatSecondTime(strTime) {
	var date = new Date(strTime);
	return date.getMinutes() + ":" + date.getSeconds();
}

//是否为空
function empty(el) {
	if (el == null || el == '') {
		return true;
	}
	return false;
}

function addEvent(obj,xEvent,fn) {
    if(document.attachEvent){ //if IE (and Opera depending on user setting)
        obj.attachEvent('on'+xEvent,fn);
    }else if(document.addEventListener){//WC3 browsers
        obj.addEventListener(xEvent,fn,false);
    }
}

