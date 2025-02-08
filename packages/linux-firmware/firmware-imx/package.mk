# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="firmware-imx"
PKG_VERSION="8.26-d4c33ab"
PKG_SHA256="b2fcf84a0417678aa441b1bcde9ece467f8bd063a63d8390684f8e37768d84cf"
PKG_ARCH="aarch64 arm"
PKG_LICENSE="other"
PKG_SITE="http://www.freescale.com"
PKG_URL="https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/${PKG_NAME}-${PKG_VERSION}.bin"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="firmware-imx: Freescale IMX firmware such as for the VPU"
PKG_TOOLCHAIN="manual"

unpack() {
  cd $(dirname ${PKG_BUILD})
  sh ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.bin --auto-accept
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_firmware_dir)/imx/sdma
  mkdir -p ${INSTALL}/$(get_full_firmware_dir)/vpu

  case "${DEVICE}" in
    "iMX6")
      cp -P firmware/sdma/sdma-imx6q.bin ${INSTALL}/$(get_full_firmware_dir)/imx/sdma
      cp -P firmware/vpu/vpu_fw_imx6d.bin ${INSTALL}/$(get_full_firmware_dir)/vpu
      cp -P firmware/vpu/vpu_fw_imx6q.bin ${INSTALL}/$(get_full_firmware_dir)/vpu
      ;;
    "iMX8")
      cp -P firmware/sdma/sdma-imx7d.bin ${INSTALL}/$(get_full_firmware_dir)/imx/sdma
      cp -P firmware/vpu/vpu_fw_imx8_dec.bin ${INSTALL}/$(get_full_firmware_dir)/vpu
      ;;
  esac
}
