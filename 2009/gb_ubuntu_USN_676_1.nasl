###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for webkit vulnerability USN-676-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "It was discovered that WebKit did not properly handle Cascading Style Sheets
  (CSS) import statements. If a user were tricked into opening a malicious
  website, an attacker could cause a browser crash and possibly execute
  arbitrary code with user privileges.";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-676-1";
tag_affected = "webkit vulnerability on Ubuntu 8.10";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2008-November/000786.html");
  script_id(840221);
  script_version("$Revision: 6640 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 12:57:13 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2009-03-23 10:59:50 +0100 (Mon, 23 Mar 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "676-1");
  script_cve_id("CVE-2008-3632");
  script_name( "Ubuntu Update for webkit vulnerability USN-676-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "summary" , value : tag_summary);
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

if(release == "UBUNTU8.10")
{

  if ((res = isdpkgvuln(pkg:"libwebkit", ver:"1.0-1-dbg_1.0.1-2ubuntu0.1", rls:"UBUNTU8.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libwebkit", ver:"1.0-1_1.0.1-2ubuntu0.1", rls:"UBUNTU8.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libwebkit-dev", ver:"1.0.1-2ubuntu0.1", rls:"UBUNTU8.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}