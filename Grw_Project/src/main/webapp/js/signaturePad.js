document.addEventListener('DOMContentLoaded', () => {
    const signaturePad = new SignaturePad(canvas);

    function resizeCanvas() {
        const canvas = document.querySelector('#signature-pad-div canvas');
        canvas.width = document.getElementById('signature-pad-div').offsetWidth;
        canvas.height = document.getElementById('signature-pad-div').offsetHeight;
        signaturePad.clear(); // 크기 조정 후 캔버스 초기화
    }

    window.addEventListener('resize', resizeCanvas);
    resizeCanvas(); // 페이지 로드 시 캔버스 크기 설정

    // 모달이 열릴 때 캔버스 크기 조정
    const modal = document.getElementById('kt_modal_select_location');
    modal.addEventListener('shown.bs.modal', () => {
        resizeCanvas();
    });

    // 서명 저장 버튼 이벤트 리스너
    document.getElementById('saveSign').addEventListener('click', () => {
        if (signaturePad.isEmpty()) {
            alert("서명을 먼저 해주세요.");
        } else {
            const dataURL = signaturePad.toDataURL();
            // 여기서 서명 이미지를 서버에 전송하거나 다른 작업을 수행할 수 있습니다.
            console.log(dataURL); // 데이터 URL을 콘솔에 출력
            
            fetch('http://localhost:8080/Grw_Project/saveSignatureSign.do',{
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({ image: dataURL})
			})
			.then(response => {
				if(!response.ok){
					throw new Error("네트워크 응답이 올바르지 않습니다.");
				}
				return response.json();
			})
			.then(data => {
				if (data.success){
					console.log('사인 이미지 전송 성공');
				}else{
					console.log('사인 이미지 전송 실패');	
				}
			})
			.catch(error => {
				console.error('에러: ', error);
			})		
        }
    });

    // 서명 지우기 버튼 이벤트 리스너
    document.getElementById('clearSign').addEventListener('click', () => {
        signaturePad.clear();
    });
});
