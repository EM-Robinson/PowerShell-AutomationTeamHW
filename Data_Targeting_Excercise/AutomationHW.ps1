#Importing CSV file into Powershell
$Data =""
$Data = Import-Csv .\MOCK_DATA.csv | select name

Foreach($Name in $Data){

$SplitName = $Name -split (" ")
$FirstName = $SplitName[0]
$LastIndex = $SplitName.Count - 1
$LastName = $SplitName[$LastIndex]
$FullName = $FirstName + " " + $LastName

Write-Host $FullName

}


#Importing CSV file into Powershell

$Data = Import-Csv .\MOCK_DATA.csv 

Function Get-Names {

<#

#Attempting to add a parameter to the Get-Names function

Param (

    [String]
    $Name

    )

#>

Foreach($Name in $Data){

$SplitName = $Name.name -split (" ")
$FirstName = $SplitName[0]
$LastIndex = $SplitName.Count - 1
$LastName = $SplitName[$LastIndex]

Write-Host "First Name: $FirstName"
Write-Host "Last Name: $LastName"

}  

}

Get-Names $Data

<#Kitts Solution:

$Data = Import-Csv .\MOCK_DATA.csv 

Function Get-Name($Name) {

    $SplitName = $Name.name -split (" ")
    $FirstName = $SplitName[0]
    $LastIndex = $SplitName.Count - 1
    $LastName = $SplitName[$LastIndex]
    
    Write-Host "First Name: $FirstName"
    Write-Host "Last Name: $LastName"
    
    }

    Foreach($Name in $Data){
    
    Get-Name $Name

    }

#>
