# SPDX-License-Identifier: GPL-2.0-only
# Only install the bundled ARM64 UAPI; the kernel itself remains prebuilt.
.PHONY: headers_install
headers_install: include/kernel-uapi-headers.tar.gz
	@test "$(ARCH)" = arm64
	@test -n "$(O)"
	@mkdir -p "$(O)"
	@gzip -dc "$<" | tar -xf - -C "$(O)"
