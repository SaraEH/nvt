# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2007-0965.nasl 6561 2017-07-06 12:03:14Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.122635");
script_version("$Revision: 6561 $");
script_tag(name:"creation_date", value:"2015-10-08 14:49:55 +0300 (Thu, 08 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 14:03:14 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2007-0965");
script_tag(name: "insight", value: "ELSA-2007-0965 -  Moderate: ruby security update - [1.8.5-5.el5_1.1] - security fix for CVE-2007-5162 and CVE-2007-5770 - ruby-1.8.5-CVE-2007-5162.patch: fix issues that is insufficient verification of SSL certificate. (#320331) - Fix the multilib regression issue. [1.8.5-5] - security fix release. - ruby-1.8.5-cgi-CVE-2006-6303.patch: fix a infinite loop with certain HTTP request. (#218290) -------------- next part -------------- An HTML attachment was scrubbed... URL: http://oss.oracle.com/pipermail/el-errata/attachments/20071123/5e0ea409/attachment.html"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2007-0965");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2007-0965.html");
script_cve_id("CVE-2007-5162","CVE-2007-5770");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"ruby", rpm:"ruby~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-devel", rpm:"ruby-devel~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-docs", rpm:"ruby-docs~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-irb", rpm:"ruby-irb~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-libs", rpm:"ruby-libs~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-mode", rpm:"ruby-mode~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-rdoc", rpm:"ruby-rdoc~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-ri", rpm:"ruby-ri~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"ruby-tcltk", rpm:"ruby-tcltk~1.8.5~5.el5_1.1", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
