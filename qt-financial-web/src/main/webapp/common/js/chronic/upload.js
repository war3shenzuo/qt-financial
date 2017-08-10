function uploadInit(dir, selectfilebtn, container, ossfile, postfile, fileValue, preview) {

	accessid = 'LTAIPvn9pI0IgTHc';
	accesskey = 'p8tGL8YpUi5Q8hMICTlygkUz9jmT4l';
	host = 'http://tonghangimg.oss-cn-shanghai.aliyuncs.com';
	
	g_dirname = '';
	g_object_name = '';
	g_object_name_type = '';
	now = timestamp = Date.parse(new Date()) / 1000;

	var policyText = {
		"expiration" : "2020-01-01T12:00:00.000Z", // 设置该Policy的失效时间，超过这个失效时间之后，就没有办法通过这个policy上传文件了
		"conditions" : [ [ "content-length-range", 0, 1048576000 ] // 设置上传文件的大小限制
		]
	};

	var policyBase64 = Base64.encode(JSON.stringify(policyText));
	message = policyBase64;
	var bytes = Crypto.HMAC(Crypto.SHA1, message, accesskey, {
		asBytes : true
	});
	var signature = Crypto.util.bytesToBase64(bytes);

	function check_object_radio() {
		g_object_name_type = 'local_name';
	}
	function get_dirname() {
		if(dir==null || dir==''){
			dir = 'usr/' ;// 防止路径名
		}
		if (dir != '' && dir.indexOf('/') != dir.length - 1) {
			dir = dir + '/';
		}
		g_dirname = dir;
	}

	function random_string(len) {
		len = len || 32;
		var chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
		var maxPos = chars.length;
		var pwd = '';
		for (var i = 0; i < len; i++) {
			pwd += chars.charAt(Math.floor(Math.random() * maxPos));
		}
		return pwd;
	}

	function get_suffix(filename) {
		pos = filename.lastIndexOf('.');
		suffix = '';
		if (pos != -1) {
			suffix = filename.substring(pos);
		}
		return suffix;
	}

	function calculate_object_name(filename) {
		g_object_name += new Date().getFullYear() + ""
				+ (new Date().getMonth() + 1) + "" + new Date().getDate()
				+ "${filename}" + ".alioss";
		return '';
	}

	function get_uploaded_object_name(filename) {
		tmp_name = g_object_name;
		tmp_name = tmp_name.replace("${filename}", filename);
		return tmp_name;
	}

	function set_upload_param(up, filename, ret) {
		g_object_name = g_dirname;
		if (filename != '') {
			suffix = get_suffix(filename);
			calculate_object_name(filename);
		}
		new_multipart_params = {
			'key' : g_object_name,
			'policy' : policyBase64,
			'OSSAccessKeyId' : accessid,
			'success_action_status' : '200', // 让服务端返回200,不然，默认会返回204
			'signature' : signature,
		};

		up.setOption({
			'url' : host,
			'multipart_params' : new_multipart_params
		});

		up.start();
	}

	var uploader = new plupload.Uploader(
			{
				runtimes : 'html5,flash,silverlight,html4',
				browse_button : selectfilebtn,
				multi_selection : false,// 设置只能单选
				container : document.getElementById(container),
				flash_swf_url : 'lib/plupload-2.1.2/js/Moxie.swf',
				silverlight_xap_url : 'lib/plupload-2.1.2/js/Moxie.xap',
				url : host,// 'http://oss.aliyuncs.com',
				init : {
					PostInit : function() {
						document.getElementById(ossfile).innerHTML = '';
						document.getElementById(postfile).onclick = function() {
							set_upload_param(uploader, '', false);
							return false;
						};
					},

					FilesAdded : function(up, files) {
						plupload
								.each(
										files,
										function(file) {
											document.getElementById(ossfile).innerHTML = '<div id="'
													+ file.id
													+ '">'
													+ file.name
													+ ' ('
													+ plupload
															.formatSize(file.size)
													+ ')<b></b>'
													+ '<div class="progress"><div class="progress-bar" style="width: 0%"></div></div>'
													+ '</div>';
										});
						document.getElementById(postfile).click();//这里执行点击，为了以后方便功能扩展写个例子
					},

					BeforeUpload : function(up, file) {
						check_object_radio();
						get_dirname();
						set_upload_param(up, file.name, true);
					},

					UploadProgress : function(up, file) {
						var d = document.getElementById(file.id);
						d.getElementsByTagName('b')[0].innerHTML = '<span>'
								+ file.percent + "%</span>";
						var prog = d.getElementsByTagName('div')[0];
						var progBar = prog.getElementsByTagName('div')[0];
						progBar.style.width = file.percent + '%';
						progBar.setAttribute('aria-valuenow', file.percent);
					},

					FileUploaded : function(up, file, info, type) {
						if (info.status == 200) {
							document.getElementById(file.id)
									.getElementsByTagName('b')[0].innerHTML = '上传成功';
							document.getElementById(fileValue).value = get_uploaded_object_name(file.name);
							var src = "http://tonghangimg.oss-cn-shanghai.aliyuncs.com/"
									+ get_uploaded_object_name(file.name)
									+ "?x-oss-process=image/resize,w_200";
							document.getElementById(preview).src = src;
						} else {
							document.getElementById(file.id)
									.getElementsByTagName('b')[0].innerHTML = info.response;
						}
					},
				}
			});
	uploader.init();
}
