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

_WINDOWS_11 = {
    "full_version": "11.0",
    "remote_compiler": {
        "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/LLVM-11.1.0-win64.exe",
        "sha256": "b5770bbfac712d273938cd155e232afaa85c2e8d865c7ca504a104a838568516",
        "strip_prefix": "",
    },
}

_PLATFORM_SPECIFIC_CONFIGS_11 = {
    "linux": {
        "full_version": "11.0",
        "remote_compiler": {
            "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz",
            "sha256": "67f18660231d7dd09dc93502f712613247b7b4395e6f48c11226629b250b53c5",
            "strip_prefix": "clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04",
        },
    },
    "windows": _WINDOWS_11,
    "windows server 2019": _WINDOWS_11,
    "windows 10": _WINDOWS_11,
    "mac os x": {
        "full_version": "11.0",
        "remote_compiler": {
            "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-apple-darwin.tar.xz",
            "sha256": "633a833396bf2276094c126b072d52b59aca6249e7ce8eae14c728016edb5e61",
            "strip_prefix": "clang+llvm-10.0.0-x86_64-apple-darwin",
        },
    },
}

_WINDOWS_14 = {
    "full_version": "14.0",
    "remote_compiler": {
        "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/LLVM-14.0.0-win64.exe",
        "sha256": "15d52a38436417843a56883730a7e358a8afa0510a003596ee23963339a913f7",
        "strip_prefix": "",
    },
}

_PLATFORM_SPECIFIC_CONFIGS_14 = {
    "linux": {
        "full_version": "14.0",
        "remote_compiler": {
            "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz",
            "sha256": "61582215dafafb7b576ea30cc136be92c877ba1f1c31ddbbd372d6d65622fef5",
            "strip_prefix": "clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04",
        },
    },
    "windows": _WINDOWS_14,
    "windows server 2019": _WINDOWS_14,
    "windows 10": _WINDOWS_14,
    "mac os x": {
        "full_version": "14.0",
        "remote_compiler": {
            "url": "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-apple-darwin.tar.xz",
            "sha256": "cf5af0f32d78dcf4413ef6966abbfd5b1445fe80bba57f2ff8a08f77e672b9b3",
            "strip_prefix": "clang+llvm-14.0.0-x86_64-apple-darwin",
        },
    },
}


TOOLCHAIN_VERSIONS = {
    "11": _PLATFORM_SPECIFIC_CONFIGS_11,
    "14": _PLATFORM_SPECIFIC_CONFIGS_14,
}

def get_platform_specific_config(version, os_name):
    if version not in TOOLCHAIN_VERSIONS:
        fail("Toolchain configuration not available for version: ", version)
    if os_name not in TOOLCHAIN_VERSIONS[version].keys():
        fail("OS configuration not available for: {}".format(os_name))
    return TOOLCHAIN_VERSIONS[version][os_name]
