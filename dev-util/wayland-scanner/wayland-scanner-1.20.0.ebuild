# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="wayland-scanner tool"
HOMEPAGE="https://wayland.freedesktop.org/ https://gitlab.freedesktop.org/wayland/wayland"
SRC_URI="https://wayland.freedesktop.org/releases/wayland-1.20.0.tar.xz -> wayland-1.20.0.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/pkgconfig"
RDEPEND="
	!<dev-libs/wayland-${PV}
	>=dev-libs/expat-2.1.0-r3:=
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/wayland-${PV}"

src_configure() {
	local emesonargs=(
		-Ddocumentation=false
		-Ddtd_validation=false
		-Dlibraries=false
		-Dscanner=true
	)
	meson_src_configure
}