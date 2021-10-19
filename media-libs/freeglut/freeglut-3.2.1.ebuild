# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake

DESCRIPTION="A free OpenGL utility toolkit, the open-sourced alternative to the GLUT library"
HOMEPAGE="http://freeglut.sourceforge.net/"
SRC_URI="https://api.github.com/repos/dcnieho/FreeGLUT/tarball/refs/tags/FG_3_2_1 -> freeglut-3673b101ab751e8b9c55261f32a80b2e4bede242.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="debug static-libs"

# enabling GLES support seems to cause build failures
RDEPEND=">=virtual/glu-9.0-r1
	>=virtual/opengl-7.0-r1
	>=x11-libs/libX11-1.6.2
	>=x11-libs/libXext-1.3.2
	>=x11-libs/libXi-1.7.2
	>=x11-libs/libXrandr-1.4.2
	>=x11-libs/libXxf86vm-1.1.3"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"
BDEPEND="virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${PN}-3.2.1-gcc10-fno-common.patch )
HTML_DOCS=( doc/. )

post_src_unpack() {
	mv ${WORKDIR}/dcnieho-FreeGLUT-??????? "${S}" || die
}

src_configure() {
	local mycmakeargs=(
#		"-DOpenGL_GL_PREFERENCE=GLVND" # bug 721006
		"-DFREEGLUT_GLES=OFF"
		"-DFREEGLUT_BUILD_DEMOS=OFF"
		"-DFREEGLUT_BUILD_STATIC_LIBS=$(usex static-libs ON OFF)"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	cp "${ED}"/usr/$(get_libdir)/pkgconfig/{,free}glut.pc || die
}