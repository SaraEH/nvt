# OpenVAS Vulnerability Test
# $Id: deb_3252.nasl 6609 2017-07-07 12:05:59Z cfischer $
# Auto-generated from advisory DSA 3252-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
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
    script_id(703252);
    script_version("$Revision: 6609 $");
    script_cve_id("CVE-2015-3414", "CVE-2015-3415", "CVE-2015-3416");
    script_name("Debian Security Advisory DSA 3252-1 (sqlite3 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:59 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2015-05-06 00:00:00 +0200 (Wed, 06 May 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3252.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "sqlite3 on Debian Linux");
        script_tag(name: "insight",   value: "SQLite is a C library that implements an SQL database engine.
Programs that link with the SQLite library can have SQL database
access without running a separate RDBMS process.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 3.8.7.1-1+deb8u1.

For the testing distribution (stretch), these problems have been fixed in
version 3.8.9-1.

For the unstable distribution (sid), these problems have been fixed in
version 3.8.9-1.

We recommend that you upgrade your sqlite3 packages.");
    script_tag(name: "summary",   value: "Michal Zalewski discovered multiple vulnerabilities in SQLite, which
may result in denial of service or the execution of arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"lemon", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-0", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-0-dbg", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-dev", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-tcl", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sqlite3", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sqlite3-doc", ver:"3.8.9-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lemon", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-0", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-0-dbg", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-dev", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsqlite3-tcl", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sqlite3", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sqlite3-doc", ver:"3.8.7.1-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}