$Data = Import-Csv "C:\Users\AAP8801\MOCK_DATA.csv"

$Departments = $Data | Select-Object Department -Unique
$DepartmentObject = @()

foreach($Department in $Departments){

$DepartmentData = $Data | Where-Object {$_.Department -eq $Department.department}
$DepartmentSum = [Decimal]0

Foreach($Branch in $DepartmentData){

$BranchCost = [Decimal]$Branch.cost.Replace('$','')
$DepartmentSum = $DepartmentSum + $BranchCost

}

$DepartmentObject += New-Object -TypeName PSObject -Property @{

        'Department' = $Department.department
        'TotalCost' = $DepartmentSum
        
    }

}

$DepartmentObject | Export-Csv -Path "C:\Users\AAP8801\MOCK_DATA_TOTAL.csv" -NoTypeInformation -Force
