# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/tarball/1e770e7de8373a8dd49f23416cf7ca4001d01040 -> SPIRV-Headers-1.5.0-1e770.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv "${WORKDIR}"/*SPIRV-Headers-* "${S}" || die
}
