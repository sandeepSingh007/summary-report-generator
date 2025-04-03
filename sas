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
        
        /* Form styles */
        .form-container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            padding: 20px;
            margin-bottom: 30px;
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
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
        
        .action-taken-section {
            background-color: rgba(232, 245, 233, 0.4);
        }
        
        .issues-fixed-section {
            background-color: rgba(227, 242, 253, 0.4);
        }
        
        .pending-issues-section {
            background-color: rgba(255, 235, 238, 0.4);
        }
        
        .action-plan-section {
            background-color: rgba(255, 248, 225, 0.4);
        }
        
        .form-group {
            margin-bottom: 15px;
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
            font-family: inherit;
        }
        
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .item-container {
            margin-bottom: 10px;
        }
        
        .dynamic-item {
            display: flex;
            margin-bottom: 10px;
            align-items: flex-start;
        }
        
        .dynamic-item textarea {
            flex: 1;
            min-height: 80px;
        }
        
        .dynamic-item .controls {
            margin-left: 10px;
            display: flex;
            flex-direction: column;
        }
        
        .add-item-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 5px;
        }
        
        .remove-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 4px 8px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 5px;
        }
        
        .status-select {
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ddd;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 5px;
        }
        
        .generate-btn {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
        }
        
        .generate-btn:hover {
            background-color: #0b7dda;
        }
        
        /* Preview styles */
        .report-container {
            max-width: 900px;
            margin: 30px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            overflow: hidden;
            display: none;
        }
        
        .report-header {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
        }
        
        .report-title {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }
        
        .report-date {
            margin-top: 5px;
            font-size: 14px;
            color: #666;
        }
        
        .customer-info {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
            display: flex;
            justify-content: space-between;
            max-width: 500px;
        }
        
        .customer-info div {
            margin-right: 20px;
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
        
        .section-content {
            margin: 0;
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
        
        .status-indicator {
            display: inline-block;
            margin-left: 10px;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
        }
        
        .status-success {
            background-color: #4caf50;
            color: white;
        }
        
        .status-completed {
            background-color: #8bc34a;
            color: white;
        }
        
        .status-pending {
            background-color: #ff9800;
            color: white;
        }
        
        .status-failed {
            background-color: #f44336;
            color: white;
        }
        
        .action-buttons {
            margin-top: 20px;
            text-align: center;
        }
        
        .download-btn, 
        .print-btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        
        .print-btn {
            background-color: #2196F3;
        }
        
        @media print {
            .form-container,
            .action-buttons {
                display: none;
            }
            
            .report-container {
                display: block !important;
                box-shadow: none;
                border: none;
            }
            
            /* Ensure colors are preserved when printing */
            * {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
                color-adjust: exact !important;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Summary Report</h1>
        
        <div class="form-group">
            <label for="report-date">Date:</label>
            <input type="date" id="report-date" name="report-date">
        </div>
        
        <div class="form-group">
            <label for="customer-name">Customer Name:</label>
            <input type="text" id="customer-name" name="customer-name" placeholder="Enter customer name">
        </div>
        
        <div class="form-group">
            <label for="customer-rep">Customer Representative:</label>
            <input type="text" id="customer-rep" name="customer-rep" placeholder="Enter customer representative name">
        </div>
        
        <div class="form-section action-taken-section">
            <h2>Action Taken</h2>
            <div id="action-taken-container">
                <!-- Items will be added here -->
            </div>
            <button type="button" class="add-item-btn" onclick="addItem('action-taken-container', 'action')">+ Add Action</button>
        </div>
        
        <div class="form-section issues-fixed-section">
            <h2>Issues Fixed</h2>
            <div id="issues-fixed-container">
                <!-- Items will be added here -->
            </div>
            <button type="button" class="add-item-btn" onclick="addItem('issues-fixed-container', 'fixed')">+ Add Fixed Issue</button>
        </div>
        
        <div class="form-section pending-issues-section">
            <h2>Pending Issues</h2>
            <div id="pending-issues-container">
                <!-- Items will be added here -->
            </div>
            <button type="button" class="add-item-btn" onclick="addItem('pending-issues-container', 'pending')">+ Add Pending Issue</button>
        </div>
        
        <div class="form-section action-plan-section">
            <h2>Action Plan</h2>
            <div id="action-plan-container">
                <!-- Items will be added here -->
            </div>
            <button type="button" class="add-item-btn" onclick="addItem('action-plan-container', 'plan')">+ Add Plan Item</button>
        </div>
        
        <button type="button" class="generate-btn" onclick="generateReport()">Generate Report</button>
    </div>
    
    <div id="report-container" class="report-container">
        <!-- Generated report will appear here -->
    </div>
    
    <div class="action-buttons" id="action-buttons" style="display: none;">
        <button type="button" class="download-btn" onclick="saveAsPDF()">Download as PDF</button>
        <button type="button" class="print-btn" onclick="printReport()">Print Report</button>
    </div>
    
    <script>
        // Set current date on load and add initial items
        window.onload = function() {
            const today = new Date();
            const formattedDate = today.toISOString().split('T')[0];
            document.getElementById('report-date').value = formattedDate;
            
            // Add initial items to each section
            addItem('action-taken-container', 'action');
            addItem('issues-fixed-container', 'fixed');
            addItem('pending-issues-container', 'pending');
            addItem('action-plan-container', 'plan');
        };
        
        // Add new dynamic item
        function addItem(containerId, type) {
            const container = document.getElementById(containerId);
            const newItem = document.createElement('div');
            newItem.className = 'dynamic-item';
            
            // Set placeholder text based on container type
            let placeholderText = 'Enter details';
            if (type === 'action') {
                placeholderText = "Enter action taken details. Use the format: 'Test Case X: Tested the Playbook (file.yml) with SELinux disabled...'";
            } else if (type === 'fixed') {
                placeholderText = "Enter details about the fixed issue";
            } else if (type === 'pending') {
                placeholderText = "Enter details about the pending issue";
            } else if (type === 'plan') {
                placeholderText = "Enter action plan details";
            }
            
            // Generate options based on container type
            let optionsHTML = '';
            if (type === 'action') {
                optionsHTML = `
                    <option value="success">Success</option>
                    <option value="completed">Completed</option>
                    <option value="pending">Pending</option>
                    <option value="failed">Failed</option>
                `;
            } else if (type === 'fixed') {
                optionsHTML = `
                    <option value="success">Resolved</option>
                    <option value="completed">Completed</option>
                    <option value="pending">Partially Resolved</option>
                    <option value="failed">Failed</option>
                `;
            } else if (type === 'pending') {
                optionsHTML = `
                    <option value="pending" selected>Pending</option>
                    <option value="completed">Completed</option>
                    <option value="success">In Progress</option>
                    <option value="failed">Blocked</option>
                `;
            } else if (type === 'plan') {
                optionsHTML = `
                    <option value="pending" selected>Planned</option>
                    <option value="completed">Completed</option>
                    <option value="success">Started</option>
                    <option value="failed">Blocked</option>
                `;
            }
            
            // Create the item HTML
            newItem.innerHTML = `
                <textarea placeholder="${placeholderText}"></textarea>
                <div class="controls">
                    <select class="status-select">
                        ${optionsHTML}
                    </select>
                    <button type="button" class="remove-btn" onclick="removeItem(this)">✕</button>
                </div>
            `;
            
            container.appendChild(newItem);
        }
        
        // Remove dynamic item
        function removeItem(button) {
            const item = button.closest('.dynamic-item');
            item.parentNode.removeChild(item);
        }
        
        // Format date for display
        function formatDate(dateString) {
            const date = new Date(dateString);
            return `${String(date.getDate()).padStart(2, '0')}/${String(date.getMonth() + 1).padStart(2, '0')}/${date.getFullYear()}`;
        }
        
        // Helper function to process text
        function processText(text) {
            // Bold important terms like filenames, parameters, etc.
            let processed = text
                .replace(/\(([^)]+\.yml)\)/g, '<strong>($1)</strong>')  // Files in parentheses
                .replace(/"([^"]+)"/g, '<strong>"$1"</strong>')         // Quoted text
                .replace(/SELinux (enabled|disabled|set to enforcing mode)/g, '<strong>SELinux $1</strong>') // SELinux status
                .replace(/(disabled|enforcing) mode/g, '<strong>$1 mode</strong>'); // Mode descriptions
                
            // Handle bullet points for lists
            const bulletSplit = processed.split('•');
            if (bulletSplit.length > 1) {
                // Start with the first part before any bullets
                let result = bulletSplit[0] + '<br><br>The playbook functioned as expected, performing the following tasks successfully:<ul style="margin-top: 8px; margin-bottom: 8px;">';
                
                // Process each bullet point
                for (let i = 1; i < bulletSplit.length; i++) {
                    let item = bulletSplit[i].trim();
                    if (item) {
                        result += `<li><strong>${item}</strong></li>`;
                    }
                }
                
                result += '</ul>';
                return result;
            }
            
            return processed;
        }
        
        // Generate the status report
        function generateReport() {
            const date = document.getElementById('report-date').value;
            const formattedDate = formatDate(date);
            
            // Collect all items with their statuses
            const actionTakenItems = collectItems('action-taken-container');
            const issuesFixedItems = collectItems('issues-fixed-container');
            const pendingIssuesItems = collectItems('pending-issues-container');
            const actionPlanItems = collectItems('action-plan-container');
            
            // Create status indicator labels
            const statusLabels = {
                'success': {
                    'action-taken-container': 'Success',
                    'issues-fixed-container': 'Resolved',
                    'pending-issues-container': 'In Progress',
                    'action-plan-container': 'Started'
                },
                'completed': {
                    'action-taken-container': 'Completed',
                    'issues-fixed-container': 'Completed',
                    'pending-issues-container': 'Completed',
                    'action-plan-container': 'Completed'
                },
                'pending': {
                    'action-taken-container': 'Pending',
                    'issues-fixed-container': 'Partially Resolved',
                    'pending-issues-container': 'Pending',
                    'action-plan-container': 'Planned'
                },
                'failed': {
                    'action-taken-container': 'Failed',
                    'issues-fixed-container': 'Failed',
                    'pending-issues-container': 'Blocked',
                    'action-plan-container': 'Blocked'
                }
            };
            
            // Generate HTML for the report
            let reportHTML = `
                <div class="report-header">
                    <h1 class="report-title">Summary Report</h1>
                    <div class="customer-info">
                        <div><strong>Customer:</strong> ${document.getElementById('customer-name').value || 'N/A'}</div>
                        <div><strong>Customer Representative:</strong> ${document.getElementById('customer-rep').value || 'N/A'}</div>
                    </div>
                    <div class="report-date">Date: ${formattedDate}</div>
                </div>
            `;
            
            // Action Taken section
            reportHTML += `
                <div class="section action-taken">
                    <h2 class="section-title">Action Taken</h2>
                    <div class="section-content">
                        <ol>
            `;
            
            actionTakenItems.forEach(item => {
                const processedContent = processText(item.content);
                reportHTML += `
                    <li>
                        ${processedContent}
                        <span class="status-indicator status-${item.status}">${statusLabels[item.status]['action-taken-container']}</span>
                    </li>
                `;
            });
            
            reportHTML += `
                        </ol>
                    </div>
                </div>
            `;
            
            // Issues Fixed section
            reportHTML += `
                <div class="section issues-fixed">
                    <h2 class="section-title">Issues Fixed</h2>
                    <div class="section-content">
                        <ol>
            `;
            
            issuesFixedItems.forEach(item => {
                reportHTML += `
                    <li>
                        ${item.content}
                        <span class="status-indicator status-${item.status}">${statusLabels[item.status]['issues-fixed-container']}</span>
                    </li>
                `;
            });
            
            reportHTML += `
                        </ol>
                    </div>
                </div>
            `;
            
            // Pending Issues section
            reportHTML += `
                <div class="section pending-issues">
                    <h2 class="section-title">Pending Issues</h2>
                    <div class="section-content">
                        <ol>
            `;
            
            pendingIssuesItems.forEach(item => {
                reportHTML += `
                    <li>
                        ${item.content}
                        <span class="status-indicator status-${item.status}">${statusLabels[item.status]['pending-issues-container']}</span>
                    </li>
                `;
            });
            
            reportHTML += `
                        </ol>
                    </div>
                </div>
            `;
            
            // Action Plan section
            reportHTML += `
                <div class="section action-plan">
                    <h2 class="section-title">Action Plan</h2>
                    <div class="section-content">
                        <ol>
            `;
            
            actionPlanItems.forEach(item => {
                reportHTML += `
                    <li>
                        ${item.content}
                        <span class="status-indicator status-${item.status}">${statusLabels[item.status]['action-plan-container']}</span>
                    </li>
                `;
            });
            
            reportHTML += `
                        </ol>
                    </div>
                </div>
            `;
            
            // Update the report container
            const reportContainer = document.getElementById('report-container');
            reportContainer.innerHTML = reportHTML;
            reportContainer.style.display = 'block';
            
            // Show action buttons
            document.getElementById('action-buttons').style.display = 'block';
            
            // Scroll to the report
            reportContainer.scrollIntoView({ behavior: 'smooth' });
        }
        
        // Collect items from a container
        function collectItems(containerId) {
            const container = document.getElementById(containerId);
            const items = container.querySelectorAll('.dynamic-item');
            const result = [];
            
            items.forEach(item => {
                const content = item.querySelector('textarea').value.trim();
                const status = item.querySelector('.status-select').value;
                
                if (content) {
                    result.push({ content, status });
                }
            });
            
            return result;
        }
        
        // Save as PDF function
        function saveAsPDF() {
            // Modern browsers handle PDF conversion via print dialog
            window.print();
        }
        
        // Print report function
        function printReport() {
            window.print();
        }
    </script>
</body>
</html>
