# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Icinga PHP libraries for Icinga Web 2"
HOMEPAGE="https://github.com/Icinga/icinga-php-library"
MY_GITHUB_AUTHOR="Icinga"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="php_targets_php8-2 php_targets_php8-3 php_targets_php8-4"
PHP_DEPEND="
	php_targets_php8-2? ( dev-lang/php:8.2 )
	!php_targets_php8-2? ( !dev-lang/php:8.2 )
	php_targets_php8-3? ( dev-lang/php:8.3 )
	!php_targets_php8-3? ( !dev-lang/php:8.3 )
	php_targets_php8-4? ( dev-lang/php:8.4 )
	!php_targets_php8-4? ( !dev-lang/php:8.4 )
"
DEPEND="${PHP_DEPEND}"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto "/usr/share/icinga-php/ipl"
	cd "${S}" || die
	doins -r ./*
}
