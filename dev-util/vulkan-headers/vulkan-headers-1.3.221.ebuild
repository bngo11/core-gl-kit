# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Vulkan Header files and API registry"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Headers"
SRC_URI="https://github.com/KhronosGroup/Vulkan-Headers/tarball/16847a61009f23b73b6de658a64e42926efc1ea9 -> Vulkan-Headers-1.3.221-16847a6.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

BDEPEND=">=dev-util/cmake-3.10.2"

post_src_unpack() {
	mv "${WORKDIR}"/KhronosGroup-Vulkan-Headers-* "${S}" || die
}