# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake python-any-r1

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ https://github.com/KhronosGroup/glslang"
SRC_URI="https://github.com/KhronosGroup/glslang/tarball/e1b562a8bed273a02f30b59b66a5d499793cede5 -> glslang-16.6.0-e1b562a.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

DEPEND="
	>=dev-util/spirv-tools-1.4.357.0
"
RDEPEND="!<media-libs/shaderc-2020.1"
BDEPEND="${PYTHON_DEPS}"

# Bug 698850
RESTRICT="test"

post_src_unpack() {
	mv "${WORKDIR}"/*glslang-* "${S}" || die
}

src_configure() {
	local mycmakeargs=(
	-DENABLE_PCH=OFF
	-DALLOW_EXTERNAL_SPIRV_TOOLS=ON
	)

	cmake_src_configure
}
