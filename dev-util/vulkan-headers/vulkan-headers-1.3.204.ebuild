# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Vulkan Header files and API registry"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Headers"
SRC_URI="https://github.com/KhronosGroup/Vulkan-Headers/tarball/1dace16d8044758d32736eb59802d171970e9448 -> Vulkan-Headers-1.3.204-1dace16.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

BDEPEND=">=dev-util/cmake-3.10.2"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-Vulkan-Headers-* "${S}" || die
}