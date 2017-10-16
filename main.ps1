$filePrompt = Read-Host "Enter a number between 1-5 to select report type:`n 1. Privileged Accounts Inventory Report`n 2. Privileged Applications Inventory Report`n 3. Privileged Accounts Compliance Status`n 4. Privileged Accounts Entitlement Report`n 5. Privileged Accounts Activity Log`n"
$reportType = ""

Function accInventoryconverter($reportType){
    $var1=0
    while ($var1 -eq 0){
    $filePath = Read-Host "Enter filename, including the extension: "
        if (-not(test-path $filePath)){
            Write-Host "[Error] Invalid Filepath. Use full path if PS script and xml are not in the same directory"
        }
        else {
           $loadFile = Get-Content -Path $filePath
           Write-Host "File path validated successfully. `n"
           $csvPath = $filePath -replace 'xml', 'csv'
           $var1=1
        }
    }

    $strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $filePath

    $xml = [xml](Get-Content -Path $filePath -Encoding UTF8)

    $xml.ReportOutput.ReportRecord | Select-Object @(
    	@{l="Safe";e={$_.item1[0]}},
    	@{l="Device Type";e={$_.item1[1]}},
    	@{l="Platform ID";e={$_.item1[2]}},
    	@{l="Target System Address";e={$_.item1[3]}},
    	@{l="Target System Username";e={$_.item1[4]}},
    	@{l="Group Name";e={$_.item1[5]}},
    	@{l="Last Accessed Date";e={$_.item1[6].innerxml}},
    	@{l="Last Accessed By";e={$_.item1[7]}},
    	@{l="Last Modified Date";e={$_.item1[8].innerxml}},
    	@{l="Last Modified By";e={$_.item1[9]}},
    	@{l="Change Failure";e={$_.item1[10]}},
    	@{l="Verification Failure";e={$_.item1[11]}},
    	@{l="Failure Reason";e={$_.item1[12]}}) | Export-Csv -Path $csvPath -NoTypeInformation
        
    if (Test-Path $csvPath){
        Write-Host "Your $reportType has been converted from xml to csv successfully"
    }
}

Function appInventoryconverter($reportType){
    $var1=0
    while ($var1 -eq 0){
    $filePath = Read-Host "Enter filename, including the extension: "
        if (-not(test-path $filePath)){
            Write-Host "[Error] Invalid Filepath. Use full path if PS script and xml are not in the same directory"
        }
        else {
           $loadFile = Get-Content -Path $filePath
           Write-Host "File path validated successfully. `n"
           $csvPath = $filePath -replace 'xml', 'csv'
           $var1=1
        }
    }

    $strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $filePath

    $xml = [xml](Get-Content -Path $filePath -Encoding UTF8)

    $xml.ReportOutput.ReportRecord | Select-Object @(
    	@{l="Application ID";e={$_.item1[0]}},
    	@{l="Business Owner";e={$_.item1[1]}},
    	@{l="Location";e={$_.item1[2]}},
    	@{l="Allowed Machines";e={$_.item1[3]}},
    	@{l="OS User/s";e={$_.item1[4]}},
    	@{l="Path/s";e={$_.item1[5]}}) | Export-Csv -Path $csvPath -NoTypeInformation
        
    if (Test-Path $csvPath){
        Write-Host "Your $reportType has been converted from xml to csv successfully"
    }
}

Function complianceConverter($reportType){
    $var1=0
    while ($var1 -eq 0){
    $filePath = Read-Host "Enter filename, including the extension: "
        if (-not(test-path $filePath)){
            Write-Host "[Error] Invalid Filepath. Use full path if PS script and xml are not in the same directory"
        }
        else {
           $loadFile = Get-Content -Path $filePath
           Write-Host "File path validated successfully. `n"
           $csvPath = $filePath -replace 'xml', 'csv'
           $var1=1
        }
    }

    $strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $filePath

    $xml = [xml](Get-Content -Path $filePath -Encoding UTF8)

    $xml.ReportOutput.ReportRecord | Select-Object @(
    	@{l="Target System Username";e={$_.item1[0]}},
    	@{l="Target System Address";e={$_.item1[1]}},
    	@{l="Safe";e={$_.item1[2]}},
    	@{l="Platform ID";e={$_.item1[3]}},
    	@{l="Compliance Status";e={$_.item1[4]}},
    	@{l="Non-Compliance Reason";e={$_.item1[5]}},
    	@{l="Expiration Due (Days)";e={$_.item1[6]}},
    	@{l="Planned Password Change";e={$_.item1[7].innerxml}},
        @{l="Change Mode";e={$_.item1[8]}},
        @{l="One-Time Password";e={$_.item1[9]}},
        @{l="Expiration Period (Days)";e={$_.item1[10]}},
        @{l="Last Modified Date";e={$_.item1[11].innerxml}},
        @{l="Last Accessed By";e={$_.item1[12]}},
    	@{l="Last Accessed Date";e={$_.item1[13].innerxml}},
    	@{l="Last Access Request Timeframe";e={$_.item1[14]}}) | Export-Csv -Path $csvPath -NoTypeInformation
        
    if (Test-Path $csvPath){
        Write-Host "Your $reportType has been converted from xml to csv successfully"
    }
}

