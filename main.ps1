$filePath = "C:\Users\nsingh\Desktop\Inventory.xml"
$oldFile = Get-Content -Path $filePath

$replace = $oldFile -replace 'item', 'item1' | Set-Content -Path $filePath

$xml = [xml](Get-Content -Path $filePath -Encoding UTF8)
Function converter{
	$xml.ReportOutput.ReportRecord | Select-Object @(
		@{l="Safe";e={$_.item1[0]}},
		@{l="Device Type";e={$_.item1[1]}},
		@{l="Platform ID";e={$_.item1[2]}},
		@{l="Target System Address";e={$_.item1[3]}},
		@{l="Target System Username";e={$_.item1[4]}},
		@{l="Group Name";e={$_.item1[5]}},
		@{l="Last Accessed Date";e={$_.item1[6]}},
		@{l="Last Accessed By";e={$_.item1[7]}},
		@{l="Last Modified Date";e={$_.item1[8]}},
		@{l="Last Modified By";e={$_.item1[9]}},
		@{l="Change Failure";e={$_.item1[10]}},
		@{l="Verification Failure";e={$_.item1[11]}},
		@{l="Failure Reason";e={$_.item1[12]}})
}

converter | Export-Csv -Path "C:\Users\nsingh\Desktop\InventoryReport.csv" -NoTypeInformation
