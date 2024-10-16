# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI="https://xkbcommon.org/download/${P}.tar.xz"
KEYWORDS="*"

PYTHON_COMPAT=( python3+ )

inherit meson multilib-minimal ${GIT_ECLASS} python-any-r1 virtualx

DESCRIPTION="keymap handling library for toolkits and window systems"
HOMEPAGE="https://xkbcommon.org/ https://github.com/xkbcommon/libxkbcommon/"
LICENSE="MIT"
IUSE="X doc static-libs test"
RESTRICT="!test? ( test )"
SLOT="0"

BDEPEND="
	sys-devel/bison
	doc? ( app-doc/doxygen )
	test? ( ${PYTHON_DEPS} )
"
RDEPEND="
	X? ( >=x11-libs/libxcb-1.10:=[${MULTILIB_USEDEP},xkb] )
	dev-libs/libxml2[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )"

pkg_setup() {
	if use test; then
		python-any-r1_pkg_setup
	fi
}

multilib_src_configure() {
	local emesonargs=(
		-Ddefault_library="$(usex static-libs both shared)"
		-Dxkb-config-root="${EPREFIX}/usr/share/X11/xkb"
		-Denable-wayland=false # Demo applications
		$(meson_use X enable-x11)
		$(meson_use doc enable-docs)
	)
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_test() {
	virtx meson_src_test
}

multilib_src_install() {
	meson_src_install
}