Function entitlementConverter($reportType){
    $var1=0
    while ($var1 -eq 0){
    $filePath = Read-Host "Enter filename, including the extension: "
        if (-not(test-path $filePath)){
            Write-Host "[Error] Invalid Filepath. Use full path if PS script and xml are not in the same directory"
        }
        else {
           $loadFile = Get-Content -Path $filePath
           Write-Host "File path validated successfully. `n"
           $csvPath = $filePath -replace 'xml', 'csv'
           $var1=1
        }
    }

    $strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $filePath

    $xml = [xml](Get-Content -Path $filePath -Encoding UTF8)

    $xml.ReportOutput.ReportRecord | Select-Object @(
    	@{l="User";e={$_.item1[0]}},
    	@{l="Full Name";e={$_.item1[1]}},
    	@{l="Group Membership";e={$_.item1[2]}},
        @{l="Location";e={$_.item1[3]}},
        @{l="User Type";e={$_.item1[4]}},
        @{l="Target Platform ID";e={$_.item1[5]}},
        @{l="Target System";e={$_.item1[6]}},
    	@{l="Target Account";e={$_.item1[7]}},
    	@{l="Deleted";e={$_.item1[8]}},
        @{l="Safe";e={$_.item1[9]}},
    	@{l="Retrieve";e={$_.item[10]}},
        @{l="Use";e={$_.item1[11]}},
        @{l="Change";e={$_.item1[12]}},
    	@{l="Other Permissions";e={$_.item1[13]}}) | Export-Csv -Path $csvPath -NoTypeInformation
        
    if (Test-Path $csvPath){
        Write-Host "Your $reportType has been converted from xml to csv successfully"
    }
}

Function activityConverter{
    $var1=0
    while ($var1 -eq 0){
    $filePath = Read-Host "Enter filename, including the extension: "
        if (-not(test-path $filePath)){
            Write-Host "[Error] Invalid Filepath. Use full path if PS script and xml are not in the same directory"
        }
        else {
           $loadFile = Get-Content -Path $filePath
           Write-Host "File path validated successfully. `n"
           $csvPath = $filePath -replace 'xml', 'csv'
           $var1=1
        }
    }

    $strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $filePath

    $xml = [xml](Get-Content -Path $filePath -Encoding UTF8)

    $xml.ReportOutput.ReportRecord | Select-Object @(
    	@{l="Time";e={$_.item1[0].innerxml}},
    	@{l="User";e={$_.item1[1]}},
    	@{l="Action";e={$_.item1[2]}},
    	@{l="Safe";e={$_.item1[3]}},
    	@{l="Target";e={$_.item1[4]}},
        @{l="Target Platform";e={$_.item1[5]}},
        @{l="Target System";e={$_.item1[6]}},
        @{l="Target Account";e={$_.item1[7]}},
        @{l="New Target";e={$_.item1[8]}},
        @{l="Reason";e={$_.item1[9]}},
    	@{l="Alert";e={$_.item1[10]}},
    	@{l="Request ID";e={$_.item1[11]}},
        @{l="Client ID";e={$_.item1[12]}}) | Export-Csv -Path $csvPath -NoTypeInformation
        
    if (Test-Path $csvPath){
        Write-Host "Your $reportType has been converted from xml to csv successfully"
    }
}


Function Main{

if ($filePrompt -eq 1){
        $reportType="Privileged Accounts Inventory Report"
        Write-Host "You selected: $reportType `n"
        accInventoryConverter $reportType
    }
    ElseIf ($filePrompt -eq 2){
        $reportType="Privileged Applications Inventory Report"
        Write-Host "You selected: $reportType `n"
        appInventoryConverter $reportType
    }
    ElseIf ($filePrompt -eq 3){
        $reportType="Privileged Accounts Compliance Status"
        Write-Host "You selected: $reportType `n"
        complianceConverter $reportType
    }
    ElseIf ($filePrompt -eq 4){
        $reportType="Privileged Accounts Entitlement Report"
        Write-Host "You selected: $reportType `n"
        entitlementConverter $reportType
    }
    ElseIf ($filePrompt -eq 5){
        $reportType="Privileged Accounts Activity Log"
        Write-Host "You selected: $reportType `n"
        activityConverter $reportType
    }
    Else{
        Write-Host "Your entry was invalid"
        Exit
    }
}

Main
