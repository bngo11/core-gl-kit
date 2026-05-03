# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake python-any-r1

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ https://github.com/KhronosGroup/glslang"
SRC_URI="https://github.com/KhronosGroup/glslang/tarball/275822a6261ee689aadb1da5f09a0ec2f058685c -> glslang-16.3.0-275822a.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

DEPEND="
	=dev-util/spirv-tools-1.4.341.0*
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
