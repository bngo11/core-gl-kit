# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS="cmake"
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1

DESCRIPTION="A library standardize layer configuration code for various SDK layer deliverables."
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Utility-Libraries"
SRC_URI="https://github.com/KhronosGroup/Vulkan-Utility-Libraries/tarball/fbb4db92c6b2ac09003b2b8e5ceb978f4f2dda71 -> Vulkan-Utility-Libraries-1.3.295-fbb4db9.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="wayland X"

BDEPEND=">=dev-util/cmake-3.10.2"
DEPEND="
	=dev-util/vulkan-headers-1.3.295*
	${PYTHON_DEPS}
	dev-cpp/robin-hood-hashing
	wayland? ( dev-libs/wayland:= )
	X? (
		x11-libs/libX11:=
		x11-libs/libXrandr:=
	)
"

post_src_unpack() {
	mv "${WORKDIR}"/*KhronosGroup-Vulkan-Utility-Libraries-* "${S}" || die
}