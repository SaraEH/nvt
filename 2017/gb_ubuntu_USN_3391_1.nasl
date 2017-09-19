###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3391_1.nasl 6956 2017-08-18 06:02:43Z santu $
#
# Ubuntu Update for firefox USN-3391-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843283");
  script_version("$Revision: 6956 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-18 08:02:43 +0200 (Fri, 18 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-16 07:32:08 +0200 (Wed, 16 Aug 2017)");
  script_cve_id("CVE-2017-7753", "CVE-2017-7779", "CVE-2017-7780", "CVE-2017-7781",
                "CVE-2017-7783", "CVE-2017-7784", "CVE-2017-7785", "CVE-2017-7786",  
                "CVE-2017-7788", "CVE-2017-7789", "CVE-2017-7791", "CVE-2017-7792",   
                "CVE-2017-7797", "CVE-2017-7798", "CVE-2017-7799", "CVE-2017-7800",  
                "CVE-2017-7802", "CVE-2017-7803", "CVE-2017-7806", "CVE-2017-7807",  
                "CVE-2017-7809", "CVE-2017-7787", "CVE-2017-7794", "CVE-2017-7801",
                "CVE-2017-7808");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for firefox USN-3391-1");
  script_tag(name: "summary", value: "Check the version of firefox");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of 
  detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "Multiple security issues were discovered in 
  Firefox. If a user were tricked in to opening a specially crafted website, an 
  attacker could potentially exploit these to conduct cross-site scripting (XSS) 
  attacks, bypass sandbox restrictions, obtain sensitive information, spoof the 
  origin of modal alerts, bypass same origin restrictions, read uninitialized 
  memory, cause a denial of service via program crash or hang, or execute 
  arbitrary code. (CVE-2017-7753, CVE-2017-7779, CVE-2017-7780, CVE-2017-7781, 
  CVE-2017-7783, CVE-2017-7784, CVE-2017-7785, CVE-2017-7786, CVE-2017-7787, 
  CVE-2017-7788, CVE-2017-7789, CVE-2017-7791, CVE-2017-7792, CVE-2017-7794, 
  CVE-2017-7797, CVE-2017-7798, CVE-2017-7799, CVE-2017-7800, CVE-2017-7801, 
  CVE-2017-7802, CVE-2017-7803, CVE-2017-7806, CVE-2017-7807, CVE-2017-7808, 
  CVE-2017-7809)"); 
  script_tag(name: "affected", value: "firefox on Ubuntu 17.04 ,
  Ubuntu 16.04 LTS ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "3391-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-3391-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"55.0.1+build2-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"55.0.1+build2-0ubuntu0.17.04.2", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"firefox", ver:"55.0.1+build2-0ubuntu0.16.04.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}