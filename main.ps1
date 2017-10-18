Function accInventoryconverter($pathvar){
	$loadFile = Get-Content -Path $pathvar
	$csvPath = $pathvar -replace 'xml', 'csv'
		   
	$strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $pathvar

	$xml = [xml](Get-Content -Path $pathvar -Encoding UTF8)
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
}
Function appInventoryconverter($pathvar){
	$loadFile = Get-Content -Path $pathvar
	$csvPath = $pathvar -replace 'xml', 'csv'
		   
	$strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $pathvar

	$xml = [xml](Get-Content -Path $pathvar -Encoding UTF8)
	$xml.ReportOutput.ReportRecord | Select-Object @(
    		@{l="Application ID";e={$_.item1[0]}},
    		@{l="Business Owner";e={$_.item1[1]}},
    		@{l="Location";e={$_.item1[2]}},
    		@{l="Allowed Machines";e={$_.item1[3]}},
    		@{l="OS User/s";e={$_.item1[4]}},
    		@{l="Path/s";e={$_.item1[5]}}) | Export-Csv -Path $csvPath -NoTypeInformation
}
Function entitlementConverter($pathvar){
	$loadFile = Get-Content -Path $pathvar
	$csvPath = $pathvar -replace 'xml', 'csv'

	$strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $pathvar

	$xml = [xml](Get-Content -Path $pathvar -Encoding UTF8)
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
}
Function activityConverter($pathvar){
   $loadFile = Get-Content -Path $pathvar
   $csvPath = $pathvar -replace 'xml', 'csv'
   
   $strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $pathvar

   $xml = [xml](Get-Content -Path $pathvar -Encoding UTF8)
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
}
Function complianceConverter($pathvar){
	$loadFile = Get-Content -Path $pathvar
	$csvPath = $pathvar -replace 'xml', 'csv'
	$strReplace = $loadFile -replace 'item', 'item1' | Set-Content -Path $pathvar

	$xml = [xml](Get-Content -Path $pathvar -Encoding UTF8)
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
}
Function Main{
	$accInventoryFiles=Get-ChildItem -Path *.xml -Include *Inventory* -Exclude *Compliance* -Name
	$appInventoryFiles=Get-ChildItem -Path *.xml -Include *Application* -Name
	$entitlementsFiles=Get-ChildItem -Path *.xml -Include *Entitlement* -Name
	$activityFiles=Get-ChildItem -Path *.xml -Include *Activities* -Name
	$complianceFiles=Get-ChildItem -Path *.xml -Include *Compliance* -Exclude "InventoryReports.InventoryReportUI*" -Name
	
	if (Test-Path $accInventoryFiles){
		foreach ($file in $accInventoryFiles){
			accInventoryconverter $file
		}
	}
	if (Test-Path $appInventoryFiles){
		foreach ($file in $appInventoryFiles){
			appInventoryconverter $file
		}
	}
	if (Test-Path $entitlementsFiles){
		foreach ($file in $entitlementsFiles){
			entitlementConverter $file
		}
	}
	if (Test-Path $activityFiles){
		foreach ($file in $activityFiles){
			activityConverter $file
		}
	}
	if (Test-Path $complianceFiles){
		foreach ($file in $complianceFiles){
			complianceConverter $file
		}
	}
}
Main
