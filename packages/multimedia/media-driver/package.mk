# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="media-driver"
PKG_VERSION="24.2.3"
PKG_SHA256="d8b085e5a0bfe8714f716fc96a36bf287827388e5a668a2f39b41cf3b2026f9c"
PKG_ARCH="x86_64"
PKG_LICENSE="MIT"
PKG_SITE="https://01.org/linuxmedia"
PKG_URL="https://github.com/intel/media-driver/archive/intel-media-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libva libdrm gmmlib"
PKG_LONGDESC="media-driver: The Intel(R) Media Driver for VAAPI is a new VA-API (Video Acceleration API) user mode driver supporting hardware accelerated decoding, encoding, and video post processing for GEN based graphics hardware."

TARGET_CXXFLAGS+=" -Wno-error=template-id-cdtor"

PKG_CMAKE_OPTS_TARGET="-DBUILD_CMRTLIB=OFF \
                       -DBUILD_KERNELS=ON \
                       -DBUILD_TYPE=release \
                       -DENABLE_NONFREE_KERNELS=ON \
                       -DMEDIA_BUILD_FATAL_WARNINGS=ON \
                       -DMEDIA_RUN_TEST_SUITE=OFF"
