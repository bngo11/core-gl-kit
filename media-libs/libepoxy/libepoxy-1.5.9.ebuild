# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2+ )
PYTHON_REQ_USE='xml(+)'
inherit meson python-any-r1

DESCRIPTION="Epoxy is a library for handling OpenGL function pointer management for you"
HOMEPAGE="https://github.com/anholt/libepoxy"
KEYWORDS="*"
SRC_URI="https://github.com/anholt/libepoxy/releases/download/1.5.9/libepoxy-1.5.9.tar.xz -> libeproxy-1.5.9.tar.xz"

LICENSE="MIT"
SLOT="0"
IUSE="+X"

RDEPEND="media-libs/mesa[egl]"
DEPEND="${PYTHON_DEPS}
	${RDEPEND}
	virtual/opengl
	X? ( x11-libs/libX11 )
	virtual/pkgconfig"

src_configure() {
	local emesonargs=(
		-Degl=yes
		-Dglx=$(usex X)
		-Dx11=$(usex X true false)
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}