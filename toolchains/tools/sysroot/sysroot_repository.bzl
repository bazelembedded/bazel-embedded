def _sysroot_archive_impl(repository_ctx):
    repository_ctx.download_and_extract(
        url = repository_ctx.attr.urls[0],
        sha256 = repository_ctx.attr.sha256,
    )
    repository_ctx.file("BUILD", content = """
filegroup(
    name = "all",
    visibility = ["//visibility:public"],
    srcs = glob(["**/*"]),
)
""")

sysroot_archive = repository_rule(
    _sysroot_archive_impl,
    attrs = {
        "urls": attr.string_list(),
        "sha256": attr.string(),
    },
)
