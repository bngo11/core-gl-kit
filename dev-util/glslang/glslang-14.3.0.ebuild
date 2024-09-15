# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ https://github.com/KhronosGroup/glslang"
SRC_URI="https://github.com/KhronosGroup/glslang/tarball/fa9c3deb49e035a8abcabe366f26aac010f6cbfb -> glslang-14.3.0-fa9c3de.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

DEPEND="
	=dev-util/spirv-tools-2024.3*
"
RDEPEND="!<media-libs/shaderc-2020.1"
BDEPEND="${PYTHON_DEPS}"

# Bug 698850
RESTRICT="test"

post_src_unpack() {
	mv "${WORKDIR}"/*glslang-* "${S}" || die
}

# Override the src_install to add additonal libraries
src_install() {
	default
	cmake-utils_src_install
	mv ${WORKDIR}/*glslang-*_build/OGLCompilersDLL/libOGLCompiler.a ${ED}/usr/lib64
	mv ${WORKDIR}/*glslang-*_build/glslang/OSDependent/Unix/libOSDependent.a ${ED}/usr/lib64
}