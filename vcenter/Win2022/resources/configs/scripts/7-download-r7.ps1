function Download-File {
    param (
        [string]$url,
        [string]$outputDirectory
    )

 if (-not (Test-Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory | Out-Null
        Write-Host "Directory created at $outputDirectory"
    }

 $outputPath = Join-Path -Path $outputDirectory -ChildPath (Split-Path -Path $url -Leaf)
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Write-Host "File downloaded and saved to $outputPath"
}

$url = "http://172.27.246.123/windows/agentInstaller-x86_64.msi"
$outputDirectory = "C:\temp" 

Download-File -url $url -outputDirectory $outputDirectory


