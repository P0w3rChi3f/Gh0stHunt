Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

Function Show-MainMenu {
    param (
        [string]$Title = "Main Menu"
        )
    Clear-Host
    
    DisplayLogo
        
    Write-Host " "   
    Write-Host "================ $Title =================" -ForegroundColor Yellow
    Write-Host " "
    $Options=@"
        [1] : Setup Menu 
        [2] : Hunt Menu 
        [3] : System Info Menu 
        [4] : Create Baseline 
        [5] : Comparison Menu #Still in Progress
        [6] : Help Menu
        [Q] : Exit the Program
"@
    

    $Options

    Write-Host " "
    Write-Host "Please make a selection: " -NoNewLine -ForegroundColor yellow
    $selection = Read-Host 
    

    switch ($selection)
        {
            '1' {
                Write-Host "Getting Setup Menu..." -ForegroundColor Cyan
                Show-SetupMenu
            }
            '2' {
                Write-Host "Getting the Hunt Menu..." -ForegroundColor Cyan
                Show-HuntMenu
            }
            '3' {
                Write-Host "Getting the System Info Menu..." -ForegroundColor Cyan
                Show-SystemInfoMenu
            }
            '4' {
                Write-Host "Getting the Baseline Menu..." -ForegroundColor Cyan
                Create-Baseline
            }
            '5' {
                Write-Host "Getting the Comparison Menu..." -ForegroundColor Cyan
                Show-ComparisonMenu
            }
            '6' {
                Write-Hosts "Quiting..." -ForegroundColor Cyan
                exit
            }
        }
    }



#The Setup Menu is complete. Needs Testing. Contents of the Setup Menu may need additional work.
Function Show-SetupMenu {
    param (
        [string]$Title = "Setup Menu"
        )

    Clear-Host

    DisplayLogo

    Write-Host ""
    Write-Host "================ $Title =================" -ForegroundColor Yellow
    Write-Host ""

    $options=
@" 
            [1] : Run Full Setup
            [2] : Setup Execution Policy
            [3] : Setup Working Directory
            [4] : Setup Trusted Hosts Information
            [5] : Gather Host Information
            [6] : Gather Credentials
            [7] : Gather IOC Information
            [M] : Return to the Main Menu
            [Q] : Exit the Program
"@    
    
    $Options
    Write-Host " "
    Write-Host "Please make a selection: " -NoNewLine -ForegroundColor yellow
    $selection = Read-Host  
    
    switch ($selection)
    {
        
        '1' {
            Write-Host "Running Setup..." -ForegroundColor Cyan
            Write-Host ""
            Set-ExPol
            Set-WorkingDirectory
            Set-TrustedHosts
            Set-Hosts
            Set-Creds
            Set-IOCInformation
            Write-Host ""
            Write-Host "Setup is Complete..." -ForegroundColor Green
            Show-MainMenu
        }
        '2' {
            Set-ExPol
            Show-SetupMenu
        }
        '3' {
            Set-WorkingDirectory
            Show-SetupMenu
        }
        '4' {
            Set-TrustedHosts
            Show-SetupMenu
        }
        '5' {
            Set-Hosts
            Show-SetupMenu
        }
        '6' {
            Set-Creds
            Show-SetupMenu
        }
        '7' {
            Set-IOCInformation
            Show-SetupMenu
        }
        'M' {
            Show-MainMenu
        }
  
    }
}

