# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

SRC_URI="https://github.com/zeux/volk/archive/vulkan-sdk-1.3.290.tar.gz -> volk-1.3.290.tar.gz"
KEYWORDS="*"
S="${WORKDIR}/${PN}-vulkan-sdk-${PV}"

DESCRIPTION="Meta loader for Vulkan API"
HOMEPAGE="https://github.com/zeux/volk"

LICENSE="MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="~media-libs/vulkan-loader-${PV}:="
DEPEND="${RDEPEND}
	~dev-util/vulkan-headers-${PV}
"

src_configure() {
	local mycmakeargs=(
		-DVOLK_INSTALL=on
	)
	cmake_src_configure
}