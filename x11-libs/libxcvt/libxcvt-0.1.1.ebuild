# Distributed under the terms of the GNU General Public License v2

EAPI=7
XORG_TARBALL_SUFFIX="xz"

inherit xorg-3 meson

KEYWORDS="*"

DESCRIPTION="X.Org xcvt library and cvt program"

RDEPEND="!<x11-base/xorg-server-1.20.11-r3"

# Override xorg-3's src_prepare
src_prepare() {
	default
}
