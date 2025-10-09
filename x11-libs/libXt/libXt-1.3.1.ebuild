# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_TARBALL_SUFFIX="xz"
XORG_MULTILIB=yes
inherit xorg-3 toolchain-funcs

DESCRIPTION="X.Org X Toolkit Intrinsics library"

KEYWORDS="*"
IUSE="test"

RDEPEND="x11-base/xorg-proto
	>=x11-libs/libICE-1.0.8-r1[${MULTILIB_USEDEP}]
	>=x11-libs/libSM-1.2.1-r1[${MULTILIB_USEDEP}]
	>=x11-libs/libX11-1.6.2[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-libs/glib )"

src_configure() {
	tc-export_build_env
	xorg-3_src_configure
}
