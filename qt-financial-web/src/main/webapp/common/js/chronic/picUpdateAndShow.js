function setImagePreviewz(docObj, localImagId, imgObjPreview) {
	if (docObj.files && docObj.files[0]) {
		var src = "http://tonghangimg.oss-cn-shanghai.aliyuncs.com/"+docObj.value;
		console.log("imgObjPreview:"+imgObjPreview);
		$(imgObjPreview).attr("src",src);
		$(imgObjPreview).attr("style","max-width:200px");
		$(imgObjPreview).attr("style","max-height:100px");
	} else {
		// IE下，使用滤镜
		/*docObj.select();
		var imgSrc = document.selection.createRange().text;*/
		// 必须设置初始大小
		var src = "http://tonghangimg.oss-cn-shanghai.aliyuncs.com/"+docObj.value;
		$(imgObjPreview).attr("src",src);

	}
	return true;
}
function setImagePreviewForVisitExamination2(docObj, localImagId, imgObjPreview) {
	if (docObj.files && docObj.files[0]) {
		var localImg="#localImag2";
		var imgPreview="#preview2";
		
		var src = "http://tonghangimg.oss-cn-shanghai.aliyuncs.com/"+docObj.value
		$(imgPreview).attr("src",src);
	    
	
		$(imgPreview).attr("style","max-width:200px");
		$(imgPreview).attr("style","max-height:100px");
	} else {
		// IE下，使用滤镜
		/*docObj.select();
		var imgSrc = document.selection.createRange().text;*/
		// 必须设置初始大小
		var localImg="#localImag2";
		var imgPreview="#preview2";
		var src = "http://tonghangimg.oss-cn-shanghai.aliyuncs.com/"+docObj.value;
		console.log(src);
		console.log(localImg);
		console.log(imgPreview);
		$(imgPreview).attr("src",src);

	}
	return true;
}