Function Show-HuntMenu {
    param (
        [string]$Title = "Hunt Menu"
        )
    Clear-Host

    DisplayLogo

    Write-Host ""
    Write-Host "================ $Title ================="  -ForegroundColor Yellow 
    Write-Host ""

    $options=
@" 
            [1] : Check for Known File IOCs
            [2] : Check for Known Scheduled Task IOCs
            [3] : Check for Known Registry IOCs
            [4] : Check for Known IP Address IOCs
            [5] : Check for Known Domain Name IOCs
            [M] : Return to Main Menu
            [Q] : Exit the Program
"@

    $options

    Write-Host ""

    Write-Host "Please make a selection: " -NoNewLine -ForegroundColor yellow
    $selection = Read-Host 
    
    switch ($selection)
    {
        
        '1' {
            Write-Host "Searching the Remote System for Known File IOCs..." -ForegroundColor Cyan
            Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Yellow
            Read-Host "Do you want to Display the results to the console: yes or no"
            Find-FileIOCs
        }
        '2' {
            Write-Host "Searching the Remote System for Known Scheduled Tasks IOCs..." -ForegroundColor Cyan
            Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Yellow
            Read-Host "Do you want to Display the results to the console: yes or no"
          
            Find-ScheduledTaskIOCs
        }
        '3' {
            Write-Host "Searching the Remote System for Known Registry IOCs..." -ForegroundColor Cyan
            Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Yellow
            Read-Host "Do you want to Display the results to the console: yes or no"

            Find-RegistryIOCs
        }
        '4' {
            Write-Host "Searching the Remote System for Known IP Address IOCs..." -ForegroundColor Cyan
            Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Yellow
            Read-Host "Do you want to Display the results to the console: yes or no"
            Find-IpIOCs
        }
        '5' {
            Write-Host "Searching the Remote System for Known Domain Name IOCs..." -ForegroundColor Cyan
            Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Yellow
            Read-Host "Do you want to Display the results to the console: yes or no"
            Find-DomainIOCs
        }
        'M' {
            Show-MainMenu
        }
    }
 }
 
 Function Show-SystemInfoMenu {       
    param (
        [string]$Title = "System Information Menu"
        )
    Clear-Host
    DisplayLogo
    Write-Host " "
    Write-Host "================ $Title =================" -ForegroundColor Yellow
    Write-Host " "
    $options=
@" 
            [1] : List Common Registry Persistence Keys
            [2] : List Sticky Keys Registry Keys
            [3] : List All Registered Scheduled Tasks
            [4] : Find A Specific File on the C: Drive
            [5] : List Directory Contents
            [6] : List Services
            [7] : List Processes
            [8] : List AutoRuns
            [9] : Get User Information
            [10] : Get Group Information
            [11] : Get LocalGroup Information
            [12] : Get Network Shares #Still in Progress
            [13] : Get Logical Drives
            [14] : Get HotFixes
            [M] : Return to the Main Menu
            [Q] : Exit the Program

"@    
    
    $options

    Write-Host ""
    Write-Host "Please make a selection: " -NoNewLine -ForegroundColor Yellow
    $selection = Read-Host 
    
    switch ($selection) {
           
        '1' {
            Write-Host "Getting contents of registry keys for common persistence locations..." -ForegroundColor Cyan
            Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Cyan
            $SysInfo = 'True'
            List-PersistentRegistryKeys
            $SysInfo = 'False'
        }
        '2' {
            Write-Host "Getting contents of registry keys that are set during a sticky keys attack..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Check-StickyKeys
            $SysInfo = 'False'
        }
        '3' {
            Write-Host "Getting scheduled tasks..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-SchTasks
            $SysInfo = 'False'
        }
        '4' {
            Write-Host "Checking the filesystem for a specific file..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Invoke-FindFile
            $SysInfo = 'False'
        }
        '5' {
            Write-Host "Listing the contents of a specified directory location..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-DirectoryContents
            $SysInfo = 'False'
        }
        '6' {
            Write-Host "List all services on the remote system..." -ForegroundColor Cyan
            
            $SysInfo = 'True'
            Get-ServiceInfo
            $SysInfo = 'False'
        }
        '7' {
            Write-Host "List all autoruns on the remote system..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-ProcessInfo
            $SysInfo = 'False'
        }
        '8' {
            Write-Host "List all autoruns on the remote system..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-AutoRuns
            $SysInfo = 'False'
        }
        '9' {
            Write-Host "List all users on the remote system..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-UserInfo
            $SysInfo = 'False'
        }
        '10' {
            Write-Host "List all groups on the remote system..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-GroupInfo
            $SysInfo = 'False'
        }
        '11' {
            Write-Host "List all local groups on the remote system..." -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-LocalGroupInfo
            $SysInfo = 'False'
        }
        '12' {
            Write-Host "Getting network drive information on the remote system(s)" -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-NetworkDrives
            $SysInfo = 'False'
        }
        '13' {
            Write-Host "Getting logical drive information on the remote system(s)" -ForegroundColor Cyan
            $SysInfo = 'True'
            Get-LogicalDrives
            $SysInfo = 'False'
        }
        '14' {
            Write-Host "Getting all hotfixes that have been installed on the remote system(s)" -Foreground Cyan
            $SysInfo = 'True'
            Get-HotFixes
            $SysInfo = 'False'
        }
        'M' {
            Show-MainMenu
        }
    }
} 

Function DisplayLogo {
    Write-Host "  _____                   _    _           _   _                      _       " -ForegroundColor Red, Yellow
    Write-Host " |  __ \                 | |  / /         | | | |                    | |      " -ForegroundColor Red, Yellow
    Write-Host " | |  | |                | | / /          | | | |                    | |      " -ForegroundColor Red, Yellow
    Write-Host " | |  | |  _   _   ____  | |/ /    ____   | |_| |  _   _   _____   __| |__    " -ForegroundColor Yellow
    Write-Host " | |  | | | | | | | ___| |    \   |____|  |  _  | | | | | |  _  | |__   __|   " -ForegroundColor Green
    Write-Host " | |__| | | |_| | | |__  | |\  \          | | | | | |_| | | | | |    | |      " -ForegroundColor Green
    Write-Host " |_____/  |_____| |____| |_| \__\         |_| |_| |_____| |_| |_|    |_|      " -ForegroundColor Green
    Write-Host ""
    Write-Host ""
}   

