window.onload = function() {
	const previewImage = document.getElementById("previewImage");
	const buttonContainer = document.getElementById("buttonContainer");
	const fileInput = document.getElementById("reviewImageFileInput");

	// 파일 선택 시 미리보기 및 버튼 컨테이너 업데이트
	fileInput.onchange = function() {
		const file = this.files[0];
		if (!file) {
			return;
		}

		const fileName = file.name.toLowerCase();
		const fileForm = /\.(jpg|jpeg|bmp|png|gif)$/;
		const maxSize = 5 * 1024 * 1024; // 5MB

		if (!fileForm.test(fileName)) {
			alert("이미지 파일만 가능합니다.");
			return;
		}

		if (file.size > maxSize) {
			alert("이미지 파일은 5MB 이하만 가능합니다.");
			return;
		}

		readUrl(file);
		buttonContainer.style.display = 'flex';
	}

	// 파일을 읽어 미리보기 이미지 업데이트
	function readUrl(file) {
		const fileReader = new FileReader();
		fileReader.onload = function(e) {
			previewImage.src = e.target.result;
			previewImage.style.display = 'block';
		};
		fileReader.readAsDataURL(file);
	}

	// 취소 버튼 클릭 시 처리
	document.getElementById("delete_button").addEventListener('click', function() {
		previewImage.src = ''; // 미리보기 이미지 초기화
		previewImage.style.display = 'none';
		fileInput.value = ''; // 파일 입력 초기화
		buttonContainer.style.display = 'none'; // 버튼 컨테이너 숨기기
	});

	// 업로드 버튼 클릭 시 처리
	document.getElementById("upload_button").addEventListener('click', function() {
		imageSubmit();
	});
}

function imageSubmit() {
	const fileInput = document.getElementById("reviewImageFileInput").files;
	const formData = new FormData();

	if (fileInput.length === 0) {
		alert("업로드할 파일을 선택해주세요.");
		return;
	}

	for (let i = 0; i < fileInput.length; i++) {
		formData.append("file", fileInput[i]);
	}

	$.ajax({
		url: "./uploadAjax.do",
		type: "post",
		data: formData,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(msg) {
			if (msg.isc === "true") {
				alert("업로드 완료");
			} else {
				alert("업로드 실패");
			}
		},
		error: function(xhr, status, error) {
			console.error("업로드 요청 실패", status, error);
			alert("업로드 요청 실패");
		}
	});
}
