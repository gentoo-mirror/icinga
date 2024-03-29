# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN#nagios-}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A nagios plugin for checking MS-SQL server health"
HOMEPAGE="https://labs.consol.de/nagios/check_mssql_health/"
SRC_URI="https://labs.consol.de/assets/downloads/nagios/${MY_P}.tar.gz"

PATCHES=(
	"${FILESDIR}/2.7-uninitialized-value.patch"
)

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/DBD-Sybase
	dev-perl/DBI
	virtual/perl-Data-Dumper
	virtual/perl-File-Temp
	virtual/perl-Net-Ping
	virtual/perl-Time-HiRes"

S="${WORKDIR}/${MY_P}"

src_configure(){
	# Should match net-analyzer/{monitoring,nagios}-plugins.
	econf --libexecdir="/usr/$(get_libdir)/nagios/plugins"
}
