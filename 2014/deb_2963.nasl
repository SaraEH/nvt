# OpenVAS Vulnerability Test
# $Id: deb_2963.nasl 6637 2017-07-10 09:58:13Z teissa $
# Auto-generated from advisory DSA 2963-1 using nvtgen 1.0
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

tag_affected  = "lucene-solr on Debian Linux";
tag_solution  = "For the stable distribution (wheezy), these problems have been fixed in
version 3.6.0+dfsg-1+deb7u1.

For the testing distribution (jessie), these problems have been fixed in
version 3.6.2+dfsg-2.

For the unstable distribution (sid), these problems have been fixed in
version 3.6.2+dfsg-2.

We recommend that you upgrade your lucene-solr packages.";
tag_summary   = "Multiple vulnerabilities were found in Solr, an open source enterprise
search server based on Lucene, resulting in information disclosure or
code execution.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(702963);
    script_version("$Revision: 6637 $");
    script_cve_id("CVE-2013-6397", "CVE-2013-6407", "CVE-2013-6408");
    script_name("Debian Security Advisory DSA 2963-1 (lucene-solr - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-10 11:58:13 +0200 (Mon, 10 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-06-17 00:00:00 +0200 (Tue, 17 Jun 2014)");
    script_tag(name:"cvss_base", value:"6.4");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2963.html");


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
if ((res = isdpkgvuln(pkg:"liblucene3-contrib-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java-doc", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsolr-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-common", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-jetty", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-tomcat", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-contrib-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java-doc", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsolr-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-common", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-jetty", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-tomcat", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-contrib-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java-doc", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsolr-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-common", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-jetty", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-tomcat", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-contrib-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblucene3-java-doc", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsolr-java", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-common", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-jetty", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"solr-tomcat", ver:"3.6.0+dfsg-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}