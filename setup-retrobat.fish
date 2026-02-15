#!/usr/bin/env fish

# Detect OS
set os (uname)

# Set the URL for the setup script based on OS
switch $os
    case 'Linux'
        set url 'https://github.com/your-username/your-repo/setup-linux.sh'
    case 'Darwin'
        set url 'https://github.com/your-username/your-repo/setup-macos.sh'
    case 'Windows'
        set url 'https://github.com/your-username/your-repo/setup-windows.ps1'
    case '*'
        echo "Unsupported OS: $os"
        exit 1
end

# Download and execute the setup script
echo "Setting up for OS: $os"
curl -O $url
if test "$os" = "Windows"
    powershell -ExecutionPolicy Bypass -File setup-windows.ps1
else
    chmod +x setup-*
    ./setup-*
end
