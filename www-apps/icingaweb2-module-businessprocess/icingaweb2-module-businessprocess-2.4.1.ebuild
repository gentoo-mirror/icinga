# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Create top-level views of your applications in a graphical editor."
HOMEPAGE="https://github.com/Icinga/icingaweb2-module-businessprocess/"
if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Icinga/${PN}.git"
else
	KEYWORDS="amd64 x86"
	SRC_URI="https://codeload.github.com/Icinga/${PN}/tar.gz/v${PV} -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${PV}"
fi

LICENSE="GPL-2"
SLOT="0"

IUSE="php_targets_php8-2"
PHP_DEPEND="
	php_targets_php8-2? ( dev-lang/php:8.2[curl] )
"
DEPEND="
	>=www-apps/icingaweb2-2.9.0
	>=dev-libs/icinga-php-library-0.8.0
	>=dev-libs/icinga-php-thirdparty-0.11.0_rc1
	${PHP_DEPEND}
	"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/share/icingaweb2/modules/${PN##*-}/"
	doins -r "${S}"/*
}
