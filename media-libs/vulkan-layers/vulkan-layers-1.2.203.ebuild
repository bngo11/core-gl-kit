# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="Vulkan Validation Layers"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-ValidationLayers"
SRC_URI="https://github.com/KhronosGroup/Vulkan-ValidationLayers/tarball/8ce3e34c7ddab8c93174795e45b1c7aa362f6733 -> Vulkan-ValidationLayers-1.2.203-8ce3e34.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="wayland X"

BDEPEND=">=dev-util/cmake-3.10.2"
DEPEND="${PYTHON_DEPS}
	>=dev-util/glslang-10.11.0.0_pre20200924:=
	>=dev-util/spirv-tools-2020.6:=[static]
	>=dev-util/vulkan-headers-$(ver_cut 1-3)
	dev-cpp/robin-hood-hashing
	wayland? ( dev-libs/wayland:= )
	X? (
		x11-libs/libX11:=
		x11-libs/libXrandr:=
	)
"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-Vulkan-ValidationLayers-* "${S}" || die
} 

src_configure() {
	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
		-DBUILD_LAYER_SUPPORT_FILES=ON
		-DBUILD_WSI_WAYLAND_SUPPORT=$(usex wayland)
		-DBUILD_WSI_XCB_SUPPORT=$(usex X)
		-DBUILD_WSI_XLIB_SUPPORT=$(usex X)
		-DBUILD_TESTS=OFF
		-DGLSLANG_INSTALL_DIR="${EPREFIX}/usr"
		-DCMAKE_INSTALL_INCLUDEDIR="${EPREFIX}/usr/include/"
		-DSPIRV_HEADERS_INSTALL_DIR="${EPREFIX}/usr/include/spirv"
	)
	cmake-utils_src_configure
}