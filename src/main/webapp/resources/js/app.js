function handleDragEnter(e) {

	this.classList.add('drag-over');
}

function handleDragLeave(e) {

	this.classList.remove('drag-over');
}



function showInformationDialog(files, objectArray) {

	var responseContent = "";

	for (var i = 0; i < objectArray.length; i++) {

		var infoObject = objectArray[i];

		for ( var infoKey in infoObject) {
			if (infoObject.hasOwnProperty(infoKey)) {
				responseContent = responseContent + " " + infoKey + " -> " + infoObject[infoKey] + "<br>";
			}
		}
		responseContent = responseContent + "<hr>";
	}

	// from the library bootstrap-dialog.min.js
	BootstrapDialog.show({
		title : '<b>Server Response</b>',
		message : responseContent
	});
}
$(document).ready(function () {

	$(".file-dropzone").on('dragover', handleDragEnter);
	$(".file-dropzone").on('dragleave', handleDragLeave);
	$(".file-dropzone").on('drop', handleDragLeave);

	/**
	 Dropzone.prototype.defaultOptions.dictDefaultMessage = "Drop files here to upload";
	 Dropzone.prototype.defaultOptions.dictFallbackMessage = "Your browser does not support drag'n'drop file uploads.";
	 Dropzone.prototype.defaultOptions.dictFallbackText = "Please use the fallback form below to upload your files like in the olden days.";
	 Dropzone.prototype.defaultOptions.dictFileTooBig = "File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.";
	 Dropzone.prototype.defaultOptions.dictInvalidFileType = "You can't upload files of this type.";
	 Dropzone.prototype.defaultOptions.dictResponseError = "Server responded with {{statusCode}} code.";
	 Dropzone.prototype.defaultOptions.dictCancelUpload = "Cancel upload";
	 Dropzone.prototype.defaultOptions.dictCancelUploadConfirmation = "Are you sure you want to cancel this upload?";
	 Dropzone.prototype.defaultOptions.dictRemoveFile = "Remove file";
	 Dropzone.prototype.defaultOptions.dictMaxFilesExceeded = "You can not upload any more files.";
	 */
	//alert($("#dropzone-form > input").attr("name")+" "+$("#dropzone-form > input").val());
	// "dropzoneForm" is the camel-case version of the form id "dropzone-form"
	Dropzone.options.dropzoneForm = {
		url: "testUpload.do",
		autoProcessQueue: false,
		uploadMultiple: true,
		maxFilesize: 256, // MB
		parallelUploads: 100,
		maxFiles: 100,
		addRemoveLinks: true,
		removedfile: function(file) {
			alert("File " + file.name + "removed");
			$.ajax({
				type: 'post',
				url: 'pic_delete.jsp?id=' + file.name,
				cache: false,
				success: function (data) {

				}
			});
			var _ref;
			try {
				return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
			} catch(e) {
				console.log(e);
			}
			alert('fail');
			return false;
		},
		previewsContainer: ".dropzone-previews",
		headers: {
			'Authorization': $("#dropzone-form > input").attr("name") + "=" + $("#dropzone-form > input").val()
			// both values below work only with my forked version of DropZone
			// path is availaile here: https://github.com/pomeh/dropzone/commit/f0063db6e5697888582421865840258dec1ffdc1
			, 'Cache-Control': null
			, 'X-Requested-With': null
			, 'X-CSRF-TOKEN': $('meta[name=_csrf]').attr('content')
		},

		// The setting up of the dropzone
		init: function () {

			var myDropzone = this;

			// first set autoProcessQueue = false
			$('#upload-button').on("click", function (e) {

				myDropzone.processQueue();
			});

			// customizing the default progress bar
			this.on("uploadprogress", function (file, progress) {

				progress = parseFloat(progress).toFixed(0);

				var progressBar = file.previewElement.getElementsByClassName("dz-upload")[0];
				progressBar.innerHTML = progress + "%";
			});

			// displaying the uploaded files information in a Bootstrap dialog
			this.on("successmultiple", function (files, serverResponse) {
				showInformationDialog(files, serverResponse);
			});

			/*this.on("removedfile", function (file) {
				alert("File " + file.name + "removed");
				$.ajax({
					type: 'post',
					url: 'pic_delete.jsp?id=' + file.name,
					cache: false,
					success: function (data) {

					}
				});
				var _ref;
				return void 0;
			});*/

			for(var idx in mockFileList) {
				// Call the default addedfile event handler
				var mockFile = {name:mockFileList[idx]["id"], size:mockFileList[idx]["size"]};
				this.emit("addedfile", mockFile);
				// And optionally show the thumbnail of the file:
				this.emit("thumbnail", mockFile, "/impd/get/"+mockFileList[idx]["id"]);
				this.emit("complete", mockFile);
				this.files.push(mockFile);
			}
		}
	}
});

