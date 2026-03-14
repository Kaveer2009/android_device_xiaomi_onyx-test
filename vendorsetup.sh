#!/bin/bash

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

check_and_clone() {
    NAME=$1
    DIR=$2
    REPO=$3

    echo -e "${BLUE}Checking ${NAME}...${NC}"

    if [ -d "$DIR" ]; then
        echo -e "${GREEN}✔ ${NAME} already exists at ${DIR}${NC}"
    else
        echo -e "${YELLOW}✘ ${NAME} not found. Cloning...${NC}"
        git clone "$REPO" "$DIR"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔ ${NAME} cloned successfully.${NC}"
        else
            echo -e "${RED}✘ Failed to clone ${NAME}.${NC}"
        fi
    fi

    echo ""
}

echo -e "${BLUE}==============================${NC}"
echo -e "${BLUE}   Onyx Vendor Setup Script   ${NC}"
echo -e "${BLUE}==============================${NC}"
echo ""

check_and_clone "Vendor blobs" "vendor/xiaomi/onyx" "https://github.com/Kaveer2009/proprietary_vendor_xiaomi_onyx.git"
check_and_clone "Kernel source" "device/xiaomi/onyx-kernel" "https://github.com/Kaveer2009/android_device_xiaomi_onyx-kernel.git"
check_and_clone "Xiaomi hardware" "hardware/xiaomi" "https://github.com/xiaomi-sm8750-onyx/android_hardware_xiaomi.git"
check_and_clone "Lunaris Dolby" "packages/apps/LunarisDolby" "https://github.com/unmoved21/packages_apps_LunarisDolby.git"
check_and_clone "Google Camera" "vendor/xiaomi/GoogleCamera" "https://github.com/Onyx-Hubs/vendor_xiaomi_GoogleCamera.git"

echo -e "${BLUE}All checks completed.${NC}"