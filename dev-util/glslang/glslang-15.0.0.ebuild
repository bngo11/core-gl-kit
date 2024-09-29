# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake python-any-r1

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/ https://github.com/KhronosGroup/glslang"
SRC_URI="https://github.com/KhronosGroup/glslang/tarball/46ef757e048e760b46601e6e77ae0cb72c97bd2f -> glslang-15.0.0-46ef757.tar.gz"

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

src_configure() {
	local mycmakeargs=(
	-DENABLE_PCH=OFF
	-DALLOW_EXTERNAL_SPIRV_TOOLS=ON
	)

	cmake_src_configure
}
