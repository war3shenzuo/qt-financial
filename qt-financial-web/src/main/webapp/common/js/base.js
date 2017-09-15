function LoadAjaxContent(url, id) {
	$('.preloader').show();
	$.ajax({
		mimeType : 'text/html; charset=utf-8', // ! Need set mimeType only when
		url : url,
		type : 'GET',
		success : function(data) {
			$('#' + id).html(data);
			$('.preloader').hide();
			setTimeout(function() {
				//console.log($('#wrapper').outerHeight());
				var wrapperHeight = $('#wrapper').outerHeight(true);
				$('.main-content').css("height",wrapperHeight);
			}, 800);
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
		async : false
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

//format日期时间
function formatBorrowDatetime(strTime) {
	var date = new Date(strTime);
	return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
			+ date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
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

