# OpenVAS Vulnerability Test
# $Id: ubuntu_855_1.nasl 6639 2017-07-10 10:52:06Z cfischer $
# Description: Auto-generated from advisory USN-855-1 (libhtml-parser-perl)
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
tag_solution = "The problem can be corrected by upgrading your system to the
 following package versions:

Ubuntu 6.06 LTS:
  libhtml-parser-perl             3.48-1ubuntu0.1

Ubuntu 8.04 LTS:
  libhtml-parser-perl             3.56-1ubuntu0.1

Ubuntu 8.10:
  libhtml-parser-perl             3.56-1ubuntu2.1

Ubuntu 9.04:
  libhtml-parser-perl             3.59-1ubuntu1.1

Ubuntu 9.10:
  libhtml-parser-perl             3.61-1ubuntu0.1

In general, a standard system upgrade is sufficient to effect the
necessary changes.

https://secure1.securityspace.com/smysecure/catid.html?in=USN-855-1";

tag_insight = "Mark Martinec discovered that HTML::Parser incorrectly handled strings
with incomplete entities. An attacker could send specially crafted input to
applications that use HTML::Parser and cause a denial of service.";
tag_summary = "The remote host is missing an update to libhtml-parser-perl
announced via advisory USN-855-1.";

                                                                                


if(description)
{
 script_id(66305);
 script_version("$Revision: 6639 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-10 12:52:06 +0200 (Mon, 10 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-11-23 20:51:51 +0100 (Mon, 23 Nov 2009)");
 script_cve_id("CVE-2009-3627");
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
 script_name("Ubuntu USN-855-1 (libhtml-parser-perl)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com");
 script_family("Ubuntu Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "solution" , value : tag_solution);
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
if ((res = isdpkgvuln(pkg:"libhtml-parser-perl", ver:"3.48-1ubuntu0.1", rls:"UBUNTU6.06 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhtml-parser-perl", ver:"3.56-1ubuntu0.1", rls:"UBUNTU8.04 LTS")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhtml-parser-perl", ver:"3.56-1ubuntu2.1", rls:"UBUNTU8.10")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhtml-parser-perl", ver:"3.59-1ubuntu1.1", rls:"UBUNTU9.04")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libhtml-parser-perl", ver:"3.61-1ubuntu0.1", rls:"UBUNTU9.10")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}