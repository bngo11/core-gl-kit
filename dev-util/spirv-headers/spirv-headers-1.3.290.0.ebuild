# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/tarball/2acb319af38d43be3ea76bfabf3998e5281d8d12 -> SPIRV-Headers-1.3.290.0-2acb319.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv "${WORKDIR}"/SPIRV-Headers-* "${S}" || die
}