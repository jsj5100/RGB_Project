<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jsTree Example</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
    <style>
        #selectedNodeText {
            margin-top: 20px;
            font-size: 18px;
            white-space: pre-wrap; /* Preserve whitespace and line breaks */
        }
    </style>
</head>
<body>
    <div id="jstree"></div>
    <button id="approvalLineButton">Update Text</button>
    <div id="selectedNodeText"></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
    <script>
        $(document).ready(function() {
            let selectedNodeText = "";

            // Fetch tree data from the server
            fetch('http://localhost:8080/Grw_Project/jsTree.do') // 서버에서 트리 데이터를 가져오는 URL
                .then(response => {
                    if (!response.ok) {
                        throw new Error("네트워크 응답이 올바르지 않습니다.");
                    }
                    return response.json();
                })
                .then(data => {
                    console.log(data);
                    console.log(data[0].id);

                    // Initialize jsTree with checkbox plugin
                    $('#jstree').jstree({
                        'core': {
                            'data': data
                        }
                    }).on('select_node.jstree', function (e, data) {
                        // Check if the selected node is a root node
                        if (data.node.parent === '#') {
                            selectedNodeText = ""; // Clear text if root node is selected
                        } else {
                            // Update text for non-root nodes
                            selectedNodeText = data.node.text;
                        }
                    });
                })
                .catch(error => console.error('Error fetching tree data:', error));

            // Button click event
            $('#approvalLineButton').click(function() {
                // Append new text with a newline character
                if (selectedNodeText) {
                    $('#selectedNodeText').append(selectedNodeText + '\n');
                }
            });
        });
    </script>
</body>
</html>
