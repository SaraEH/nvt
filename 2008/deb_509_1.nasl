# OpenVAS Vulnerability Test
# $Id: deb_509_1.nasl 6616 2017-07-07 12:10:49Z cfischer $
# Description: Auto-generated from advisory DSA 509-1
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2007 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largerly excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
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
tag_insight = "Steve Kemp discovered a vulnerability in xatitv, one of the programs
in the gatos package, which is used to display video with certain
ATI video cards.

xatitv is installed setuid root in order to gain direct access to the
video hardware.  It normally drops root privileges after successfully
initializing itself.  However, if initialization fails due to a
missing configuration file, root privileges are not dropped, and
xatitv executes the system(3) function to launch its configuration
program without sanitizing user-supplied environment variables.

By exploiting this vulnerability, a local user could gain root
privileges if the configuration file does not exist.  However, a
default configuration file is supplied with the package, and so this
vulnerability is not exploitable unless this file is removed by the
administrator.

For the current stable distribution (woody) this problem has been
fixed in version 0.0.5-6woody1.

For the unstable distribution (sid), this problem will be fixed soon.

We recommend that you update your gatos package.";
tag_summary = "The remote host is missing an update to gatos
announced via advisory DSA 509-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%20509-1";

if(description)
{
 script_id(53199);
 script_version("$Revision: 6616 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:10:49 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2008-01-17 22:45:44 +0100 (Thu, 17 Jan 2008)");
 script_bugtraq_id(10437);
 script_cve_id("CVE-2004-0395");
 script_tag(name:"cvss_base", value:"7.2");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
 script_name("Debian Security Advisory DSA 509-1 (gatos)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2005 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gatos", ver:"0.0.5-6woody1", rls:"DEB3.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgatos-dev", ver:"0.0.5-6woody1", rls:"DEB3.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgatos0", ver:"0.0.5-6woody1", rls:"DEB3.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}