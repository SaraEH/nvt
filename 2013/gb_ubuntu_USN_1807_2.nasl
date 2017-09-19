###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for mysql-5.5 USN-1807-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "USN-1807-1 fixed vulnerabilities in MySQL. This update provides
  MySQL 5.5.31 for Ubuntu 13.04.

  Original advisory details:

  Multiple security issues were discovered in MySQL and this update includes
  new upstream MySQL versions to fix these issues.

  MySQL has been updated to 5.1.69 in Ubuntu 10.04 LTS and Ubuntu 11.10.
  Ubuntu 12.04 LTS and Ubuntu 12.10 have been updated to MySQL 5.5.31.

  In addition to security fixes, the updated packages contain bug fixes,
  new features, and possibly incompatible changes.

  Please see the following for more information:
  http://dev.mysql.com/doc/relnotes/mysql/5.1/en/news-5-1-69.html
  http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-31.html
  http://www.oracle.com/technetwork/topics/security/cpuapr2013-1899555.html";


tag_affected = "mysql-5.5 on Ubuntu 13.04";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_id(841410);
  script_version("$Revision: 6644 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:01:20 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-06-14 12:49:04 +0530 (Fri, 14 Jun 2013)");
  script_cve_id("CVE-2012-0553", "CVE-2013-1492", "CVE-2013-1502", "CVE-2013-1506",
                "CVE-2013-1511", "CVE-2013-1512", "CVE-2013-1521", "CVE-2013-1523",
                "CVE-2013-1526", "CVE-2013-1532", "CVE-2013-1544", "CVE-2013-1552",
                "CVE-2013-1555", "CVE-2013-1623", "CVE-2013-2375", "CVE-2013-2376",
                "CVE-2013-2378", "CVE-2013-2389", "CVE-2013-2391", "CVE-2013-2392");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Ubuntu Update for mysql-5.5 USN-1807-2");

  script_xref(name: "USN", value: "1807-2");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2013-April/002091.html");
  script_summary("Check for the Version of mysql-5.5");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU13.04")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.31-0ubuntu0.13.04.1", rls:"UBUNTU13.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}