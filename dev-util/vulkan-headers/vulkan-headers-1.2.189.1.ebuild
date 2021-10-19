# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Vulkan Header files and API registry"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Headers"
SRC_URI="https://api.github.com/repos/KhronosGroup/Vulkan-Headers/tarball/refs/tags/sdk-1.2.189.1 -> vulkan-headers-1.2.189.1.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

BDEPEND=">=dev-util/cmake-3.10.2"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-Vulkan-Headers-* "${S}" || die
}