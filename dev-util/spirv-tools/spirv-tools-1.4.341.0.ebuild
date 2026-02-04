# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=SPIRV-Tools
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

SRC_URI="https://github.com/KhronosGroup/SPIRV-Tools/tarball/fbe4f3ad913c44fe8700545f8ffe35d1382b7093 -> SPIRV-Tools-1.4.341.0-fbe4f3a.tar.gz"

DESCRIPTION="Provides an API and commands for processing SPIR-V modules"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Tools"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
# Tests fail upon finding symbols that do not match a regular expression
# in the generated library. Easily hit with non-standard compiler flags
RESTRICT="test"

COMMON_DEPEND="
	=dev-util/spirv-headers-1.4.341.0*
"
DEPEND="${COMMON_DEPEND}"
RDEPEND=""
BDEPEND="${PYTHON_DEPS}
	${COMMON_DEPEND}"

post_src_unpack() {
	mv "${WORKDIR}"/*SPIRV-Tools-* "${S}" || die
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