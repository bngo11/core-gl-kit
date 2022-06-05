# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Unified C language headers for the OpenCL API"
HOMEPAGE="https://github.com/KhronosGroup/OpenCL-Headers"
SRC_URI="https://github.com/KhronosGroup/OpenCL-Headers/tarball/c57ba81c460ee97b6b9d0b8d18faf5ba6883114b -> OpenCL-Headers-2020.12.18-c57ba81.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

# To avoid file collisions in /usr/include/CL/
DEPEND="!<app-eselect/eselect-opencl-1.2.0"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/KhronosGroup-OpenCL-Headers-* "${S}" || die
}