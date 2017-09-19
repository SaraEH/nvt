# OpenVAS Vulnerability Test
# $Id: deb_3471.nasl 6608 2017-07-07 12:05:05Z cfischer $
# Auto-generated from advisory DSA 3471-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_id(703471);
    script_version("$Revision: 6608 $");
    script_cve_id("CVE-2015-7295", "CVE-2015-7504", "CVE-2015-7512", "CVE-2015-7549",
                  "CVE-2015-8345", "CVE-2015-8504", "CVE-2015-8550", "CVE-2015-8558",
                  "CVE-2015-8567", "CVE-2015-8568", "CVE-2015-8613", "CVE-2015-8619",
                  "CVE-2015-8743", "CVE-2015-8744", "CVE-2015-8745", "CVE-2016-1568",
                  "CVE-2016-1714", "CVE-2016-1922", "CVE-2016-1981");
    script_name("Debian Security Advisory DSA 3471-1 (qemu - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:05 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2016-02-08 00:00:00 +0100 (Mon, 08 Feb 2016)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3471.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "qemu on Debian Linux");
    script_tag(name: "insight",   value: "QEMU is a fast processor emulator:
currently the package supports ARM, CRIS, i386, M68k (ColdFire), MicroBlaze, MIPS,
PowerPC, SH4, SPARC and x86-64 emulation. By using dynamic translation it achieves
reasonable speed while being easy to port on new host CPUs. QEMU has
two operating modes:");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 1:2.1+dfsg-12+deb8u5a.

We recommend that you upgrade your qemu packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered in
qemu, a full virtualization solution on x86 hardware.

CVE-2015-7295
Jason Wang of Red Hat Inc. discovered that the Virtual Network
Device support is vulnerable to denial-of-service, that could
occur when receiving large packets.

CVE-2015-7504
Qinghao Tang of Qihoo 360 Inc. and Ling Liu of Qihoo 360 Inc.
discovered that the PC-Net II ethernet controller is vulnerable to
a heap-based buffer overflow that could result in
denial-of-service (via application crash) or arbitrary code
execution.

CVE-2015-7512
Ling Liu of Qihoo 360 Inc. and Jason Wang of Red Hat Inc.
discovered that the PC-Net II ethernet controller is vulnerable to
a buffer overflow that could result in denial-of-service (via
application crash) or arbitrary code execution.

CVE-2015-7549
Qinghao Tang of Qihoo 360 Inc. and Ling Liu of Qihoo 360
Inc. discovered that the PCI MSI-X emulator is vulnerable to a
null pointer dereference issue, that could lead to
denial-of-service (via application crash).

CVE-2015-8345
Qinghao Tang of Qihoo 360 Inc. discovered that the eepro100
emulator contains a flaw that could lead to an infinite loop when
processing Command Blocks, eventually resulting in
denial-of-service (via application crash).

CVE-2015-8504
Lian Yihan of Qihoo 360 Inc. discovered that the VNC display
driver support is vulnerable to an arithmetic exception flaw that
could lead to denial-of-service (via application crash).

CVE-2015-8550
Felix Wilhelm of ERNW Research that the PV backend drivers are
vulnerable to double fetch vulnerabilities, possibly resulting in
arbitrary code execution.

CVE-2015-8558
Qinghao Tang of Qihoo 360 Inc. discovered that the USB EHCI
emulation support contains a flaw that could lead to an infinite
loop during communication between the host controller and a device
driver. This could lead to denial-of-service (via resource
exhaustion).

CVE-2015-8567 CVE-2015-8568
Qinghao Tang of Qihoo 360 Inc. discovered that the vmxnet3 device
emulator could be used to intentionally leak host memory, thus
resulting in denial-of-service.

CVE-2015-8613
Qinghao Tang of Qihoo 360 Inc. discovered that the SCSI MegaRAID
SAS HBA emulation support is vulnerable to a stack-based buffer
overflow issue, that could lead to denial-of-service (via
application crash).

CVE-2015-8619
Ling Liu of Qihoo 360 Inc. discovered that the Human Monitor
Interface support is vulnerable to an out-of-bound write access
issue that could result in denial-of-service (via application
crash).

CVE-2015-8743
Ling Liu of Qihoo 360 Inc. discovered that the NE2000 emulator is
vulnerable to an out-of-bound read/write access issue, potentially
resulting in information leak or memory corruption.

CVE-2015-8744
The vmxnet3 driver incorrectly processes small packets, which could
result in denial-of-service (via application crash).

CVE-2015-8745
The vmxnet3 driver incorrectly processes Interrupt Mask Registers,
which could result in denial-of-service (via application crash).

CVE-2016-1568
Qinghao Tang of Qihoo 360 Inc. discovered that the IDE AHCI
emulation support is vulnerable to a use-after-free issue, that
could lead to denial-of-service (via application crash) or
arbitrary code execution.

CVE-2016-1714
Donghai Zhu of Alibaba discovered that the Firmware Configuration
emulation support is vulnerable to an out-of-bound read/write
access issue, that could lead to denial-of-service (via
application crash) or arbitrary code execution.

CVE-2016-1922
Ling Liu of Qihoo 360 Inc. discovered that 32-bit Windows guests
support is vulnerable to a null pointer dereference issue, that
could lead to denial-of-service (via application crash).

CVE-2016-1981
The e1000 driver is vulnerable to an infinite loop issue that
could lead to denial-of-service (via application crash).");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"qemu", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-guest-agent", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-arm", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-common", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-mips", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-misc", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-ppc", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-sparc", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-x86", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-binfmt", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-static", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-utils", ver:"1:2.1+dfsg-12+deb8u5a", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}