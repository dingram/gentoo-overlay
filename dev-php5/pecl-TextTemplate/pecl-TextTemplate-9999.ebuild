# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PHP_EXT_NAME="tmpl"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
USE_PHP="php5-3"

inherit php-ext-source-r2 git

DESCRIPTION="A flexible text templating module"
HOMEPAGE="http://www.dmi.me.uk/code/php/texttemplate/"
EGIT_REPO_URI="git://github.com/dingram/php-tmpl.git"
EGIT_BRANCH="master"
SRC_URI=""

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

my_conf="--enable-tmpl"

src_unpack() {
	git_src_unpack
	local slot orig_s="$S"
	for slot in $(php_get_slots); do
		cp -r "${orig_s}" "${WORKDIR}/${slot}"
	done
}

src_prepare() {
	git_src_prepare
	local slot orig_s="$S"
	for slot in $(php_get_slots); do
		php_init_slot_env ${slot}
		phpize && aclocal && libtoolize --force && autoheader && autoconf
	done
}

#src_configure() {
#	local slot
#	for slot in $(php_get_slots); do
#		php_init_slot_env ${slot}
#		./configure --with-php-config=${PHPCONFIG} --enable-tmpl || die "Unable to configure code to compile"
#	done
#}
#
#src_compile() {
#	local slot
#	for slot in $(php_get_slots); do
#		php_init_slot_env ${slot}
#		emake || die "Unable to make code"
#	done
#}
