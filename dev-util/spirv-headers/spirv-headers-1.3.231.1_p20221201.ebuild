# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/archive/1d31a100405cf8783ca7a31e31cdd727c9fc54c3.tar.gz -> spirv-headers-1.3.231.1_p20221201.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv "${WORKDIR}"/SPIRV-Headers-* "${S}" || die
}