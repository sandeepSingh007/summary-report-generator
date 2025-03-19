<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Summary Report</title>
    <style>
        /* Common styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            color: #333;
            background-color: #f5f5f5;
        }
        
        /* Report styles */
        .report-container {
            max-width: 900px;
            margin: 30px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            overflow: hidden;
        }
        
        .report-header {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            text-align: center;
            position: relative;
        }
        
        .report-title {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }
        
        .customer-info {
            margin: 15px 0 5px 0;
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #333;
            width: 100%;
        }
        
        .customer {
            text-align: left;
        }
        
        .customer-rep {
            text-align: right;
        }
        
        .report-date {
            margin-top: 15px;
            font-size: 14px;
            color: #666;
            text-align: center;
        }
        
        .section {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
        }
        
        .section-title {
            margin: 0 0 15px 0;
            font-size: 22px;
            font-weight: bold;
            color: #333;
        }
        
        .action-taken {
            background-color: #e8f5e9;
        }
        
        .issues-fixed {
            background-color: #e3f2fd;
        }
        
        .pending-issues {
            background-color: #ffebee;
        }
        
        .action-plan {
            background-color: #fff8e1;
        }
        
        .summary-section {
            background-color: #f3e5f5; /* Light purple background for summary */
        }
        
        .attachments-section {
            background-color: #e0f7fa; /* Light cyan background for attachments */
        }
        
        .engineer-section {
            margin-top: 30px;
            border-top: 1px solid #eee;
            padding: 20px;
            text-align: right;
        }
        
        .engineer-name {
            margin-top: 10px;
            font-weight: bold;
        }
        
        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 8px 12px;
            text-align: left;
            vertical-align: top;
        }
        
        th {
            background-color: rgba(0, 0, 0, 0.05);
            font-weight: bold;
        }
        
        .table-status {
            text-align: center;
            font-weight: bold;
            width: 120px;
        }
        
        .table-date {
            text-align: center;
            width: 120px;
        }
        
        .status-completed {
            background-color: #8bc34a;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            display: inline-block;
        }
        
        .status-pending {
            background-color: #ff9800;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            display: inline-block;
        }
        
        .status-planned {
            background-color: #ff9800;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            display: inline-block;
        }
        
        .status-success {
            background-color: #4caf50;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            display: inline-block;
        }
        
        /* List Styles in Tables */
        td ul {
            margin: 8px 0 8px 20px;
            padding: 0;
        }
        
        td li {
            margin-bottom: 5px;
        }
        
        /* Print Styles */
        @media print {
            body {
                background-color: white;
                padding: 0;
                margin: 0;
            }
            
            .report-container {
                box-shadow: none;
                border: none;
            }
            
            .action-buttons {
                display: none;
            }
            
            /* Ensure colors are preserved when printing */
            * {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
                color-adjust: exact !important;
            }
        }
        
        .action-buttons {
            margin-top: 20px;
            text-align: center;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
        }
        
        .btn-print {
            background-color: #2196F3;
        }
        
        /* Form styles */
        .form-container {
            max-width: 900px;
            margin: 30px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            padding: 20px;
        }
        
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-section {
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        
        .form-section h2 {
            margin-top: 0;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 1px solid #eee;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        input[type="text"], 
        input[type="date"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .input-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .input-group {
            flex: 1;
            margin-right: 10px;
        }
        
        .input-group:last-child {
            margin-right: 0;
        }
        
        .dynamic-item {
            border: 1px solid #eee;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        
        .item-controls {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        
        .remove-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .add-btn {
            background-color: #2196F3;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .generate-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 20px auto;
            width: 200px;
        }
        
        .select-status {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 150px;
        }
        
        /* Toggle between form and report view */
        #report-view {
            display: none;
        }
        
        .view-toggle {
            display: flex;
            max-width: 900px;
            margin: 0 auto;
        }
        
        .view-toggle button {
            flex: 1;
            padding: 10px;
            background-color: #f1f1f1;
            border: none;
            cursor: pointer;
        }
        
        .view-toggle button.active {
            background-color: #4CAF50;
            color: white;
        }
        
        /* Action plan date styles */
        .date-input {
            width: 150px !important;
            margin-bottom: 10px;
        }
        
        /* Summary textarea style */
        .summary-textarea {
            width: 100%;
            min-height: 150px;
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: inherit;
        }
        
        /* Attachment styles */
        .file-upload {
            margin-bottom: 15px;
        }
        
        .file-input {
            display: none;
        }
        
        .attachment-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .attachment-name {
            font-weight: bold;
        }
        
        .attachment-size {
            color: #666;
            font-size: 0.9em;
            margin-left: 10px;
        }
        
        .attachment-actions {
            display: flex;
            gap: 10px;
        }
        
        .attachment-actions button {
            padding: 5px 10px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
        }
        
        .attachment-actions button:last-child {
            background-color: #f44336;
        }
        
        #attachment-list {
            margin-top: 15px;
        }
        
        .attachment-drop-area {
            border: 2px dashed #ccc;
            border-radius: 5px;
            padding: 25px;
            text-align: center;
            margin-bottom: 15px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }
        
        .attachment-drop-area.dragover {
            background-color: #e3f2fd;
            border-color: #2196F3;
        }
        
        .attachment-instructions {
            margin-bottom: 10px;
            color: #555;
        }
        
        .report-attachments li {
            margin-bottom: 10px;
        }
        
        .report-attachments a {
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
        }
        
        .report-attachments a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="view-toggle">
        <button id="form-toggle" class="active" onclick="showForm()">Edit Form</button>
        <button id="report-toggle" onclick="showReport()">View Report</button>
    </div>
    
    <!-- Form View -->
    <div id="form-view" class="form-container">
        <h1 class="form-title">Summary Report Generator</h1>
        
        <div class="form-group">
            <div class="input-row">
                <div class="input-group">
                    <label for="report-date">Date:</label>
                    <input type="date" id="report-date" name="report-date">
                </div>
                <div class="input-group">
                    <label for="customer-name">Customer:</label>
                    <input type="text" id="customer-name" name="customer-name" placeholder="Enter customer name">
                </div>
                <div class="input-group">
                    <label for="customer-rep">Customer Representative:</label>
                    <input type="text" id="customer-rep" name="customer-rep" placeholder="Enter customer rep name">
                </div>
            </div>
        </div>
        
        <div class="form-section">
            <h2>Action Taken</h2>
            <div id="action-taken-container">
                <!-- Action items will be added here -->
            </div>
            <button type="button" class="add-btn" onclick="addItem('action-taken')">+ Add Action Item</button>
        </div>
        
        <div class="form-section">
            <h2>Issues Fixed</h2>
            <div id="issues-fixed-container">
                <!-- Fixed issues will be added here -->
            </div>
            <button type="button" class="add-btn" onclick="addItem('issues-fixed')">+ Add Fixed Issue</button>
        </div>
        
        <div class="form-section">
            <h2>Pending Issues</h2>
            <div id="pending-issues-container">
                <!-- Pending issues will be added here -->
            </div>
            <button type="button" class="add-btn" onclick="addItem('pending-issues')">+ Add Pending Issue</button>
        </div>
        
        <div class="form-section">
            <h2>Action Plan</h2>
            <div id="action-plan-container">
                <!-- Action plan items will be added here -->
            </div>
            <button type="button" class="add-btn" onclick="addItem('action-plan')">+ Add Action Plan Item</button>
        </div>
        
        <div class="form-section">
            <h2>Summary</h2>
            <div class="form-group">
                <label for="summary-text">Overall Summary:</label>
                <textarea id="summary-text" class="summary-textarea" placeholder="Enter a comprehensive summary of the status, key achievements, and next steps..."></textarea>
            </div>
        </div>
        
        <div class="form-section">
            <h2>Attachments</h2>
            <div class="attachment-drop-area" id="drop-area">
                <div class="attachment-instructions">Drag & drop files here or click to select files</div>
                <input type="file" id="file-input" class="file-input" multiple>
                <button type="button" class="add-btn" onclick="document.getElementById('file-input').click()">+ Select Files</button>
            </div>
            <div id="attachment-list">
                <!-- Attachment items will be listed here -->
            </div>
        </div>
        
        <div class="form-group">
            <label for="engineer-name">Report Prepared By:</label>
            <input type="text" id="engineer-name" name="engineer-name" placeholder="Enter your name">
        </div>
        
        <button type="button" class="generate-btn" onclick="generateReport()">Generate Report</button>
    </div>
    
    <!-- Report View -->
    <div id="report-view">
        <div class="report-container">
            <div class="report-header">
                <h1 class="report-title">Summary Report</h1>
                <div class="customer-info">
                    <div class="customer"><strong>Customer:</strong> <span id="report-customer-name"></span></div>
                    <div class="customer-rep"><strong>Customer Representative:</strong> <span id="report-customer-rep"></span></div>
                </div>
                <div class="report-date">Date: <span id="report-date-display"></span></div>
            </div>
            
            <div class="section action-taken">
                <h2 class="section-title">Action Taken</h2>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 30px;">#</th>
                            <th>Description</th>
                            <th class="table-status">Status</th>
                        </tr>
                    </thead>
                    <tbody id="action-taken-table">
                        <!-- Table rows will be generated here -->
                    </tbody>
                </table>
            </div>
            
            <div class="section issues-fixed">
                <h2 class="section-title">Issues Fixed</h2>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 30px;">#</th>
                            <th>Description</th>
                            <th class="table-status">Status</th>
                        </tr>
                    </thead>
                    <tbody id="issues-fixed-table">
                        <!-- Table rows will be generated here -->
                    </tbody>
                </table>
            </div>
            
            <div class="section pending-issues">
                <h2 class="section-title">Pending Issues</h2>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 30px;">#</th>
                            <th>Description</th>
                            <th class="table-status">Status</th>
                        </tr>
                    </thead>
                    <tbody id="pending-issues-table">
                        <!-- Table rows will be generated here -->
                    </tbody>
                </table>
            </div>
            
            <div class="section action-plan">
                <h2 class="section-title">Action Plan</h2>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 30px;">#</th>
                            <th>Description</th>
                            <th class="table-date">Target Date</th>
                            <th class="table-status">Status</th>
                        </tr>
                    </thead>
                    <tbody id="action-plan-table">
                        <!-- Table rows will be generated here -->
                    </tbody>
                </table>
            </div>
            
            <div class="section summary-section">
                <h2 class="section-title">Summary</h2>
                <div id="summary-content">
                    <!-- Summary content will be placed here -->
                </div>
            </div>
            
            <div class="section attachments-section">
                <h2 class="section-title">Attachments</h2>
                <ul id="report-attachments" class="report-attachments">
                    <!-- Attachment links will appear here -->
                </ul>
            </div>
        </div>
        
        <div class="engineer-section">
            <div>Report prepared by:</div>
            <div class="engineer-name" id="report-engineer-name"></div>
        </div>
        
        <div class="action-buttons">
            <a href="#" class="btn" onclick="window.print(); return false;">Download as PDF</a>
            <a href="#" class="btn btn-print" onclick="window.print(); return false;">Print Report</a>
        </div>
    </div>
    
    <script>
        // Initialize counters for each section
        let actionTakenCounter = 0;
        let issuesFixedCounter = 0;
        let pendingIssuesCounter = 0;
        let actionPlanCounter = 0;
        
        // Store attachments
        let attachments = [];
        
        // Set current date on load
        window.onload = function() {
            const today = new Date();
            const formattedDate = today.toISOString().split('T')[0];
            document.getElementById('report-date').value = formattedDate;
            
            // Add initial items
            addItem('action-taken');
            addItem('issues-fixed');
            addItem('pending-issues');
            addItem('action-plan');
            
            // Set up file input handler
            setupFileInput();
            
            // Set up drag and drop for attachments
            setupDragAndDrop();
        };
        
        // Setup file input listener
        function setupFileInput() {
            const fileInput = document.getElementById('file-input');
            fileInput.addEventListener('change', function() {
                const files = this.files;
                for (let i = 0; i < files.length; i++) {
                    attachments.push(files[i]);
                }
                displayAttachments();
                this.value = ''; // Reset file input
            });
        }
        
        // Setup drag and drop functionality
        function setupDragAndDrop() {
            const dropArea = document.getElementById('drop-area');
            
            ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
                dropArea.addEventListener(eventName, preventDefaults, false);
            });
            
            function preventDefaults(e) {
                e.preventDefault();
                e.stopPropagation();
            }
            
            ['dragenter', 'dragover'].forEach(eventName => {
                dropArea.addEventListener(eventName, highlight, false);
            });
            
            ['dragleave', 'drop'].forEach(eventName => {
                dropArea.addEventListener(eventName, unhighlight, false);
            });
            
            function highlight() {
                dropArea.classList.add('dragover');
            }
            
            function unhighlight() {
                dropArea.classList.remove('dragover');
            }
            
            dropArea.addEventListener('drop', handleDrop, false);
            
            function handleDrop(e) {
                const dt = e.dataTransfer;
                const files = dt.files;
                
                for (let i = 0; i < files.length; i++) {
                    attachments.push(files[i]);
                }
                
                displayAttachments();
            }
        }
        
        // Display attachments in the list
        function displayAttachments() {
            const container = document.getElementById('attachment-list');
            container.innerHTML = '';
            
            if (attachments.length === 0) {
                container.innerHTML = '<p>No attachments added</p>';
                return;
            }
            
            attachments.forEach((file, index) => {
                const item = document.createElement('div');
                item.className = 'attachment-item';
                
                item.innerHTML = `
                    <div>
                        <span class="attachment-name">${file.name}</span>
                        <span class="attachment-size">(${formatFileSize(file.size)})</span>
                    </div>
                    <div class="attachment-actions">
                        <button onclick="previewAttachment(${index})">Preview</button>
                        <button onclick="removeAttachment(${index})">Remove</button>
                    </div>
                `;
                
                container.appendChild(item);
            });
        }
        
        // Preview attachment
        function previewAttachment(index) {
            const file = attachments[index];
            const objectURL = URL.createObjectURL(file);
            
            // Handle different file types
            if (file.type.startsWith('image/')) {
                window.open(objectURL);
            } else if (file.type === 'application/pdf') {
                window.open(objectURL);
            } else {
                alert('Preview not available for this file type. You can download it instead.');
            }
        }
        
        // Remove attachment
        function removeAttachment(index) {
            attachments.splice(index, 1);
            displayAttachments();
        }
        
        // Format file size
        function formatFileSize(bytes) {
            if (bytes < 1024) return bytes + ' bytes';
            else if (bytes < 1048576) return (bytes / 1024).toFixed(1) + ' KB';
            else return (bytes / 1048576).toFixed(1) + ' MB';
        }
        
        // Toggle between form and report views
        function showForm() {
            document.getElementById('form-view').style.display = 'block';
            document.getElementById('report-view').style.display = 'none';
            document.getElementById('form-toggle').classList.add('active');
            document.getElementById('report-toggle').classList.remove('active');
        }
        
        function showReport() {
            document.getElementById('form-view').style.display = 'none';
            document.getElementById('report-view').style.display = 'block';
            document.getElementById('form-toggle').classList.remove('active');
            document.getElementById('report-toggle').classList.add('active');
        }
        
        // Add new item to a section
        function addItem(sectionType) {
            let container;
            let counter;
            let defaultStatus;
            let additionalFields = '';
            
            // Set container and counter based on section type
            if (sectionType === 'action-taken') {
                container = document.getElementById('action-taken-container');
                counter = ++actionTakenCounter;
                defaultStatus = 'completed';
            } else if (sectionType === 'issues-fixed') {
                container = document.getElementById('issues-fixed-container');
                counter = ++issuesFixedCounter;
                defaultStatus = 'completed';
            } else if (sectionType === 'pending-issues') {
                container = document.getElementById('pending-issues-container');
                counter = ++pendingIssuesCounter;
                defaultStatus = 'pending';
            } else if (sectionType === 'action-plan') {
                container = document.getElementById('action-plan-container');
                counter = ++actionPlanCounter;
                defaultStatus = 'planned';
                
                // Add date picker for action plan items
                const nextWeek = new Date();
                nextWeek.setDate(nextWeek.getDate() + 7);
                const defaultDate = nextWeek.toISOString().split('T')[0];
                
                additionalFields = `
                    <div class="form-group">
                        <label>Target Date:</label>
                        <input type="date" class="date-input item-date" value="${defaultDate}">
                    </div>
                `;
            }
            
            // Create a new item element
            const item = document.createElement('div');
            item.className = 'dynamic-item';
            item.dataset.index = counter;
            
            // Create item content with appropriate status options
            let statusOptions = '';
            if (sectionType === 'action-taken' || sectionType === 'issues-fixed') {
                statusOptions = `
                    <option value="completed" selected>Completed</option>
                    <option value="success">Success</option>
                    <option value="pending">Pending</option>
                    <option value="failed">Failed</option>
                `;
            } else if (sectionType === 'pending-issues') {
                statusOptions = `
                    <option value="pending" selected>Pending</option>
                    <option value="completed">Completed</option>
                    <option value="success">In Progress</option>
                    <option value="failed">Blocked</option>
                `;
            } else if (sectionType === 'action-plan') {
                statusOptions = `
                    <option value="planned" selected>Planned</option>
                    <option value="completed">Completed</option>
                    <option value="success">Started</option>
                    <option value="failed">Blocked</option>
                `;
            }
            
            // Set item HTML
            item.innerHTML = `
                <div class="form-group">
                    <label>Item #${counter}:</label>
                    <textarea placeholder="Enter description" rows="3" class="item-description"></textarea>
                </div>
                ${additionalFields}
                <div class="item-controls">
                    <div>
                        <label>Status:</label>
                        <select class="select-status">
                            ${statusOptions}
                        </select>
                    </div>
                    <button type="button" class="remove-btn" onclick="removeItem(this, '${sectionType}')">Remove</button>
                </div>
            `;
            
            // Add the item to the container
            container.appendChild(item);
        }
        
        // Remove an item
        function removeItem(button, sectionType) {
            const item = button.closest('.dynamic-item');
            
            // Confirm removal
            if (confirm('Are you sure you want to remove this item?')) {
                item.parentNode.removeChild(item);
            }
        }
        
        // Format date for display
        function formatDate(dateString) {
            const date = new Date(dateString);
            return `${String(date.getDate()).padStart(2, '0')}/${String(date.getMonth() + 1).padStart(2, '0')}/${date.getFullYear()}`;
        }
        
        // Generate the report
        function generateReport() {
            // Get basic info
            const date = document.getElementById('report-date').value;
            const formattedDate = formatDate(date);
            const customerName = document.getElementById('customer-name').value || 'N/A';
            const customerRep = document.getElementById('customer-rep').value || 'N/A';
            const engineerName = document.getElementById('engineer-name').value || 'N/A';
            const summaryText = document.getElementById('summary-text').value || 'No summary provided.';
            
            // Set report header info
            document.getElementById('report-date-display').textContent = formattedDate;
            document.getElementById('report-customer-name').textContent = customerName;
            document.getElementById('report-customer-rep').textContent = customerRep;
            document.getElementById('report-engineer-name').textContent = engineerName;
            
            // Set summary content
            document.getElementById('summary-content').innerHTML = `<p>${summaryText.replace(/\n/g, '<br>')}</p>`;
