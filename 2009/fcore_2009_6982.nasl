# OpenVAS Vulnerability Test
# $Id: fcore_2009_6982.nasl 6624 2017-07-10 06:11:55Z cfischer $
# Description: Auto-generated from advisory FEDORA-2009-6982 (poppler)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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

include("revisions-lib.inc");
tag_insight = "Update Information:

An update to address jbig2-related security issues.

ChangeLog:

* Fri Jan 23 2009 Rex Dieter  - 0.8.7-2
- use backported jbig2_security patch from debian/ubuntu (#496943)
- poppler-data-0.2.1
- --enable-libjpeg (speed)
- track sonames
- patch to workaround okular rendering hyperlinks (#480357)";
tag_solution = "Apply the appropriate updates.

This update can be installed with the yum update program.  Use 
su -c 'yum update poppler' at the command line.
For more information, refer to Managing Software with yum,
available at http://docs.fedoraproject.org/yum/.

https://secure1.securityspace.com/smysecure/catid.html?in=FEDORA-2009-6982";
tag_summary = "The remote host is missing an update to poppler
announced via advisory FEDORA-2009-6982.";



if(description)
{
 script_id(64302);
 script_version("$Revision: 6624 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:11:55 +0200 (Mon, 10 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-06-30 00:29:55 +0200 (Tue, 30 Jun 2009)");
 script_cve_id("CVE-2008-2950", "CVE-2009-0146", "CVE-2009-0147", "CVE-2009-0166", "CVE-2009-0799", "CVE-2009-0800", "CVE-2009-1179", "CVE-2009-1180", "CVE-2009-1181", "CVE-2009-1182", "CVE-2009-1183", "CVE-2009-1187", "CVE-2009-1188");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("Fedora Core 9 FEDORA-2009-6982 (poppler)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com");
 script_family("Fedora Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=496943");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-rpm.inc");

res = "";
report = "";
if ((res = isrpmvuln(pkg:"poppler", rpm:"poppler~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-devel", rpm:"poppler-devel~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-glib", rpm:"poppler-glib~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-glib-devel", rpm:"poppler-glib-devel~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-qt", rpm:"poppler-qt~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-qt-devel", rpm:"poppler-qt-devel~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-qt4", rpm:"poppler-qt4~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-qt4-devel", rpm:"poppler-qt4-devel~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-utils", rpm:"poppler-utils~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}
if ((res = isrpmvuln(pkg:"poppler-debuginfo", rpm:"poppler-debuginfo~0.8.7~2.fc9", rls:"FC9")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}