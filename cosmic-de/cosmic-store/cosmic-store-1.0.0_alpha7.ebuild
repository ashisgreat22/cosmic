# Copyright 2024 Fabio Scaccabarozzi
# Distributed under the terms of the GNU General Public License v3

EAPI=8

COSMIC_GIT_UNPACK=1

inherit cosmic-de desktop

DESCRIPTION="app store from COSMIC DE"
HOMEPAGE="https://github.com/pop-os/cosmic-store"

EGIT_REPO_URI="${HOMEPAGE}"
EGIT_COMMIT="epoch-1.0.0-alpha.7"

# use cargo-license for a more accurate license picture
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND+="
	>=dev-libs/openssl-3.0.13-r2
	>=sys-apps/flatpak-1.14.4-r3
	~cosmic-de/pop-appstream-data-1.0.0_alpha7
	~cosmic-de/cosmic-icons-${PV}
"

src_install() {
	dobin "target/$profile_name/$PN"

	domenu res/com.system76.CosmicStore.desktop

	cosmic-de_install_metainfo res/com.system76.CosmicStore.metainfo.xml

	insinto /usr/share/icons/hicolor
	doins -r res/icons/hicolor/*
}
