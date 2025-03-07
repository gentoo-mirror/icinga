# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="e7ad0531d869288af253b71bfdd47b2b217cda95"
DESCRIPTION="Nagios/Centreon/Icinga plugin for nextcloud serverinfo API"
HOMEPAGE="https://github.com/BornToBeRoot/check_nextcloud"
SRC_URI="https://github.com/BornToBeRoot/check_nextcloud/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	default

	exeinto /usr/lib64/nagios/plugins/contrib/
	doexe check/check_nextcloud.py

	insinto /usr/share/icinga2/include/plugins-contrib.d/
	doins "${FILESDIR}/${PN}.conf"

	insinto /usr/share/icingaweb2/modules/graphite/templates/
	doins "${FILESDIR}/${PN}.ini"
}
