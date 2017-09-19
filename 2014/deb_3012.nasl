# OpenVAS Vulnerability Test
# $Id: deb_3012.nasl 6769 2017-07-20 09:56:33Z teissa $
# Auto-generated from advisory DSA 3012-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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

tag_affected  = "eglibc on Debian Linux";
tag_solution  = "For the stable distribution (wheezy), this problem has been fixed in
version 2.13-38+deb7u4.

We recommend that you upgrade your eglibc packages.";
tag_summary   = "Tavis Ormandy discovered a heap-based buffer overflow in the
transliteration module loading code in eglibc, Debian's version of the
GNU C Library. As a result, an attacker who can supply a crafted
destination character set argument to iconv-related character
conversation functions could achieve arbitrary code execution.

This update removes support of loadable gconv transliteration modules.
Besides the security vulnerability, the module loading code had
functionality defects which prevented it from working for the intended
purpose.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(703012);
    script_version("$Revision: 6769 $");
    script_cve_id("CVE-2014-5119");
    script_name("Debian Security Advisory DSA 3012-1 (eglibc - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-08-27 00:00:00 +0200 (Wed, 27 Aug 2014)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3012.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"eglibc-source", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"glibc-doc", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-bin", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-dev-bin", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i386", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i686", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i386", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i686", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-loongson2f", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-pic", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-prof", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-xen", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales-all", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"multiarch-support", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nscd", ver:"2.13-38+deb7u4", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eglibc-source", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"glibc-doc", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-bin", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-dev-bin", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i386", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i686", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i386", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i686", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-loongson2f", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-pic", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-prof", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-xen", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales-all", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"multiarch-support", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nscd", ver:"2.13-38+deb7u4", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eglibc-source", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"glibc-doc", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-bin", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-dev-bin", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i386", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i686", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i386", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i686", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-loongson2f", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-pic", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-prof", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-xen", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales-all", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"multiarch-support", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nscd", ver:"2.13-38+deb7u4", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"eglibc-source", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"glibc-doc", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-bin", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc-dev-bin", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i386", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-i686", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc0.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-amd64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-i386", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-dev-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i386", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-i686", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-loongson2f", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mips64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-mipsn32", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-pic", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-ppc64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-prof", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-s390x", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-sparc64", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6-xen", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dbg", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-dev", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-pic", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libc6.1-prof", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"locales-all", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"multiarch-support", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nscd", ver:"2.13-38+deb7u4", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}