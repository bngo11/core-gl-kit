# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/b42ba6d92faf6b4938e6f22ddd186dbdacc98d78.tar.gz -> spirv-tools-1.5.4_p20220119.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/SPIRV-Headers-* "${S}" || die
}