#
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from Gentoo's XML based advisory
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
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
tag_insight = "A buffer overflow in socat might allow remote attackers to execute
    arbitrary code.";
tag_solution = "All socat users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=net-misc/socat-1.7.2.1'
    

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201208-01
http://bugs.gentoo.org/show_bug.cgi?id=415977
http://www.dest-unreach.org/socat/contrib/socat-secadv3.html";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 201208-01.";

                                                                                
                                                                                
if(description)
{
 script_id(71851);
 script_tag(name:"cvss_base", value:"6.2");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2012-0219");
 script_version("$Revision: 6589 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 10:27:50 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-08-30 11:34:52 -0400 (Thu, 30 Aug 2012)");
 script_name("Gentoo Security Advisory GLSA 201208-01 (socat)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Gentoo Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-gentoo.inc");
res = "";
report = "";
if((res = ispkgvuln(pkg:"net-misc/socat", unaffected: make_list("ge 1.7.2.1"), vulnerable: make_list("lt 1.7.2.1"))) != NULL ) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}