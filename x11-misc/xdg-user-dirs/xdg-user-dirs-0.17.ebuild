# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Tool to help manage 'well known' user directories"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/xdg-user-dirs"
SRC_URI="https://user-dirs.freedesktop.org/releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="gtk"

RDEPEND=""
# libxslt is mandatory because 0.15 tarball is broken, re:
# https://bugs.freedesktop.org/show_bug.cgi?id=66251
DEPEND="app-text/docbook-xml-dtd:4.3
	dev-libs/libxslt
	sys-devel/gettext"
PDEPEND="gtk? ( x11-misc/xdg-user-dirs-gtk )"

DOCS=( AUTHORS ChangeLog NEWS )
PATCHES=( "${FILESDIR}"/${PN}-0.16-libiconv.patch )

src_prepare() {
	default
	sed -i -e 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' configure.ac || die #467032
	eautoreconf # for the above patch
}