Function Create-Baseline {
param (
        [string]$Title = "Create Baseline"
        
        )
    Clear-Host
    Write-Host "================ $Title ================="
    Write-Host " "
    Write-Host "The Baseline Menu will run a series of tasks and outputs the results of those tasks to your current working Directory."
    Write-Host "Use the Comparison Menu to run scripts that will re-run the same commands and run comparisons against this baseline."

    Write-Host " "
    $options=
@" 
            [1] : Baseline of Common Registry Keys used for Persistence
            [2] : Baseline Scheduled Tasks
            [3] : Baseline Services
            [4] : Baseline Processes
            [5] : Baseline Local User Information
            [6] : Baseline Local Group Information
            [7] : Baseline Shares
            [8] : Baseline Filesystem
            [A] : Baseline All the Things
            [M] : Return to the Main Menu
            [Q] : Exit the Program

"@    
    
    $options

    Write-Host ""
    Write-Host "Please make a selection: " -NoNewLine -ForegroundColor Yellow
    $selection = Read-Host

    switch ($selection) {
           
        '1' {
            $Baseline = 'True'
            List-PersistentRegistryKeys
            $Baseline = 'False'
            Create-Baseline
        }
        '2' {

            $Baseline = 'True'
            Get-SchTasks
            $Baseline = 'False'
            Create-Baseline
        }
        '3' {
            $Baseline = 'True'
            Get-ServiceInfo
            $Baseline = 'False'
            Create-Baseline
        }
        '4' {
            $Baseline = 'True'
            Get-ProcessInfo
            $Baseline = 'False'
            Create-Baseline
        }
        '5' {
            $Baseline = 'True'
            Get-UserInfo
            $Baseline = 'False'
            Create-Baseline
        }
        '6' {
            $Baseline = 'True'
            Get-LocalGroupInfo
            $Baseline = 'False'
            Create-Baseline
        }
        '7' {
            $Baseline = 'True'
            Get-NetworkDrives
            $Baseline = 'False'
            Create-Baseline
        }
        '8' {
            $Baseline = 'True'
            Get-FileSystemHash
            $Baseline = 'False'
            Create-Baseline
        }
        'A' {
            $Baseline = 'True'
            List-PersistentRegistryKeys
            Get-ServiceInfo
            Get-SchTasks
            Get-ProcessInfo
            Get-UserInfo
            Get-LocalGroupinfo
            Get-NetworkDrives
            Get-FileSystemHash
            $Baseline = 'False'
            Create-Baseline
        }
        'M' {
            Show-MainMenu
        }
    }
}        
  
Function Set-ExPol {
    Write-Host "Setup the Execution Policy on the box..." -ForegroundColor Cyan
    if((Get-ExecutionPolicy) -ne 'Unrestricted') 
    { 
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
        Write-Host "Execution Policy is set to Bypass." -ForegroundColor Green
    }
    else {
        Write-Host "Execution Policy is already set." -ForegroundColor Green
    }
}

