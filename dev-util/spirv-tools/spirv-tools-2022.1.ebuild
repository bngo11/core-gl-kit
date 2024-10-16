# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=SPIRV-Tools
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

SRC_URI="https://api.github.com/repos/KhronosGroup/SPIRV-Tools/tarball/refs/tags/v2022.1 -> spirv-tools-2022.1.tar.gz"

DESCRIPTION="Provides an API and commands for processing SPIR-V modules"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Tools"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
# Tests fail upon finding symbols that do not match a regular expression
# in the generated library. Easily hit with non-standard compiler flags
RESTRICT="test"

COMMON_DEPEND=">=dev-util/spirv-headers-1.5.4_p20210219"
DEPEND="${COMMON_DEPEND}"
RDEPEND=""
BDEPEND="${PYTHON_DEPS}
	${COMMON_DEPEND}"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-SPIRV-Tools-* "${S}" || die
}

src_configure() {
	local mycmakeargs=(
		"-DSPIRV-Headers_SOURCE_DIR=/usr/"
		"-DSPIRV_WERROR=OFF"
		"-DSPIRV_TOOLS_BUILD_STATIC=OFF"
		"-DBUILD_SHARED_LIBS=ON"
	)

	cmake-utils_src_configure
}