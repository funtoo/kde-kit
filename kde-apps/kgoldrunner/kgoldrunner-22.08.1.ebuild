# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_SELINUX_MODULE="games"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Game of action and puzzle solving by KDE"
HOMEPAGE="https://apps.kde.org/en/kgoldrunner
https://games.kde.org/game.php?game=kgoldrunner"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep libkdegames)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	media-libs/libsndfile
	media-libs/openal
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtsvg)
"