Function Set-WorkingDirectory {
    Write-Host "You can specify a working directory or use the current working directory to save your results." -ForegroundColor Cyan

    $wd = Read-Host "Do you want to save your work in the current working directory @ '$pwd'?" 
    
    if ($wd -eq 'yes') {
        
        $global:Directory = $pwd.Path

    }
    else {
    
        $path = Read-Host "Please enter the path to your working directory"
    
        $global:Directory = $path
        $pathBase = $path.split('\')[!-1]
        $folder = $path.split('\')[-1]
    
        Write-Host "Checking if the current working directory exists..." -ForegroundColor Cyan 
        If ([System.IO.Directory]::Exists($Directory)) {
            Write-Host ""
            Write-Host "Current Working Directory exists at $Directory"
        
        }
        else {
            Write-Host "Current Directory doesn't exist..." -ForegroundColor Cyan
            Write-Host "Setting up your working directory @ $Directory" -ForegroundColor Cyan
            new-item -Path "$pathBase" -Name "$folder" -ItemType Directory
        }
    }

    cd $Directory
    Write-Host ""
    Write-Host "The Working Directory is set @ $Directory" -ForegroundColor Green
    
    Write-Host "Please hit enter to continue" -NoNewline -ForegroundColor Yellow
    $input = Read-Host
} 

Function Create-HostDirectory {
    Write-Host "Setting up a directory in the working directory for each discovered host." -ForegroundColor Cyan
    foreach ($h in $hosts) {
        
        Write-Host " "
        Write-Host "Checking if the host directory: $h exists..." -ForegroundColor Cyan
        Write-Host " "
        If (Test-Path $h) {
            Write-Host "The host directory: $h already exists in your working directory: $Directory" -ForegroundColor Green
            Write-Host " "
        }
        else {
            Write-Host "The host directory doesn't exist..." -ForegroundColor Cyan
            Wrtie-host " "
            Write-Host "Creating the host directory in your working directory: $Directory..." -ForegroundColor Cyan
            new-item -Path "$Directory" -Name "$h" -ItemType Directory
            Write-Host "The host directory: $h has been created in your working directory: $Directory..." -ForegroundColor Green
        } 
    }
}      

    
Function Set-TrustedHosts {
        Param (
        [string]$TrustedHosts
        )
        
        Enable-PSRemoting -Force -SkipNetworkProfileCheck
        
        Write-Host "Setting up the Trusted Hosts file..." -ForegroundColor Cyan

        #Set the path for trusted Hosts
        $trustedhostpath = "WSMan:\localhost\Client\TrustedHosts"
        
        $subnet = Read-Host "Enter a subnet for your IP address range (Example: 172.16.12.*)"
        Write-Host "Checking information on Trusted Hosts..." -ForegroundColor Cyan
        #check if the $subnet is part of trusted hosts, if not, add the subnet ot 
        if((Get-Item -Path $trustedhostpath).Value -ne $subnet) 
        { 
            Write-Host "Setting Trusted Host information for Trusted Hosts..." -ForegroundColor Cyan
            Set-Item $trustedhostpath -Value * -Force 
        }
        Write-Host "Information on Trusted Host is set..." -ForegroundColor green

        Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
        $Input = Read-Host 
    }

Function Set-Hosts {
  
    
    Write-Host "You can load a host file from the current directory or let the system discover it from the subnet provided." -ForegroundColor Cyan     
    
    $Input_Host_File = Read-Host "Do you want to specify the path to a host file?"
    Write-Host "Host file must be located in $Directory." -ForegroundColor Cyan
    Write-Host "Hit ENTER to continue." -ForegroundColor Yellow
    Read-Host
     
    $Remote_Hosts = Read-Host "Please enter the name of the host file in $Directory "
    #Write-Host "$Remote_Hosts"
    
    if ($Input_Host_File -eq 'yes') {
        if (Test-Path "$Remote_Hosts") {
            $global:hosts = @(Get-Content "$Remote_Hosts")
        }
    }
    else {
        
        New-Item -Path . -Name "Remote-Hosts.txt" -ItemType "File"  

        Write-Host "This will take several minutes for a /24 Subnet." -ForegroundColor Yellow
        $global:network = Read-Host "Enter your target network ending in a zero: "
        $global:start = Read-Host "Enter the first IP address in the target network: "
        $global:end = Read-Host "Enter the last IP address in the target network: "
        $global:pings = Read-Host "Enter the $ of pings to attempt: "
        Find-RemoteHosts -network $network -start $start -end $end -ping $pings
        $global:hosts = @(Get-Content "Remote-Hosts.txt")
    }

    Create-HostDirectory

    Write-Host "Hosts have been identified and directories are set..." -ForegroundColor Green

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    $input = Read-Host
}

Function Find-RemoteHosts {
    [cmdletbinding()]
    Param(
    [Parameter(HelpMessage="Enter an IPv4 subnet ending in 0.")]
    [ValidatePattern("\d{1,3}\.\d{1,3}\.\d{1,3}\.0")]
    [string]$network,
    #$Subnet= ((Get-NetIPAddress -AddressFamily IPv4).Where({$_.InterfaceAlias -notmatch "Bluetooth|Loopback"}).IPAddress -replace "\d{1,3}$","0"),
 
    [ValidateRange(1,254)]
    [int]$start,
 
    [ValidateRange(1,254)]
    [int]$end,
 
    [ValidateRange(1,10)]
    [Alias("count")]
    [int]$ping = 1
    )
    
    $Remote_Hosts_Path = "Remote-Hosts.txt"

    Write-Host "Pinging $network from $start to $end"
    Write-Host "Testing with $ping pings(s)"
 
    $proghash = @{
     Activity = "Ping Sweep"
     CurrentOperation = "None"
     Status = "Pinging IP Address"
     PercentComplete = 0
    }

    $count = ($end - $start)+1
    
    $base = $network.split(".")[0..2] -join "."
    $i = 0
 
    while ($end - $start) {
      $i++
      #calculate % processed for Write-Progress
      $progHash.PercentComplete = ($i/$count)*100
 
      #define the IP address to be pinged by using the current value of $start
      $IP = "$base.$start" 
 
      #Use the value in Write-Progress
      $proghash.currentoperation = $IP
      Write-Progress @proghash

      #test the connection
      if (Test-Connection -ComputerName $IP -Count $ping -Quiet) {
        #if the IP is not local get the MAC
        Write-Host "Host [$IP] responded to ping!" -ForegroundColor Green
        $IP | Out-File -FilePath $Remote_Hosts_Path -Append -Force
        }
        $start++
    }          
  
} 

         
Function Set-Creds {
    Write-Host "Setting up Credentials to use on the remote host(s)..." -ForegroundColor Cyan
    
    $Domain = Read-Host "Enter the domain short name " 
    $UserName = Read-Host "Enter the username to connect to the remote system(s)"
    
    $domainCreds = "$Domain\$Username"

    $password = Read-Host "Please enter the password to connect to the remote system(s)" -AsSecureString

    #Add a variable for credentials
    $UserPassSecure = $password 
    $UserCredentials = New-Object -TypeName System.Management.Automation.PSCredential $domainCreds,$UserPassSecure 
        
    
    $global:UserCredentials = New-Object -TypeName System.Management.Automation.PSCredential $domainCreds,$UserPassSecure
    Write-Host "User Credentials loaded..." -ForegroundColor Green

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    

}
    
Function Set-IOCInformation {
    Write-Host "Verify that IOC text files have been loaded into $Directory\." -ForegroundColor Cyan
    Write-Host " "
    Write-Host "Files must be named: files.txt, ips.txt, keys.txt, jobs.txt, domains.txt" -ForegroundColor Cyan 
    Write-Host " "
    Write-Host "Hit Enter to Continue" -ForegroundColor yellow
    Write-Host "Gathering IOC Information G..." -ForegroundColor Cyan
    Write-Host " "
                
    $global:fileIOCs = @(Get-Content "$Directory\files.txt")
    $global:ipIOCs = @(Get-Content "$Directory\ips.txt")
    $global:regIOCs = @(Get-Content "$Directory\keys.txt")
    $global:taskIOCs = @(Get-Content "$Directory\jobs.txt")
    $global:domainIOCs = @(Get-Content "$Directory\Domains.txt")
    $fileCount = $fileIOCs.Count
    $ipCount = $ipIOCs.Count
    $regCount = $regIOCs.Count
    $taskCount = $taskIOCs.Count
    $domainCount = $domainIOCs.Count
    Write-Host "Loading $fileCount known file IOCs..." -ForegroundColor Cyan
    Write-Host "Loading $ipCount known IP IOCS..." -ForegroundColor Cyan
    Write-Host "Loading $regCount known Registry IOCs..." -ForegroundColor Cyan
    Write-Host "Loading $taskCount known Scheduled Task IOC..." -ForegroundColor Cyan
    Write-Host "Loading $domainCount known Domain IOCs..." -ForegroundColor Cyan
    Write-Host ""
    Write-Host "IOC Information has been set..." -ForegroundColor Green

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    
    
} 
          
#Uses IOC files to search the C:\ and returns matches. WORKING!
Function Find-FileIOCs {
    Write-Host "Enumerating files that match IOCs..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "File Investigation"
    CurrentOperation = "None"
    Status = "Checking Hosts for known APT Suspicious Files"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar

        try {
            $File_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
            Get-ChildItem -Path c:\ -Include $using:fileIOCs -Recurse -Force -ErrorAction SilentlyContinue | 
            Select-Object -Property Name,Directory,CreationTime,CreationTimeUtc,LastAccessTime,LastAccessTimeUtc,LastWriteTime,LastWriteTimeUtc
            }
    
            if ($OutPut_To_File -eq "yes") {
                foreach ($result in $File_Results) {
                $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_IOCFileResults_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $Schtasks_Results) {
                    $result
                }
            }
        }
        
        catch {
            $e = $_.Exception
            $LineNumber = $_.InvocationInfo.ScriptLineNumber
            Write-Host "Exception     : $e" -ForegroundColor Red 
            Write-Host "Line number   : $LineNumber"  -ForegroundColor Red
            Write-Host "Help Info     : Input expected is either a path to a file or comma separated list of IPv4 addresses" -ForegroundColor Yellow
        
        
            #$msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }    
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    Show-HuntMenu
}
   
#Find ScheduledTasks on a system that match IOCs
Function Find-ScheduledTaskIOCs {

    Write-Host "Enumerating Scheduled Tasks that match known IOCs..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Checking for known APT Scheduled Tasks"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
    $i++
    $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
    $ProgressBar.CurrentOperation = $h
    Write-Progress @ProgressBar

        try {
    
            $Schtasks_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
            #Look for specific jobs on a system that match Scheduled Tasks IOCS
                foreach ($task in $using:taskIOCs) {
                Get-ScheduledTask -ErrorAction SilentlyContinue | where { $_.TaskName -eq $task } | 
                Select-Object -Property * -ExpandProperty Actions | Select-Object Date,Taskname,Arguments,Execute
                    }
                }

            $Schtask_Results_Count = $Schtasks_Results.Count

            Write-Host "$Schtasks_Results_Count Scheduled Task IOCs were found on the system $h"   
    

                if ($OutPut_To_File -eq "yes") {
                    foreach ($result in $Schtasks_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_IOCSchTasksResults_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                    }
                }
                else {
                    foreach ($result in $Schtasks_Results) {
                        $result
                }
            }
        
        }
        catch {
                $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
                $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    clear-host    
    Show-HuntMenu
}
    
#findregs will search thru the primary registry runkeys to match a list of IOCs
Function Find-RegistryIOCs {
    Write-Host "Enumerating Registry Keys that match IOCs..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "Registry Investigation"
    CurrentOperation = "None"
    Status = "Checking for known APT Registry Key\Value Pairs"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $RunKey_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                foreach ($ioc in $using:RegIOCs) {
            
                    (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -ErrorAction SilentlyContinue).PSObject.Properties | 
                    Where { $_.Name -eq $ioc } | Select-Object -Property PSComputerName,Name,Value
                    (Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -ErrorAction SilentlyContinue).PSObject.Properties | 
                    Where { $_.Name -eq $ioc } | Select-Object -Property PSComputerName,Name,Value
 
                    }
        
                }
        
                if ($Output_To_File -eq 'yes') {
                    foreach ($result in $RunKey_Results) {
                        $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                        Export-Csv -InputObject $result -Path c:\IOC_RunKey_results_$enddate.csv -NoTypeInformation -Append
                    }
                }
                else {
                  foreach ($result in $RunKey_Results) {
                    $result
                }
            }
        }
        catch {
        $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message 
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    Show-HuntMenu   
}
    
#findips will loop thru each host, Get the TCP Connection Remote Addresses, and then compare those addresses to the IOC list.
Function Find-IpIOCs {
    Write-Host "Enumerating Network Connections to IPs that match IOCs..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "Network Connections Investigation"
    CurrentOperation = "None"
    Status = "Checking for known APT IPs"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
    
        try {

            $IP_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                $results = ((Get-NetTCPConnection).RemoteAddress)
                Compare-Object -ReferenceObject $using:IPIOCs -DifferenceObject $results -IncludeEqual | Where { $_.SideIndicator -eq '==' } | 
                Select -Property 'InputObject','PSComputerName'
            }
    
    
            if ($Output_To_file -eq 'yes') {
                foreach ($result in $IP_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path c:\IOC_IP_results_$enddate.csv -NoTypeInformation -Append
                   }
            }
            else {
                foreach ($result in $IP_Results) {
                    $result
                }
            }
        }
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }    

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    Show-HuntMenu
}

