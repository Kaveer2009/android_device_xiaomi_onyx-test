#!/bin/bash

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

FAILED=0

check_and_clone() {
    local NAME="$1"
    local DIR="$2"
    local REPO="$3"

    echo -e "${BLUE}Checking ${NAME}...${NC}"

    if [ -d "$DIR" ]; then
        echo -e "${GREEN}✔ ${NAME} already exists at ${DIR}${NC}"
    else
        echo -e "${YELLOW}✘ ${NAME} not found. Cloning...${NC}"
        if git clone "$REPO" "$DIR"; then
            echo -e "${GREEN}✔ ${NAME} cloned successfully.${NC}"
        else
            echo -e "${RED}✘ Failed to clone ${NAME} from ${REPO}.${NC}"
            FAILED=1
        fi
    fi

    echo ""
}

echo -e "${BLUE}==============================${NC}"
echo -e "${BLUE}   Onyx Vendor Setup Script   ${NC}"
echo -e "${BLUE}==============================${NC}"
echo ""

check_and_clone "Vendor blobs"    "vendor/xiaomi/onyx"              "https://github.com/Kaveer2009/vendor_xiaomi_onyx.git"
check_and_clone "Kernel source"   "device/xiaomi/onyx-kernel"       "https://github.com/Kaveer2009/device_xiaomi_onyx-kernel.git"
check_and_clone "Xiaomi hardware" "hardware/xiaomi"                  "https://github.com/xiaomi-sm8750-onyx/android_hardware_xiaomi.git"
check_and_clone "Lunaris Dolby"   "packages/apps/LunarisDolby"      "https://github.com/unmoved21/packages_apps_LunarisDolby.git"
check_and_clone "Google Camera"   "vendor/xiaomi/GoogleCamera"       "https://github.com/Onyx-Hubs/vendor_xiaomi_GoogleCamera.git"

if [ "$FAILED" -eq 0 ]; then
    echo -e "${GREEN}All checks completed successfully.${NC}"
else
    echo -e "${RED}Some repositories failed to clone. Please check the errors above.${NC}"
    exit 1
fi
