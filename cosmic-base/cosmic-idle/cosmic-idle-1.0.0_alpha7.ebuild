# Copyright 2024 Fabio Scaccabarozzi
# Distributed under the terms of the GNU General Public License v3

EAPI=8

COSMIC_GIT_UNPACK=1
inherit cosmic-de

DESCRIPTION="screen idle daemon for COSMIC DE"
HOMEPAGE="https://github.com/pop-os/cosmic-idle"

EGIT_REPO_URI="${HOMEPAGE}"
EGIT_COMMIT="epoch-1.0.0-alpha.7"

# use cargo-license for a more accurate license picture
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	cosmic-de_src_configure --all
}

src_install() {
	dobin "target/$profile_name/$PN"
}
