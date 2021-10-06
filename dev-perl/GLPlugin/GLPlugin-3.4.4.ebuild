# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit perl-functions
inherit git-r3

DESCRIPTION="Perl modules providing the basis for labs.consol.de Nagios/Naemon/Icinga plugins"
HOMEPAGE="https://github.com/lausser/GLPlugin"
EGIT_REPO_URI="https://github.com/lausser/GLPlugin.git"
EGIT_COMMIT="d04e12f38eb549ea26ba5522c0fa522c43b9a5f9"

PATCHES=(
	"${FILESDIR}"/01_snmp_timeout.patch
)

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install(){
	default

	my_vendorlib="$(perl_get_vendorlib)"

	pushd lib/Monitoring
	perl_domodule -C Monitoring -r .
	popd
}