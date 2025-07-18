# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A nagios/icinga plugin for checking VMWare ESX server health"
HOMEPAGE="https://www.claudiokuenzler.com/monitoring-plugins/check_esxi_hardware.php"
SRC_URI="https://github.com/Napsty/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RDEPEND="
	dev-python/pywbem
	dev-python/packaging
	"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install(){
	default
	exeinto /usr/lib64/nagios/plugins/contrib/
	doexe check_esxi_hardware.py
}
