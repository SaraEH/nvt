###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3814_2.nasl 12497 2018-11-23 08:28:21Z cfischer $
#
# Ubuntu Update for clamav USN-3814-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.843815");
  script_version("$Revision: 12497 $");
  script_cve_id("CVE-2018-18584", "CVE-2018-18585");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-13 06:00:40 +0100 (Tue, 13 Nov 2018)");
  script_name("Ubuntu Update for clamav USN-3814-2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");

  script_xref(name:"USN", value:"3814-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3814-2/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'clamav'
  package(s) announced via the USN-3814-2 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-3814-1 fixed several vulnerabilities in libmspack. In Ubuntu
14.04
libmspack is included into ClamAV. This update provides the
corresponding update for Ubuntu 14.04 LTS.

Original advisory details:

It was discovered libmspack incorrectly handled certain malformed
CAB files.
A remote attacker could use this issue to cause libmspack to
crash, resulting
in a denial of service. (CVE-2018-18584, CVE-2018-18585)");

  script_tag(name:"affected", value:"clamav on Ubuntu 14.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"clamav", ver:"0.100.2+dfsg-1ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
