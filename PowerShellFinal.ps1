#=============================PowerShell Final===============================
#=============================Wejdan Alqarni ================================


# =========== function aske user if he wants to get information about computer
function compinfo() {
$confirm = Read-Host "Get information about the make and model of a computer:  (press Y or N)"

    if ($confirm -eq 'Y') {

Get-WmiObject -Class Win32_ComputerSystem
  
                          }
    else {

write-host '---------------------------'
write-host '      OK, cancelled        '
write-host '---------------------------'

         }
#=========== list of all stopped services =================
$confirm = Read-Host "print a list of all stopped services :  (press Y or N)"
 if ($confirm -eq 'Y') {
Get-Service | where-object {$_.status -eq 'stopped'}
                          }
    else {

write-host '      OK,,,,        '


         }

         }

#==========function to print the computerName, DateAndTime and OSVersion

function deviceinfo() {

$Hostname = Read-Host "press Enter to print the computer Name " 
write-host '---------------------------------------------'
    $computerName = Get-WmiObject -class win32_ComputerSystem
    $computerName.PSComputerName
write-host '---------------------------------------------'
write-host ' '


$DateAndTime = Read-Host "press Enter to print the Date/Time " 
write-host '---------------------------------------------'
    Get-Date
write-host '---------------------------------------------'
write-host ' '

$OSVersion = Read-Host "press Enter to print the OS Version " 
write-host '---------------------------------------------'
    (Get-CimInstance win32_operatingSystem).version
write-host '---------------------------------------------'
write-host ' '

#=========== list of all process seperated by sessions=================

$Y = Read-Host "Do you want to get information about Process:  (press Y or N)"

    if ($Y -eq 'Y') {
Get-Process | Sort-Object -Descending SI | Format-Table Handles,CPU, SI, Id, Name
                          }
    else {

write-host '---------------------------'
write-host '      OK, cancelled        '
write-host '---------------------------'

         }

#=========== list of all open sockets====================

         $OpenSocket = Read-Host "press Enter to list all open sockets " 
write-host '---------------------------------------------'
    Get-NetTCPConnection | Format-Table LocalAddress,LocalPort,RemoteAddress,state,RemotePort  
write-host '---------------------------------------------'
write-host ' '

Get-NetTCPConnection | group state -NoE

write-host ' '
}





#===========functon to read all folders and files in particular directory
function directory() {

$dir = Read-Host 'Please enter the directory in full path'
$files = Get-ChildItem $dir

#---loop---#
foreach ($i in $files ){

    if ($i.Attributes -ne 'Files, Folders' ){
     $i.Name  }

#-----generate the hash keys and save it in hashfile.txt file
     $i |Get-fileHash | out-file hashfile.txt -Append  
           } 
}

