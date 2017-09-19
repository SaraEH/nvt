#
#VID d226626c-857f-11e0-95cc-001b2134ef46
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID d226626c-857f-11e0-95cc-001b2134ef46
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
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
tag_insight = "The following packages are affected:
   linux-flashplugin
   linux-f10-flashplugin

CVE-2011-0579
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to obtain
sensitive information via unspecified vectors.

CVE-2011-0618
Integer overflow in Adobe Flash Player before 10.3.181.14 on Windows,
Mac OS X, Linux, and Solaris and before 10.3.185.21 on Android allows
attackers to execute arbitrary code via unspecified vectors.

CVE-2011-0619
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code or cause a denial of service (memory corruption) via
unspecified vectors, a different vulnerability than CVE-2011-0620,

CVE-2011-0621, and CVE-2011-0622.
CVE-2011-0620
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code or cause a denial of service (memory corruption) via
unspecified vectors, a different vulnerability than CVE-2011-0619,

CVE-2011-0621, and CVE-2011-0622.
CVE-2011-0621
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code or cause a denial of service (memory corruption) via
unspecified vectors, a different vulnerability than CVE-2011-0619,

CVE-2011-0620, and CVE-2011-0622.
CVE-2011-0622
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code or cause a denial of service (memory corruption) via
unspecified vectors, a different vulnerability than CVE-2011-0619,

CVE-2011-0620, and CVE-2011-0621.
CVE-2011-0623
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code via unspecified vectors, related to a 'bounds checking'
issue, a different vulnerability than CVE-2011-0624, CVE-2011-0625,
and CVE-2011-0626.

CVE-2011-0624
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code via unspecified vectors, related to a 'bounds checking'
issue, a different vulnerability than CVE-2011-0623, CVE-2011-0625,
and CVE-2011-0626.

CVE-2011-0625
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code via unspecified vectors, related to a 'bounds checking'
issue, a different vulnerability than CVE-2011-0623, CVE-2011-0624,
and CVE-2011-0626.

CVE-2011-0626
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows attackers to execute
arbitrary code via unspecified vectors, related to a 'bounds checking'
issue, a different vulnerability than CVE-2011-0623, CVE-2011-0624,
and CVE-2011-0625.

CVE-2011-0627
Adobe Flash Player before 10.3.181.14 on Windows, Mac OS X, Linux, and
Solaris and before 10.3.185.21 on Android allows remote attackers to
execute arbitrary code or cause a denial of service (memory
corruption) via crafted Flash content, as possibly exploited in the
wild in May 2011 by a Microsoft Office document with an embedded .swf
file.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.adobe.com/support/security/bulletins/apsb11-12.html
http://www.vuxml.org/freebsd/d226626c-857f-11e0-95cc-001b2134ef46.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(69763);
 script_version("$Revision: 5424 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-25 17:52:36 +0100 (Sat, 25 Feb 2017) $");
 script_tag(name:"creation_date", value:"2011-08-03 04:36:20 +0200 (Wed, 03 Aug 2011)");
 script_cve_id("CVE-2011-0579", "CVE-2011-0618", "CVE-2011-0619", "CVE-2011-0620", "CVE-2011-0621", "CVE-2011-0622", "CVE-2011-0623", "CVE-2011-0624", "CVE-2011-0625", "CVE-2011-0626", "CVE-2011-0627");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_name("FreeBSD Ports: linux-flashplugin");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
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

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"linux-flashplugin");
if(!isnull(bver) && revcomp(a:bver, b:"9.0r289")<=0) {
    txt += 'Package linux-flashplugin version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"linux-f10-flashplugin");
if(!isnull(bver) && revcomp(a:bver, b:"10.3r181.14")<0) {
    txt += 'Package linux-f10-flashplugin version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}