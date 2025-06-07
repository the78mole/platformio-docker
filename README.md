# 🧰 platformio-docker

Docker-based development image with pre-installed PlatformIO for IoT and embedded development.  
Includes PlatformIO CLI, build tools, and development utilities for Arduino, ESP32, ESP8266, and other embedded platforms.

![Build](https://github.com/the78mole/platformio-docker/actions/workflows/build-check.yml/badge.svg)
![Release](https://github.com/the78mole/platformio-docker/actions/workflows/release.yml/badge.svg)
![Version](https://img.shields.io/github/v/tag/the78mole/platformio-docker?label=version&sort=semver)
![License](https://img.shields.io/github/license/the78mole/platformio-docker)
![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovatebot)

---

## 🧰 Using as a Devcontainer

You can use this image directly in a Devcontainer setup for PlatformIO development with Arduino, ESP32, ESP8266, and other embedded platforms.

### Example: .devcontainer/devcontainer.json
```json
{
  "name": "PlatformIO Development",
  "image": "ghcr.io/the78mole/platformio-docker:latest",
  "features": {},
  "customizations": {
    "vscode": {
      "extensions": [
        "platformio.platformio-ide"
      ]
    }
  },
  "forwardPorts": [8008],
  "remoteUser": "vscode"
}
```

## 📦 Included Tools

| Category         | Tools                                                             |
|------------------|--------------------------------------------------------------------|
| **PlatformIO**   | `platformio` CLI, platform-specific toolchains, udev rules       |
| **Development**  | `git`, `curl`, `pre-commit`                                       |
| **Python**       | `python3`, `pip`, `venv`                                          |

---

## 📤 Availability

This image is automatically published to GitHub Container Registry (`ghcr.io`) on each merge to `main`:

```text
ghcr.io/the78mole/platformio-docker:latest
ghcr.io/the78mole/platformio-docker:vX.Y.Z
```

## 🚀 Quick Start

### Using the image directly
```bash
# Pull the image
docker pull ghcr.io/the78mole/platformio-docker:latest

# Run a container with current directory mounted
docker run --rm -it --device=/dev/ttyUSB0 \
  -v $(pwd):/workspace \
  ghcr.io/the78mole/platformio-docker:latest

# Initialize a new PlatformIO project
pio project init --board esp32dev

# Build the project
pio run

# Upload to device (if connected)
pio run --target upload
```

### Supported Platforms
This image supports all platforms that PlatformIO supports, including:
- **Arduino**: Uno, Nano, Mega, Leonardo, etc.
- **Espressif**: ESP32, ESP8266, ESP32-S2, ESP32-C3
- **STM32**: Various STM32 microcontrollers
- **Raspberry Pi Pico**: RP2040-based boards
- And many more...

## 🔌 USB Device Access
When using the container with physical devices, you may need to pass USB devices:
```bash
docker run --rm -it --device=/dev/ttyUSB0 --device=/dev/ttyACM0 \
  -v $(pwd):/workspace \
  ghcr.io/the78mole/platformio-docker:latest
```

