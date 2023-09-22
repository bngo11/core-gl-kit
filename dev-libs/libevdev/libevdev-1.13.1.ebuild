# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit meson python-any-r1

DESCRIPTION="Handler library for evdev events"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/libevdev/ https://gitlab.freedesktop.org/libevdev/libevdev"

SRC_URI="https://www.freedesktop.org/software/libevdev/${P}.tar.xz"
KEYWORDS="*"

LICENSE="MIT"
SLOT="0"
IUSE="doc test"

DEPEND="test? ( dev-libs/check )"
BDEPEND="
	${PYTHON_DEPS}
	doc? ( app-doc/doxygen )
	virtual/pkgconfig
"
RESTRICT="!test? ( test )"

src_configure() {
	local emesonargs=(
		$(meson_feature doc documentation)
		$(meson_feature test tests)
	)
	meson_src_configure
}

src_test() {
	meson_src_test -t 100
}

src_install() {
	meson_src_install

	if use doc; then
		local HTML_DOCS=( doc/html/. )
		einstalldocs
	fi
}
