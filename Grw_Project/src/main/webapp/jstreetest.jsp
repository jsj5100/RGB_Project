<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jsTree Example</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
    <style>
         #resultDiv {
            border: 1px solid #000;
            padding: 10px;
            margin-top: 10px;
        }
    </style>
</head>
 <h1>결재라인 설정</h1>
    <select id="rankSelect">
        <option value="1">직급 1</option>
        <option value="2">직급 2</option>
        <option value="3">직급 3</option>
        <option value="4">직급 4</option>
        <option value="5">직급 5</option>
        <option value="6">직급 6</option>
        <option value="7">직급 7</option>
    </select>
    <button onclick="updateDiv()">추가</button>
    <div id="resultDiv"></div>

    <script>
        function updateDiv() {
            // 선택된 직급 가져오기
            const selectElement = document.getElementById('rankSelect');
            const selectedRank = parseInt(selectElement.value);
            
            // 결과를 표시할 div 선택
            const resultDiv = document.getElementById('resultDiv');
            resultDiv.innerHTML = ''; // 기존 내용 제거
            
            // 직급을 1부터 7까지 돌면서 체크
            for (let i = 1; i <= 7; i++) {
                if (i >= selectedRank) {
                    // 선택한 직급보다 같거나 높은 직급은 제외
                    continue;
                }
                // 결과 div에 직급 추가
                const rankElement = document.createElement('div');
                rankElement.textContent = `직급 ${i}`;
                resultDiv.appendChild(rankElement);
            }
        }
    </script>
</body>
</html>
