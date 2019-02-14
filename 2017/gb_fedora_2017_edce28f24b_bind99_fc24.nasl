###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for bind99 FEDORA-2017-edce28f24b
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.872643");
  script_version("$Revision: 13654 $");
  script_tag(name:"last_modification", value:"$Date: 2019-02-14 08:51:59 +0100 (Thu, 14 Feb 2019) $");
  script_tag(name:"creation_date", value:"2017-05-07 07:11:30 +0200 (Sun, 07 May 2017)");
  script_cve_id("CVE-2017-3136", "CVE-2017-3137", "CVE-2017-3138");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for bind99 FEDORA-2017-edce28f24b");
  script_tag(name: "summary", value: "Check the version of bind99");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "BIND (Berkeley Internet Name Domain) is an 
  implementation of the DNS (Domain Name System) protocols. This package set 
  contains only export version of BIND libraries, that are used for building ISC 
  DHCP. "); 
  script_tag(name: "affected", value: "bind99 on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-edce28f24b");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RD4BXVVJ5YZSCK6VBKFMK654WPMFI7AF");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"bind99", rpm:"bind99~9.9.9~4.P8.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}