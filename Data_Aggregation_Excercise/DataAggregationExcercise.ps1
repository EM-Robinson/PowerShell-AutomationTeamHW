#Importing the MOCK_DATA.csv and assigning the data to $Data

$Data = Import-Csv "C:\Users\AAP8801\MOCK_DATA.csv"

<#Selecting only the department property of each object in $Data. The -Unique parameter allows us to grab only one instance of each department so there are not grabbing duplicate departments in the data we've filtered. This data is stored into $Departments#>

$Departments = $Data | Select-Object Department -Unique

#Initialing an array object where our new data will be stored.

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
