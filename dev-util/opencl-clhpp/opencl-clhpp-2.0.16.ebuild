# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake-utils python-any-r1


DESCRIPTION="OpenCL Host API C++ bindings."
HOMEPAGE="https://github.com/KhronosGroup/OpenCL-CLHPP"
SRC_URI="https://api.github.com/repos/KhronosGroup/OpenCL-CLHPP/tarball/v2.0.16 -> opencl-clhpp-2.0.16.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

IUSE="doc"

# Old packaging will cause file collisions
RDEPEND="
	>=dev-util/opencl-headers-${PV}
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
"

RDEPEND="${RDEPEND}
	!<app-eselect/eselect-opencl-1.2.0
"

pkg_setup() {
	python-any-r1_pkg_setup
}

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-OpenCL-CLHPP-* "${S}" || die
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_DOCS=$(usex doc OFF ON)
		-DBUILD_EXAMPLES=OFF
		-DBUILD_TESTS=OFF
		-DOPENCL_INCLUDE_DIR=${EPREFIX}/usr/include/CL
	)

	cmake-utils_src_configure
}