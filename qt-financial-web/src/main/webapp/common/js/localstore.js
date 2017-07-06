//本文件用于本地保存用
//cookie相关

//写cookies
function setCookie(name, value) {
	var Days = 30;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = name + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}

// 读取cookies
function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}

// 删除cookies
function delCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = getCookie(name);
	if (cval != null)
		document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

// websql相关
// 判定当前环境是否支持websql
if (!window.openDatabase) {
	console.log('当前环境不支持websql,启用cookies');
	setCookie(key, value);
}

var config = { // 初始化websql数据库的参数信息
	name : 'info',
	version : '1.0',
	desc : 'store userId',
	size : 20 * 1024
};
var db = window.openDatabase(config.name, config.version, config.desc,
		config.size);

crateTable(db);

function errorCallback(error) {
	console.error('error:' + error.message);
}

function crateTable() {
	var sql = 'create table if not exists t_map(key, value)';
	db.transaction(function(tx) {
		tx.executeSql(sql, null, function(tx, rs) {
			console.log('执行sql成功:' + sql);
		}, errorCallback);
	});
}

function addMap(values) { // values = [key,value]
	var sql = 'INSERT INTO t_map (key, value) VALUES (?,?)';
	db.transaction(function(tx) {
		tx.executeSql(sql, values, function(tx, rs) {
			var effectRow = rs.rowsAffected;
			console.log('影响记录条数:' + effectRow);
			effectRow && console.log('执行sql成功:' + sql + ",传值为:" + values);
		}, errorCallback);
	});
}

function getMap(key, callback) {
	var sql = 'SELECT * FROM t_map WHERE key = ?';
	db.transaction(function(tx) {
		tx.executeSql(sql, key, function(tx, rs) {
			try {
				console.log('执行sql成功:' + sql + ",传值为:" + key);
				for (var i = 0; i < rs.rows.length; i++) {
					console.log('item[' + i + ']:'
							+ JSON.stringify(rs.rows.item(i)));
				}
				var result = rs.rows.item(0).value;
				callback(result);
			} catch (arr) {
				console.log(arr);
				callback("");
			}
		}, errorCallback);
	});
};

function getMaps() {
	var sql = 'SELECT * FROM t_map';
	db.transaction(function(tx) {
		tx.executeSql(sql, null, function(tx, rs) {
			console.log('执行sql成功:' + sql);
			for (var i = 0; i < rs.rows.length; i++) {
				console.log('item[' + i + ']:'
						+ JSON.stringify(rs.rows.item(i)));
			}
		}, errorCallback);
	});
};

function deleteMap(values) {
	var sql = 'DELETE FROM t_map WHERE key = ?';
	db.transaction(function(tx) {
		tx.executeSql(sql, values, function(tx, rs) {
			var effectRow = rs.rowsAffected;
			console.log('影响记录条数:' + effectRow);
			effectRow && console.log('执行sql成功:' + sql + ",传值为:" + values);
		}, errorCallback);
	});
}

function updateMap(values) {
	var sql = 'UPDATE t_map SET value = ? WHERE key = ?';
	db.transaction(function(tx) {
		tx.executeSql(sql, values, function(tx, rs) {
			var effectRow = rs.rowsAffected;
			console.log('影响记录条数:' + effectRow);
			effectRow && console.log('执行sql成功' + sql + ",传值为:" + values);
		}, errorCallback);
	});
}

function loadUserData(loadData) {
	try {
		var userId = "";
		// 判定当前环境是否支持websql
		if (!window.openDatabase) {
			console.log('当前环境不支持websql,启用cookies');
			userId = getCookie("userId");
			loadData(userId);
		} else {
			var config = { // 初始化websql数据库的参数信息
				name : 'info',
				version : '1.0',
				desc : 'store userId',
				size : 20 * 1024
			};
			var db = window.openDatabase(config.name, config.version,
					config.desc, config.size);
			var sql = 'SELECT * FROM t_map WHERE key = ?';
			db.transaction(function(tx) {
				tx.executeSql(sql, [ "userId" ], function(tx, rs) {
					try {
						userId = rs.rows.item(0).value;
					} catch (arr) {
						userId = getCookie("userId");
						console.log("get userId from cookie value:" + userId);
					}
					callback(userId);
				}, errorCallback);
			});
		}
		function callback(userId) {
			loadData(userId);
		}
		function errorCallback(error) {
			console.error(error.message);
		}
	} catch (arr) {
		console.log(arr);
		userId = getCookie("userId");
		loadData(userId);
	}

}