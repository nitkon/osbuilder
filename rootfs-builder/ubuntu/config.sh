# This is a configuration file add extra variables to
#
# Copyright (c) 2018  Yash Jain
#
# SPDX-License-Identifier: Apache-2.0
# be used by build_rootfs() from rootfs_lib.sh the variables will be
# loaded just before call the function. For more information see the
# rootfs-builder/README.md file.

OS_VERSION=${OS_VERSION:-18.04}
# this should be ubuntu's codename eg bionic for 18.04
OS_NAME=${OS_NAME:-"bionic"}

# packages to be installed by default
PACKAGES="systemd iptables init"

DEBOOTSTRAP=${PACKAGE_MANAGER:-"debootstrap"}

case $(arch) in
	x86_64) ARCHITECTURE="amd64";;
	ppc64le) ARCHITECTURE="ppc64el";;
	aarch64) ARCHITECTURE="arm64";;
	(*) die "$(arch) not supported "
esac

[ "$SECCOMP" = "yes" ] && PACKAGES+=" libseccomp2" || true
