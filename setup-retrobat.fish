# RetroBat Setup Script

# Setup script for RetroBat

# Include proper handling for downloading files

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to download files based on the OS
download_file() {
    case "$OSTYPE" in
      linux*)
        curl -L -o "setup-retrobat.sh" "https://raw.githubusercontent.com/niku200/retrobat-mod/main/setup-retrobat.sh"  
        ;;
      darwin*)
        curl -L -o "setup-retrobat.sh" "https://raw.githubusercontent.com/niku200/retrobat-mod/main/setup-retrobat.sh"  
        ;;
      win*)
        curl -L -o "setup-retrobat.bat" "https://raw.githubusercontent.com/niku200/retrobat-mod/main/setup-retrobat.bat"  
        ;;
      *)
        echo "Unsupported OS"
        exit 1
        ;;
    esac
}

# Downloading files to the current directory

download_file

# Check for wildcard expansion issue and handle it
if [ -e *.sh ]; then
    echo "Shell script downloaded successfully."
else
    echo "Failed to download shell script."
    exit 1
fi

if [ -e *.bat ]; then
    echo "Batch file downloaded successfully."
else
    echo "Failed to download batch file."
    exit 1
fi