#finddomains will loop thru a list of domain IOCs and check the DnsClientCache of each host for each IOC
Function Find-DomainIOCs {
    Write-Host "Enumerating Domain Names that the system connected with that match IOCs..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "DNS Request Investigation"
    CurrentOperation = "None"
    Status = "Investigating known APT Domain Names"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
    
        try {
        
            $Domain_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                foreach ($name in $using:domainIOCs) {
                Get-DnsClientCache | Where { $_.Entry -eq $name }
                } 
            }
    
            if ($Output_To_File -eq 'yes') {
                foreach ($result in $Domain_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path c:\IOC_Domain_results.csv -NoTypeInformation -Append
                }
            }
            else {
                foreach ($result in $Domain_Results) {
                    $result
                }
            }
        }
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    Show-HuntMenu
}

#NOTE: Need to add all major persistence keys following the class...
Function List-PersistentRegistryKeys {
    Write-Host " "
    Write-Host "Enumerating Common Registry Run Keys used for Persistence..." -ForegroundColor Cyan
    Write-Host " " 
    
    $Output_To_File = Read-Host "Do you want to output the results to csv: yes or no ?"
        
    $ProgressBar = @{
    Activity = "Registry Key Enumeration"
    CurrentOperation = "None"
    Status = "Enumerating Registry Key\Values for Host:"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {

            $Persistence_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                #Dump all of the primary run key
                Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ -ErrorAction SilentlyContinue
                Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ -ErrorAction SilentlyContinue
        
            }
    
            if ($Output_To_File -eq 'yes') {
                foreach ($result in $Persistence_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_PersistentRegistryKeys_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $Persistence_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }

        catch {
            $e = $_.Exception
            $lineNumber = $_.InvocationInfo.ScriptLine
            #$msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            #$_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    
    Clear-Host

    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}

#Enumerate the Registry keys that are set when sticky keys is enabled...
#NOT COMPLETE - needs testing and see if this can be more precise to the sticky keys exploit
Function  Check-StickyKeys {
    Write-Host " "
    Write-Host "Enumerating Registry to check for sticky keys..." -ForegroundColor Cyan
        
    $Output_To_File = Read-Host "Do you want to output the results to csv: yes or no ?"
    
    $ProgressBar = @{
    Activity = "Sticky Key Attack Check"
    CurrentOperation = "None"
    Status = "Enumerating Sticky Key Values for Host:"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $StickyIcky_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
            Get-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\StickyKeys' -ErrorAction SilentlyContinue
        
            }
    

            if ($Output_To_File -eq 'yes') {
                foreach ($result in $StickyIcky_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_StickyKeysCheck_$($enddate).csv" -NoTypeInformation -Append -Force -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $StickyIcky_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }    
    Write-Host "Hit ENTER to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Get-SchTasks{
    Write-Host "Gathering all Registered Scheduled Tasks on the Remote System..." -ForegroundColor yellow
    Write-Host "Results can be Displayed to console or sent to a csv file." -ForegroundColor Yellow
            
    $Output_To_File = Read-Host "Do you want to Display the results to the csv: yes or no ?"

    $ProgressBar = @{
    Activity = "Scheduled Task Enumeration"
    CurrentOperation = "None"
    Status = "Enumerating Scheduled Tasks for host:"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $Schtasks_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                Get-ScheduledTask -ErrorAction SilentlyContinue 
            
            }
    

            if ($Output_To_File -eq 'yes') {
                foreach ($result in $Schtasks_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_ScheduledTasks_$($enddate).csv" -NoTypeInformation -Append -Force -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $SchTasks_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }

    Write-Host "Hit ENTER to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Invoke-FindFile {
    Write-Host " "
    $filename = Read-Host "Enter the filename: " 
                
    Write-Host "Recursively Dir the C:\ looking for $filename..." -ForegroundColor Cyan
    Invoke-Command -ComputerName $hosts -Credential $UserCredentials -ScriptBlock {
    #Recursively search the c drive for the filename
    Get-ChildItem c:\ -Include $using:filename -Recurse -Force -ErrorAction SilentlyContinue
    
    }
    
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host    
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}

Function Get-DirectoryContents {
    Write-Host " "
    Write-Host "Recursively Dir a specific path on the host(s) provided at the command line..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Getting Directory Contents"
    PercentComplete = 0
    }
    
    $i = 0

    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        $Directory_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
            #Recursively search the c drive for the filename provided at command line
            Get-ChildItem $using:path -Force -ErrorAction SilentlyContinue
           
        }

        if ($Output_To_File -eq 'yes') {
            foreach ($result in $Directory_Results) {
                $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_DirectoryContents_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
            }
        }
        else {
            foreach ($result in $Directory_Contents) {
                $result
            }
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    $input = Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}

#Need to Add functionality to list just running Services
Function Get-ServiceInfo {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Gathering Service Info"
    PercentComplete = 0
    }
    
    $i = 0      
           
    Write-Host "Getting the Taskname,DisplayName and Status for all services on the remote system(s)..." -ForegroundColor Cyan
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
                
        $Service_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
    
        Get-Service -ErrorAction SilentlyContinue | Select-Object -Property name,displayname,status
         
        }

            if ($Output_To_File -eq 'yes') {
                foreach ($result in $Service_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_ServicesInfo_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                    }
                }
            else {

                foreach ($result in $Service_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    Write-Host "Please hit enter to continue" -NoNewline -ForegroundColor Yellow
    $input = Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}

Function Get-ProcessInfo {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"
          
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Gathering Process Information"
    PercentComplete = 0
    }
    
    $i = 0
           
    Write-Host "Getting the Taskname,DisplayName and Status for all services on the remote system(s)..." -ForegroundColor Cyan
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $Process_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                Get-WMIObject -class win32_Process | select processname,processid,commandline
        
            }

            if ($Output_To_File -eq 'yes') {
                foreach ($result in $Process_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_Processes_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                    }
                }
            else {

                foreach ($result in $Process_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Get-Hotfixes {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Gathering Information on Hot Fixes"
    PercentComplete = 0
    }
    
    $i = 0

    Write-Host "Getting information on what KBs have been patched..." -ForegroundColor Cyan
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $Patch_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                Get-Hotfix
                }
        
            if ($Output_To_File -eq "yes") {
                foreach ($result in $Patch_Results) {
                Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_HotFix_Information_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $Patch_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }
        
        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Get-AutoRuns {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Checking AutoRun Locations"
    PercentComplete = 0
    }
    
    $i = 0

    Write-Host "Getting host autorun information..." -ForegroundColor Cyan
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $AutoRun_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                Get-CimInstance Win32_StartupCommand | Select-Object Name,command,location,User | fl
           
            }
    

            if ($Output_To_File -eq "yes") {
                foreach ($result in $AutoRun_Results) {
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_AutoRuns_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $AutoRun_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Get-UserInfo {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"
    Write-Host "Getting information about users on the system..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Gathering User Information from each host"
    PercentComplete = 0
    }
    
    $i = 0

    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
    
        try {

            $User_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
            #If Lockout is True, the account is locked.
               #Update later so that PasswordExpires is the Date. 
               Get-CimInstance Win32_UserAccount | Select-Object Name,Fullname,Domain,Lockout,PasswordExpires,SID
            }
    

            if ($Output_To_File -eq "yes") {
                foreach ($result in $User_Results) {
                    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_UserInfo_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $User_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host 
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Get-GroupInfo {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"
    
    Write-Host "Getting information about groups on the system..." -ForegroundColor Cyan
    
    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Gathering Group Information from each host"
    PercentComplete = 0
    }
    
    $i = 0

    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $Group_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                #If Lockout is True, the account is locked.
                #Update later so that PasswordExpires is the Date. 
                Get-CimInstance Win32_Group | Select-Object Name,Domain,Description,SID
            }
    
            if ($Output_To_File -eq "yes") {
                foreach ($result in $User_Results) {
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_UserInfo_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $User_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
    
Function Get-LocalGroupinfo {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no"

    $ProgressBar = @{
    Activity = "Scheduled Task Investigation"
    CurrentOperation = "None"
    Status = "Gathering Group Information from each host"
    PercentComplete = 0
    }
    
    $i = 0

    Write-Host "Getting information about what users are in the localgroup Administrators..." -ForegroundColor Cyan
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar
        
        try {
        
            $LocalAdmin_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                Get-LocalGroupMember -Name Administrators
            }

            if ($Output_To_File -eq "yes") {
                foreach ($result in $LocalAdmin_Results) {
                    Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_UserInfo_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                }
            }
            else {
                foreach ($result in $LocalAdmin_Results) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host
    Clear-Host
    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}


Function Get-NetworkDrives {
    $Output_To_File = Read-Host "Do you want write the results to a csv file: yes or no" 
    #Retrieve network drives from remote hosts
    foreach ($h in $hosts) {
        
        try {
        
            $Share_Results = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
                Get-WmiObject Win32_MappedLogicalDisk | Select Name, ProviderName, FileSystem, Size, FreeSpace | Format-Table
                }

            if (!$Share_Results) {
                Write-Host "$h does not have mapped shares" -ForegroundColor Green
            }
            else {
                if ($Output_To_File -eq "yes") {
                    foreach ($result in $Share_Results) {
                        Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_Shares_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
                    }
                }
                else {
                    foreach ($result in $User_Results) {
                        $result
                    }
                Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
                Read-Host
                }
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }
    

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    Read-Host

    if ($SysInfo) {
        Show-SystemInfoMenu
    }
}
 
Function Get-LogicalDrives {

    $Output_To_File = Read-Host "Do you want to export the results to a csv file, yes or no?"
    $enddate = (Get-Date).ToString('yyyyMMdd_hhmmss')

    #Retrieve network drives from remote hosts
   
    foreach ($h in $hosts) {
        
        try {
            Write-Host $h
            $global:DriveInfo = Invoke-Command -ComputerName $h -Credential $UserCredentials -ScriptBlock {
            
                Get-PSDrive -PSProvider FileSystem 
            }    
    
    
            if ($Output_To_File -eq 'yes') {

                foreach ($result in $DriveInfo) {
                    Export-Csv -InputObject $result -Path c:\NetworkDrives_$enddate.csv -NoTypeInformation -Append
                }
            }
            else {
                foreach ($result in $DriveInfo) {
                    $result
                }
            Write-Host "Hit ENTER when you are ready to see the next host." -NoNewLine -ForegroundColor yellow
            Read-Host
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
    }

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    $inpuy = Read-Host

    if ($SysInfo) {
        Show-SystemInfoMenu
    }
    
}

Function Get-FileSystemHash {
    $enddate = (Get-Date).ToString("yyyyMMdd_hhmmss")
    Write-Host ""

    Write-Host "Creating a baseline of the filesystem..." -ForegroundColor Cyan
    Write-Host "This will take a long time..." _ForegroundColor Cyan

    $ProgressBar = @{
    Activity = "Creating System Baseline"
    CurrentOperation = "None"
    Status = "Hashing the Filesystem"
    PercentComplete = 0
    }
    
    $i = 0
    
    foreach ($h in $hosts) {
        $i++
        $ProgressBar.PercentComplete = ($i/$hosts.Count)*100
        $ProgressBar.CurrentOperation = $h
        Write-Progress @ProgressBar

        try {     
         
            #Execute commands on the remote host to take an MD5 hash of all items in the C:\ and store those result in the $Hash_Results variable.
            $global:Hash_Results = Invoke-Command -Computername $h -Credential $UserCredentials -ScriptBlock {
                $driveRoot = Get-PSDrive -PSProvider FileSystem
             
            
                foreach ($drive in $driveRoot) {
                    #$drive.root
                    #Recursively identify the contents of each drive
                    Get-ChildItem  c:\ -Include * -Recurse -Force -ErrorAction SilentlyContinue |
                    #Take an MD5 Hash of those objects
                    Get-Filehash -Algorithm MD5 -ErrorAction SilentlyContinue
                }
            }
             
         
        
            foreach ($result in $global:Hash_Results) {
                #Export the hashes to a files without the additional header
                #$result
                Export-Csv -InputObject $result -Path "$Directory\$h\$($h)_HashList_$($enddate).csv" -NoTypeInformation -Append -ErrorAction SilentlyContinue
            }
        }

        catch {
            $msg = "Error: Failed on line number '{0}' column '{1}' ('{2}'). The error was '{3}'." -f 
            $_.Exception.Line, $_.Exception.Offset, $_.Exception.CommandInvocation.Line.Trim(), $_.Exception.Message
        }
          
    } 

    Write-Host "Please hit ENTER in to continue."  -NoNewLine -ForegroundColor yellow
    $input = Read-Host
    
    Show-MainMenu
}

Show-MainMenu