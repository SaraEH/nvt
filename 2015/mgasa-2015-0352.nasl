# OpenVAS Vulnerability Test 
# Description: Mageia Linux security check 
# $Id: mgasa-2015-0352.nasl 7064 2017-09-06 05:47:54Z asteins $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://www.solinor.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.130035");
script_version("$Revision: 7064 $");
script_tag(name:"creation_date", value:"2015-10-15 10:41:50 +0300 (Thu, 15 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-09-06 07:47:54 +0200 (Wed, 06 Sep 2017) $");
script_name("Mageia Linux Local Check: mgasa-2015-0352");
script_tag(name: "insight", value: "Updated util-linux packages fix security vulnerability: The chfn and chsh commands in util-linux's login-utils are vulnerable to a file name collision due to incorrect mkstemp usage. If the chfn and chsh binaries are both setuid-root they eventually call mkostemp in such a way that an attacker could repeatedly call them and eventually be able to overwrite certain files in /etc (CVE-2015-5224)."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://advisories.mageia.org/MGASA-2015-0352.html");
script_cve_id("CVE-2015-5224");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/mageia_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name : "summary", value : "Mageia Linux Local Security Checks mgasa-2015-0352");
script_copyright("Eero Volotinen");
script_family("Mageia Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "MAGEIA5")
{
if ((res = isrpmvuln(pkg:"util-linux", rpm:"util-linux~2.25.2~3.1.mga5", rls:"MAGEIA5")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}