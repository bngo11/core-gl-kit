# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Wayland protocol files"
HOMEPAGE="https://wayland.freedesktop.org/"
SRC_URI="https://wayland.freedesktop.org/releases/wayland-protocols-1.23.tar.xz -> wayland-protocols-1.23.tar.xz"
KEYWORDS="*"

LICENSE="MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	test? ( dev-libs/wayland )
"
RDEPEND=""
BDEPEND="
	dev-util/wayland-scanner
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		$(meson_use test tests)
	)

	meson_src_configure
}