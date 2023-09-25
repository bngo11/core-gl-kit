# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://gitlab.freedesktop.org/pixman/pixman.git"

inherit flag-o-matic meson multiprocessing toolchain-funcs

DESCRIPTION="Low-level pixel manipulation routines"
HOMEPAGE="http://www.pixman.org/ https://gitlab.freedesktop.org/pixman/pixman/"
KEYWORDS="*"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
IUSE="cpu_flags_ppc_altivec cpu_flags_arm_iwmmxt cpu_flags_arm_iwmmxt2 cpu_flags_arm_neon loongson2f cpu_flags_x86_mmxext cpu_flags_x86_sse2 cpu_flags_x86_ssse3 static-libs test"
RESTRICT="!test? ( test )"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use test && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use test && tc-check-openmp
}

src_configure() {
	if ( use arm || use arm64 ) && tc-is-clang ; then
		# See bug #768138 and https://gitlab.freedesktop.org/pixman/pixman/-/issues/46
		append-cflags $(test-flags-CC -fno-integrated-as)
	fi

	local emesonargs=(
		$(meson_feature cpu_flags_arm_iwmmxt iwmmxt)
		$(meson_use     cpu_flags_arm_iwmmxt2 iwmmxt2)
		$(meson_feature cpu_flags_x86_mmxext mmx)
		$(meson_feature cpu_flags_x86_sse2 sse2)
		$(meson_feature cpu_flags_x86_ssse3 ssse3)
		$(meson_feature cpu_flags_ppc_altivec vmx)
		$(meson_feature loongson2f loongson-mmi)
		$(meson_feature test openmp) # only used in unit tests
		$(meson_feature test tests)
		-Ddefault_library=$(usex static-libs both shared)
		-Dgtk=disabled
		-Dlibpng=disabled
	)

	if [[ ${ABI} == arm64 ]]; then
		emesonargs+=($(meson_feature cpu_flags_arm_neon a64-neon))
	elif [[ ${ABI} == arm ]]; then
		emesonargs+=($(meson_feature cpu_flags_arm_neon neon))
	fi

	meson_src_configure
}

src_test() {
	export OMP_NUM_THREADS=$(makeopts_jobs)
	meson_src_test -t 100
}
