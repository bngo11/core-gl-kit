# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Wayland protocol libraries"
HOMEPAGE="https://wayland.freedesktop.org/ https://gitlab.freedesktop.org/wayland/wayland"
SRC_URI="https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.21.0/downloads/wayland-1.21.0.tar.xz -> wayland-1.21.0.tar.xz"

LICENSE="MIT"
SLOT="0"
IUSE="doc"
KEYWORDS="*"

BDEPEND="
	~dev-util/wayland-scanner-${PV}
	virtual/pkgconfig
	doc? (
		>=app-doc/doxygen-1.6[dot]
		app-text/xmlto
		>=media-gfx/graphviz-2.26.0
		sys-apps/grep[pcre]
	)
"
DEPEND="
	>=dev-libs/expat-2.1.0-r3:=
	dev-libs/libxml2:=
	>=virtual/libffi-3.0.13-r1:=
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use doc documentation)
		$(meson_use doc dtd_validation)
		-Dlibraries=true
		-Dscanner=false
	)

	meson_src_configure
}

src_test() {
	# We set it on purpose to only a short subdir name, as socket paths are
	# created in there, which are 108 byte limited. With this it hopefully
	# barely fits to the limit with /var/tmp/portage/$CAT/$PF/temp/xdr
	export XDG_RUNTIME_DIR="${T}"/xdr
	mkdir "${XDG_RUNTIME_DIR}" || die
	chmod 0700 "${XDG_RUNTIME_DIR}" || die
}