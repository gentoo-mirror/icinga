# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A nagios plugin for checking Fortigate"
HOMEPAGE="https://github.com/riskersen/Monitoring"
EGIT_REPO_URI="https://github.com/riskersen/Monitoring.git"
EGIT_COMMIT="b52bc4034649c9f7002aff4f90ad0850d285c665"

DEPEND="dev-perl/List-Compare"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_install(){
	default
	exeinto /usr/lib64/nagios/plugins/contrib/
	doexe fortigate/check_fortigate.pl
	insinto /usr/share/snmp/mibs/
	newins fortigate/FortiADC_mibs FORTIADC-MIB.txt

	insinto /usr/share/icinga2/include/plugins-contrib.d/
	doins ${FILESDIR}/${PN}.conf
}
