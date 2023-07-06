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

load("//toolchains/compilers/gcc_arm_none_eabi/impl:gcc_arm_none_versions.bzl", "TOOLCHAIN_VERSIONS", "get_platform_specific_config")
load("//toolchains/tools/include_tools:include_tools.bzl", "include_tools")

def _com_gcc_arm_none_repository_impl(repository_ctx):
    version = repository_ctx.attr.version
    remote_toolchain_info = get_platform_specific_config(version, repository_ctx.os.name)

    repository_ctx.download_and_extract(
        url = remote_toolchain_info["remote_compiler"]["url"],
        sha256 = remote_toolchain_info["remote_compiler"]["sha256"],
        stripPrefix = remote_toolchain_info["remote_compiler"]["strip_prefix"],
    )
    postfix = ""
    if "windows" in repository_ctx.os.name:
        os = "windows"
        postfix = ".exe"
    elif "mac" in repository_ctx.os.name:
        os = "unix"
    else:
        os = "linux"
    response = repository_ctx.execute(include_tools.ShellCommand(
        "bin/arm-none-eabi-cpp" + postfix,
        [
            "-specs=nano.specs",
            "-specs=nosys.specs",
        ],
        os,
    ))
    include_paths = include_tools.ProccessResponse(response.stderr)
    include_flags = []
    for include_path in include_paths:
        include_flags += ["-isystem", include_path]
    include_bazel_template_input = include_tools.CommandLineToTemplateString(include_flags)
    include_paths_template_input = include_tools.CommandLineToTemplateString(include_paths)
    repository_ctx.file(
        "defs.bzl",
        """
SYSTEM_INCLUDE_COMMAND_LINE = {}
SYSTEM_INCLUDE_PATHS = {}
""".format(include_bazel_template_input, include_paths_template_input),
    )

    repository_ctx.file(
        "BUILD",
        """
filegroup(
    name = "all",
    srcs = glob(["**/*"],exclude=["**/*.html","**/*.pdf"]),
    visibility = ['//visibility:public'],
)
exports_files(
    glob(["bin/**"])
)
""",
    )

gcc_arm_none_repository = repository_rule(
    _com_gcc_arm_none_repository_impl,
    attrs = {
        "version": attr.string(
            default = "12",
            doc = "GCC version, version 9, 11, and 12 are currently the only supported versions",
            values = TOOLCHAIN_VERSIONS.keys(),
        ),
    },
)

def gcc_arm_none_compiler():
    gcc_arm_none_repository(
        name = "com_gcc_arm_none_eabi_compiler",
    )
