# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Pan-CJK OpenType/CFF font family"
HOMEPAGE="https://github.com/adobe-fonts/source-han-sans/"
SRC_URI="
	l10n_zh-CN? ( https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip -> SourceHanSansCN.zip )
	l10n_ja? ( https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip -> SourceHanSansJP.zip )
	l10n_ko? ( https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip -> SourceHanSansKR.zip )
	l10n_zh-TW? ( https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip -> SourceHanSansTW.zip )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="l10n_ja l10n_ko +l10n_zh-CN l10n_zh-TW"
REQUIRED_USE="|| ( l10n_ja l10n_ko l10n_zh-CN l10n_zh-TW )"
RESTRICT="binchecks strip"

FONT_SUFFIX="otf"

BDEPEND="app-arch/unzip"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/SubsetOTF "${S}" || die
	fi
}

src_install() {
	use l10n_ja && FONT_S="${S}/JP" font_src_install
	use l10n_ko && FONT_S="${S}/KR" font_src_install
	use l10n_zh-CN && FONT_S="${S}/CN" font_src_install
	use l10n_zh-TW && FONT_S="${S}/TW" font_src_install
}