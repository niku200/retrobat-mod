#!/bin/bash

# Check if RetroBat installer is present
INSTALLER_FILE="retrobat_installer.zip"

if [ ! -f "$INSTALLER_FILE" ]; then
    echo "RetroBat installer not found! Downloading..."
    # Download the RetroBat installer
    curl -L -o "$INSTALLER_FILE" "https://retrobat.github.io/installer/retrobat_installer.zip"
else
    echo "RetroBat installer found."
fi

# Extract and run RetroBat installer in silent mode
echo "Running RetroBat installer..."
unzip -o "$INSTALLER_FILE"
./RetroBatInstaller --silent --install --destination "./retrobat"

# Final message
echo "RetroBat setup has been completed in the /retrobat folder!"