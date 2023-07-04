# MIT License
#
# Copyright (c) 2019 Nathaniel Brough
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

_WINDOWS_9 = {
    "full_version": "9.2.1",
    "remote_compiler": {
        "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-win32.zip",
        "sha256": "49d6029ecd176deaa437a15b3404f54792079a39f3b23cb46381b0e6fbbe9070",
        "strip_prefix": "",
    },
}

_PLATFORM_SPECIFIC_CONFIGS_9 = {
    "linux": {
        "full_version": "9.2.1",
        "remote_compiler": {
            "url":"https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/RC2.1/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2",
            "sha256": "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a",
            "strip_prefix": "gcc-arm-none-eabi-9-2019-q4-major",
        },
    },
    "windows": _WINDOWS_9,
    "windows server 2019": _WINDOWS_9,
    "windows 10": _WINDOWS_9,
    "mac os x": {
        "full_version": "9.2.1",
        "remote_compiler": {
            "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/9-2019q4/RC2.1/gcc-arm-none-eabi-9-2019-q4-major-mac.tar.bz2",
            "sha256": "1249f860d4155d9c3ba8f30c19e7a88c5047923cea17e0d08e633f12408f01f0",
            "strip_prefix": "gcc-arm-none-eabi-9-2019-q4-major",
        },
    },
}

_WINDOWS_11 = {
    "full_version": "11.3.rel1",
    "remote_compiler": {
        "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-mingw-w64-i686-arm-none-eabi.zip",
        "sha256": "23f24595aa575fba4fdb0cb086df4b053862af60837502cb7e52bd4fb3d76c36",
        "strip_prefix": "arm-gnu-toolchain-11.3.rel1-mingw-w64-i686-arm-none-eabi",
    },
}

_PLATFORM_SPECIFIC_CONFIGS_11 = {
    "linux": {
        "full_version": "11.3.rel1",
        "remote_compiler": {
            "url":"https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz",
            "sha256": "d420d87f68615d9163b99bbb62fe69e85132dc0a8cd69fca04e813597fe06121",
            "strip_prefix": "arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi",
        },
    },
    "windows": _WINDOWS_11,
    "windows server 2019": _WINDOWS_11,
    "windows 10": _WINDOWS_11,
    "mac os x": {
        "full_version": "11.3.rel1",
        "remote_compiler": {
            "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi.tar.xz",
            "sha256": "826353d45e7fbaa9b87c514e7c758a82f349cb7fc3fd949423687671539b29cf",
            "strip_prefix": "arm-gnu-toolchain-11.3.rel1-darwin-x86_64-arm-none-eabi",
        },
    },
}

_WINDOWS_12 = {
    "full_version": "12.2.rel1",
    "remote_compiler": {
        "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi.zip",
        "sha256": "ad1427496cde9bbe7604bc448ec6e115c6538e04af1c8275795ebb1c2b7b2830",
        "strip_prefix": "arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi",
    },
}

_PLATFORM_SPECIFIC_CONFIGS_12 = {
    "linux": {
        "full_version": "12.2.rel1",
        "remote_compiler": {
            "url":"https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz",
            "sha256": "84be93d0f9e96a15addd490b6e237f588c641c8afdf90e7610a628007fc96867",
            "strip_prefix": "arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi",
        },
    },
    "windows": _WINDOWS_12,
    "windows server 2019": _WINDOWS_12,
    "windows 10": _WINDOWS_12,
    "mac os x": {
        "full_version": "12.2.rel1",
        "remote_compiler": {
            "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi.tar.xz",
            "sha256": "00c0eeb57ae92332f216151ac66df6ba17d2d3b306dac86f4006006f437b2902",
            "strip_prefix": "arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi",
        },
    },
}

TOOLCHAIN_VERSIONS = {
    "9": _PLATFORM_SPECIFIC_CONFIGS_9,
    "11": _PLATFORM_SPECIFIC_CONFIGS_11,
    "12": _PLATFORM_SPECIFIC_CONFIGS_12,
}

def get_platform_specific_config(version, os_name):
    if version not in TOOLCHAIN_VERSIONS:
        fail("Toolchain configuration not available for version: ", version)
    if os_name not in TOOLCHAIN_VERSIONS[version].keys():
        fail("OS configuration not available for: {}".format(os_name))
    return TOOLCHAIN_VERSIONS[version][os_name]
