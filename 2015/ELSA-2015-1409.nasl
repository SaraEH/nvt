# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-1409.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123062");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-10-06 13:58:52 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-1409");
script_tag(name: "insight", value: "ELSA-2015-1409 -  sudo security, bug fix, and enhancement update - [1.8.6p3-19]- RHEL-6.7 erratum - modified the authlogicfix patch to fix #1144448 - fixed a bug in the ldapusermatchfix patch Resolves: rhbz#1144448 Resolves: rhbz#1142122[1.8.6p3-18]- RHEL-6.7 erratum - fixed the mantypos-ldap.patch Resolves: rhbz#1138267[1.8.6p3-17]- RHEL-6.7 erratum - added patch for CVE-2014-9680 - added BuildRequires for tzdata Resolves: rhbz#1200253[1.8.6p3-16]- RHEL-6.7 erratum - added zlib-devel build required to enable zlib compression support - fixed two typos in the sudoers.ldap man page - fixed a hang when duplicate nss entries are specified in nsswitch.conf - SSSD: implemented sorting of the result entries according to the sudoOrder attribute - LDAP: fixed logic handling the computation of the 'user matched' flag - fixed restoring of the SIGPIPE signal in the tgetpass function - fixed listpw, verifypw + authenticate option logic in LDAP/SSSD Resolves: rhbz#1106433 Resolves: rhbz#1138267 Resolves: rhbz#1147498 Resolves: rhbz#1138581 Resolves: rhbz#1142122 Resolves: rhbz#1094548 Resolves: rhbz#1144448"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-1409");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-1409.html");
script_cve_id("CVE-2014-9680");
script_tag(name:"cvss_base", value:"2.1");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
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
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"sudo", rpm:"sudo~1.8.6p3~19.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"sudo-devel", rpm:"sudo-devel~1.8.6p3~19.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
