# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://www.khronos.org/registry/spir-v/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://github.com/KhronosGroup/SPIRV-Headers/tarball/3f17b2af6784bfa2c5aa5dbb8e0e74a607dd8b3b -> SPIRV-Headers-1.4.304.0-3f17b2a.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv "${WORKDIR}"/*SPIRV-Headers-* "${S}" || die
}