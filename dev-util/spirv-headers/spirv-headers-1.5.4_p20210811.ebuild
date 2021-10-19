# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/e71feddb3f17c5586ff7f4cfb5ed1258b800574b.tar.gz -> spirv-tools-1.5.4_p20210811.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/SPIRV-Headers-* "${S}" || die
}