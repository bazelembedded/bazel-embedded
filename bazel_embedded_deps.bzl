""" Fetch remote third party dependencies """

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_embedded//toolchains/upstream:toolchain_upstream_deps.bzl", "toolchain_upstream_deps")

def bazel_embedded_deps():
    """ bazel_embedded_deps downloads and setups up the required thirdy party dependencies """

    if not native.existing_rule("platforms"):
        http_archive(
            name = "platforms",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/platforms/releases/download/0.0.4/platforms-0.0.4.tar.gz",
                "https://github.com/bazelbuild/platforms/releases/download/0.0.4/platforms-0.0.4.tar.gz",
            ],
            sha256 = "079945598e4b6cc075846f7fd6a9d0857c33a7afc0de868c2ccb96405225135d",
        )

    if not native.existing_rule("bazel_embedded_upstream_toolchain"):
        toolchain_upstream_deps()

    if not native.existing_rule("rules_cc"):
        git_repository(
            name = "rules_cc",
            commit = "a636005ba28c0344da5110bd8532184c74b6ffdf",
            remote = "https://github.com/bazelbuild/rules_cc.git",
            shallow_since = "1583316607 -0800",
        )
    if not native.existing_rule("bazel_skylib"):
        http_archive(
            name = "bazel_skylib",
            urls = [
                "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            ],
            sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
        )
    if not native.existing_rule("com_github_wjwwood_serial"):
        http_archive(
            name = "com_github_wjwwood_serial",
            sha256 = "dd5f53ba9338ff2e9a3dea36f3375414e85b64a81a22066a3ff3076630a5f70d",
            strip_prefix = "serial-586ff7a40f20d1d19d04987ae95289395c73195b",
            urls = ["https://github.com/bazelembedded/serial/archive/586ff7a40f20d1d19d04987ae95289395c73195b.zip"],
        )
    if not native.existing_rule("com_github_jarro_cxxopts"):
        http_archive(
            name = "com_github_jarro_cxxopts",
            sha256 = "fbee4be13a388dd4164865d707a7062a3051a8c83c4f30c56ef9616bdf202210",
            strip_prefix = "cxxopts-5e323d648e50b43fd430fb324c632dafd73f7add",
            urls = ["https://github.com/jarro2783/cxxopts/archive/5e323d648e50b43fd430fb324c632dafd73f7add.zip"],
        )
