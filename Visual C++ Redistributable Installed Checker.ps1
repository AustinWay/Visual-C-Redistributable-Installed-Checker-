<#
Program: Visual C++ Redistributable Installed Checker 
Description: Powershell script that checks if Visual C++ Redistributables are installed on a local machine
Author: Austin Way
Date: 6/25/2020
#>

# Visual C++ version references found at https://theitjanitor.com/software/version-list/mscv-history/86/

# Registry paths for Visual C++ Redistributables
    # (Get-ItemProperty "HKLM:SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x86")
    # (Get-ItemProperty "HKLM:SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x64")

    $visualcredistversions = 
    "8.0.50727.42", 
    "8.0.56336", 
    "8.0.59193", 
    "8.0.59192", 
    "8.0.61001", 
    "8.0.61000",
    
    "9.0.21022",
    "9.0.30729.17",
    "9.0.30729.4148",
    "9.0.3.30729.6161", 
    
    "10.0.30319",
    "10.0.30319.415",
    "10.0.40219",
    "10.0.40219.325", 
    
    "11.0.50727.1",
    "11.0.51106.1",
    "11.0.60610.1",
    "11.0.61030.0", 
    
    "12.0.21005.1",
    "12.0.30501.0",
    "12.0.40649.5",
    "12.0.40660.0",
    "12.0.40664.0", 
    
    "14.0.23026.0",
    "14.0.23506.0",
    "14.0.23918.0",
    "14.0.24123.0",
    "14.0.24210.0",
    "14.0.24212.0",
    "14.0.24215.1",
    
    "14.10.25017.0",
    
    "14.26.28720"
    
    $visualcredistreleases = 
    "VC++ 2005", 
    "VC++ 2005 SP1", 
    "VC++ 2005 SP1 (Security Update - ATL) x86", 
    "VC++ 2005 SP1 (Security Update - ATL) x64", 
    "VC++ 2005 SP1 (Security Update - MFC) x86", 
    "VC++ 2005 SP1 (Security Update - MFC) x64",
    
    "VC++ 2008",
    "VC++ 2008 SP1",
    "VC++ 2008 SP1 (Security Update - ATL)",
    "VC++ 2008 SP1 (Security Update - MFC)",
    
    "VC++ 2010",
    "VC++ 2010 (Security Update - MFC) ~ [1]",
    "VC++ 2010 SP1",
    "VC++ 2010 SP1 (Security Update - MFC) ~ [1]",
    
    "VC++ 2012",
    "VC++ 2012 Update 1",
    "VC++ 2012 Update 3",
    "VC++ 2012 Update 4",
    
    "VC++ 2013",
    "VC++ 2013 Update 2",
    "VC++ 2013 Update 3",
    "VC++ 2013 Update 4",
    "VC++ 2013 Update 5",
    
    "VC++ 2015",
    "VC++ 2015 Update 1",
    "VC++ 2015 Update 2",
    "VC++ 2015 Update 3 RC",
    "VC++ 2015 Update 3*",
    "VC++ 2015 Update 3",
    "VC++ 2015 Update 3 Bug Fix",
    
    "VC++ 2017",
    
    "VC++ 2015-2019"
    
    $ErrorActionPreference = "stop"
    
    Try {
        $counter = 0
        foreach ($item in $visualcredistversions) {
            $index = $visualcredistversions.IndexOf($item)
            $check = (Get-ItemProperty "HKLM:SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x64").Version -ge $visualcredistversions[$index]
        
            if ($check -eq "True") {
                Write-Host -foregroundcolor "green" $visualcredistreleases[$index] $visualcredistversions[$index] "is installed"
            }
            else {
                Write-Host -foregroundcolor "red" $visualcredistreleases[$index] $visualcredistversions[$index] "is NOT installed"
            }
        
            $counter = $counter + 1
        }
        pause
    }
    Catch [System.Management.Automation.PSArgumentException]
    {
        Write-Host -foregroundcolor "yellow" "Notice: Registry Key Property missing"
        pause 
    }
    Catch [System.Management.Automation.ItemNotFoundException]
    {
        Write-Host -foregroundcolor "yellow" "Notice: Registry Key for Visual C++ Redist is missing" 
        Write-Host -foregroundcolor "red" "Visual C++ Redist is not installed"
        pause
    }
    Finally { $ErrorActionPreference = "Continue" }
