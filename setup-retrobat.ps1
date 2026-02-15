# PowerShell script to setup Retrobat

# Function to determine the OS type
function Get-OS {
    if ($IsLinux) {
        return 'Linux'
    }
    elseif ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
        return 'Windows'
    }
    return 'Unknown'
}

# Detect operating system
$os = Get-OS

# Define the download URL for the setup script based on OS type
$downloadUrl = if ($os -eq 'Windows') {
    'https://example.com/setup-windows.ps1'
} elseif ($os -eq 'Linux') {
    'https://example.com/setup-linux.sh'
} else {
    Write-Host 'Unsupported OS type.'
    exit
}

# Specify the local file name
$localFile = "setup_script.$($os.ToLower()).ps1"

# Check if the file exists locally
if (-Not (Test-Path $localFile)) {
    # Download the setup script
    Invoke-WebRequest -Uri $downloadUrl -OutFile $localFile
}

# Execute the setup script with the current directory as root
if ($os -eq 'Windows') {
    & .\$localFile
} elseif ($os -eq 'Linux') {
    chmod +x ./$localFile
    ./$localFile
}