# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Vulkan Header files and API registry"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Headers"
SRC_URI="https://github.com/KhronosGroup/Vulkan-Headers/tarball/952f776f6573aafbb62ea717d871cd1d6816c387 -> Vulkan-Headers-1.4.309-952f776.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

BDEPEND=">=dev-util/cmake-3.10.2"

post_src_unpack() {
	mv "${WORKDIR}"/KhronosGroup-Vulkan-Headers-* "${S}" || die
}