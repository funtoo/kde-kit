# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIRTUALX_REQUIRED="test"
inherit cmake-utils virtualx

DESCRIPTION="C++ string template engine based on the Django template system"
HOMEPAGE="https://github.com/steveire/grantlee"
SRC_URI="https://api.github.com/repos/steveire/grantlee/tarball/refs/tags/v5.3.0 -> grantlee-5.3.0.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE="debug doc test"

BDEPEND="
	doc? ( app-doc/doxygen[dot] )
	test? ( dev-qt/linguist-tools:5 )
"
RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qttest:5 )
"

RESTRICT+=" !test? ( test )"

PATCHES=(
	"${FILESDIR}/${PN}-0.3.0-nonfatal-warnings.patch"
	"${FILESDIR}/${PN}-5.2.0-slot.patch"
)

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/steveire-grantlee"* "${S}" || die
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test)
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

	use doc && cmake-utils_src_compile docs
}

src_test() {
	virtx cmake-utils_src_test
}

src_install() {
	use doc && local HTML_DOCS=("${BUILD_DIR}/apidox/")

	cmake-utils_src_install
}