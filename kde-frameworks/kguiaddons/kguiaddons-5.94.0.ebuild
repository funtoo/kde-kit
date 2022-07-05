# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing assorted high-level user interface components"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="wayland"

RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtx11extras)
	x11-libs/libX11
	wayland? (
		>=dev-libs/plasma-wayland-protocols-1.7.0
		dev-libs/wayland
		$(add_qt_dep qtwayland)
	)
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-libs/libxcb
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
		-DWITH_WAYLAND=$(usex wayland)
	)
	kde5_src_configure
}
