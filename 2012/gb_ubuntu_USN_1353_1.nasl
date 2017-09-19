###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for xulrunner-1.9.2 USN-1353-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Jesse Ruderman and Bob Clary discovered memory safety issues affecting the
  Gecko Browser engine. If the user were tricked into opening a specially
  crafted page, an attacker could exploit these to cause a denial of service
  via application crash, or potentially execute code with the privileges of
  the user invoking Xulrunner. (CVE-2012-0442)

  It was discovered that the Gecko Browser engine did not properly handle
  node removal in the DOM. If the user were tricked into opening a specially
  crafted page, an attacker could exploit this to cause a denial of service
  via application crash, or potentially execute code with the privileges of
  the user invoking Xulrunner. (CVE-2011-3659)

  It was discovered that memory corruption could occur during the decoding of
  Ogg Vorbis files. If the user were tricked into opening a specially crafted
  file, an attacker could exploit this to cause a denial of service via
  application crash, or potentially execute code with the privileges of the
  user invoking Xulrunner. (CVE-2012-0444)

  Nicolas Gregoire and Aki Helin discovered that when processing a malformed
  embedded XSLT stylesheet, Xulrunner can crash due to memory corruption. If
  the user were tricked into opening a specially crafted page, an attacker
  could exploit this to cause a denial of service via application crash, or
  potentially execute code with the privileges of the user invoking Xulrunner.
  (CVE-2012-0449)

  Gregory Fleischer discovered that requests using IPv6 hostname syntax
  through certain proxies might generate errors. An attacker might be able to
  use this to read sensitive data from the error messages. (CVE-2011-3670)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1353-1";
tag_affected = "xulrunner-1.9.2 on Ubuntu 10.10 ,
  Ubuntu 10.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-February/001579.html");
  script_id(840888);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-02-13 16:30:21 +0530 (Mon, 13 Feb 2012)");
  script_cve_id("CVE-2012-0442", "CVE-2011-3659", "CVE-2012-0444", "CVE-2012-0449", "CVE-2011-3670");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1353-1");
  script_name("Ubuntu Update for xulrunner-1.9.2 USN-1353-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"xulrunner-1.9.2", ver:"1.9.2.26+build2+nobinonly-0ubuntu0.10.04.1", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"xulrunner-1.9.2", ver:"1.9.2.26+build2+nobinonly-0ubuntu0.10.10.1", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}