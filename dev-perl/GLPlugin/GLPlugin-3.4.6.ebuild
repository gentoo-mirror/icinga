# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit perl-functions
inherit git-r3

DESCRIPTION="Perl modules providing the basis for labs.consol.de Nagios/Naemon/Icinga plugins"
HOMEPAGE="https://github.com/lausser/GLPlugin"
EGIT_REPO_URI="https://github.com/lausser/GLPlugin.git"
EGIT_COMMIT="b2d008c3dfff7133406080bba38e404225e63b1c"

PATCHES=(
	"${FILESDIR}"/01_snmp_timeout.patch
)

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=">net-analyzer/check_nwc_health-9.0.1.1"

src_configure(){
	default

	echo '1;'> autosplit.ix
}

src_install(){
	default

	my_vendorlib="$(perl_get_vendorlib)"

	insinto ${my_vendorlib}/auto/Monitoring/GLPlugin/UPNP/
	doins autosplit.ix
	insinto ${my_vendorlib}/auto/Monitoring/GLPlugin/SNMP/
	doins autosplit.ix

	pushd lib/Monitoring
	perl_domodule -C Monitoring -r .
	popd
}
