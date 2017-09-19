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
tag_insight = "A debugging functionality in the X.Org X Server that is bound to a
    hotkey by default can be used by local attackers to circumvent screen
    locking utilities.";
tag_solution = "All xkeyboard-config users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=x11-misc/xkeyboard-config-2.4.1-r3'
    

NOTE: The X.Org X Server 1.11 was only stable on the AMD64, ARM, HPPA,
      and x86 architectures. Users of the stable branches of all other
      architectures are not affected and will be directly provided with a
fixed
      X Keyboard Configuration Database version.

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201201-16
http://bugs.gentoo.org/show_bug.cgi?id=399347";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 201201-16.";

                                                                                
                                                                                
if(description)
{
 script_id(70817);
 script_cve_id("CVE-2012-0064");
 script_tag(name:"cvss_base", value:"4.6");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
 script_version("$Revision: 6593 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:18:14 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-02-12 10:04:42 -0500 (Sun, 12 Feb 2012)");
 script_name("Gentoo Security Advisory GLSA 201201-16 (xkeyboard-config xorg-server)");



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
if((res = ispkgvuln(pkg:"x11-misc/xkeyboard-config", unaffected: make_list("ge 2.4.1-r3"), vulnerable: make_list("lt 2.4.1-r3"))) != NULL ) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}