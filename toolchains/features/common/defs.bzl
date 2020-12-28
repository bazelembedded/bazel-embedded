load("//toolchains/features/common/impl:gcc.bzl", "GetGccCommonFeatures")

_IMPL_LOOKUP = {
    "GCC": GetGccCommonFeatures,
}

def GetCommonFeatures(compiler, cpu, architecture, float_abi, endian, fpu, include_paths):
    if compiler not in _IMPL_LOOKUP.keys():
        fail("This compiler is not currently supported, please use: ", ",".join(_IMPL_LOOKUP.keys()))
    return _IMPL_LOOKUP[compiler](include_paths, cpu, architecture, float_abi, endian, fpu)
