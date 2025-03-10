# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=""
DIST_VERSION="dev-perl/UUID-0.37"
inherit perl-module

DESCRIPTION="Perl extension for using UUID interfaces as defined in e2fsprogs"
LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"

# Note: UUID appears to link against a bunch of different UUID
# implementations depending on availability and platform.
# Presently uses uuid.h/libuuid.so from util-linux which is fine for Linux
# platforms, but may need special attention on *bsd, *osx and win*

RDEPEND="sys-apps/util-linux"
BDEPEND="${RDEPEND}
	>=dev-perl/Devel-CheckLib-1.20.0
	dev-perl/Text-Patch
	virtual/perl-ExtUtils-MakeMaker
"
DEPEND="${RDEPEND}
"
