###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4071.nasl 14284 2019-03-18 15:02:15Z cfischer $
#
# Auto-generated from advisory DSA 4071-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704071");
  script_version("$Revision: 14284 $");
  script_cve_id("CVE-2017-17512");
  script_name("Debian Security Advisory DSA 4071-1 (sensible-utils - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 16:02:15 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2017-12-21 00:00:00 +0100 (Thu, 21 Dec 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4071.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(8|9)");
  script_tag(name:"affected", value:"sensible-utils on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 0.0.9+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 0.0.9+deb9u1.

We recommend that you upgrade your sensible-utils packages.

For the detailed security status of sensible-utils please refer to its
security tracker page linked in the references.");

  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/sensible-utils");
  script_tag(name:"summary", value:"Gabriel Corona reported that sensible-browser from sensible-utils, a
collection of small utilities used to sensibly select and spawn an
appropriate browser, editor or pager, does not validate strings before
launching the program specified by the BROWSER environment variable,
potentially allowing a remote attacker to conduct argument-injection
attacks if a user is tricked into processing a specially crafted URL.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"sensible-utils", ver:"0.0.9+deb8u1", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"sensible-utils", ver:"0.0.9+deb9u1", rls:"DEB9")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}